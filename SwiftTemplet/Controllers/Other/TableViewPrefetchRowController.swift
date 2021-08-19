//
//  TableViewPrefetchRowController.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2020/4/13.
//  Copyright © 2020 BN. All rights reserved.
//

import UIKit


struct PrefetchModel {
    let urlString: String
    lazy var url: URL = {
        // I know it's unsafe.
        return URL(string: self.urlString)!
    }()
    var image: UIImage?

    init(urlString: String) {
        self.urlString = urlString
    }
}


@available(iOS 10.0, *)
class TableViewPrefetchRowController: UIViewController {
    
    lazy var tableView: UITableView = {
        let view = UITableView(rect: self.view.bounds, style: .plain, rowHeight: 100)
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    var items =
        [PrefetchModel(urlString: "http://www.gstatic.com/webp/gallery/1.jpg"),
         PrefetchModel(urlString: "http://www.gstatic.com/webp/gallery/2.jpg"),
         PrefetchModel(urlString: "http://www.gstatic.com/webp/gallery/3.jpg"),
         PrefetchModel(urlString: "http://www.gstatic.com/webp/gallery/4.jpg"),
         PrefetchModel(urlString: "http://www.gstatic.com/webp/gallery/5.jpg"),
         PrefetchModel(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_06_l.jpg"),
         PrefetchModel(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_07_l.jpg"),
         PrefetchModel(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_08_l.jpg"),
         PrefetchModel(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_09_l.jpg"),
         PrefetchModel(urlString: "http://imgsv.imaging.nikon.com/lineup/coolpix/a/a/img/sample/img_10_l.jpg"),
         PrefetchModel(urlString: "https://www.gstatic.com/webp/gallery3/1.png"),
         PrefetchModel(urlString: "https://www.gstatic.com/webp/gallery3/2.png"),
         PrefetchModel(urlString: "https://www.gstatic.com/webp/gallery3/3.png"),
         PrefetchModel(urlString: "https://www.gstatic.com/webp/gallery3/4.png"),
         PrefetchModel(urlString: "https://www.gstatic.com/webp/gallery3/5.png")]

    /// We store all ongoing tasks here to avoid duplicating tasks.
    fileprivate var tasks = [URLSessionTask]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.prefetchDataSource = self
        
        view.addSubview(tableView)
    }

    // MARK: - Image downloading

    fileprivate func downloadImage(forItemAtIndex index: Int) {
        let url = items[index].url
        guard tasks.firstIndex(where: { $0.originalRequest?.url == url }) == nil else {
            // We're already downloading the image.
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let image = UIImage(data: data) {
                    self.items[index].image = image
                    let indexPath = IndexPath(row: index, section: 0)
                    if self.tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
                        self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
                    }
                }
            }
        }
        task.resume()
        tasks.append(task)
    }

    fileprivate func cancelDownloadingImage(forItemAtIndex index: Int) {
        let url = items[index].url
        guard let taskIndex = tasks.firstIndex(where: { $0.originalRequest?.url == url }) else {
            return
        }
        let task = tasks[taskIndex]
        task.cancel()
        tasks.remove(at: taskIndex)
    }
}

// MARK: - UITableViewDataSource
@available(iOS 10.0, *)
extension TableViewPrefetchRowController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: UITableViewCell.self)

        if let imageView = cell.imageView {
            if let image = items[indexPath.row].image {
                imageView.image = image
            } else {
                imageView.image = nil
                self.downloadImage(forItemAtIndex: indexPath.row)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(#function)_\(indexPath.row)")
    }
}

// MARK: - UITableViewDataSourcePrefetching
@available(iOS 10.0, *)
extension TableViewPrefetchRowController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("prefetchRowsAt \(indexPaths)")
        indexPaths.forEach { self.downloadImage(forItemAtIndex: $0.row) }
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        print("cancelPrefetchingForRowsAt \(indexPaths)")
        indexPaths.forEach { self.cancelDownloadingImage(forItemAtIndex: $0.row) }
    }
}
