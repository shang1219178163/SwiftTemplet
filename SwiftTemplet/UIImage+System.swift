//
//  UIImage+System.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/18.
//  Copyright © 2021 BN. All rights reserved.
//
//SF Symbols 3 beta(https://developer.apple.com/sf-symbols/)

/*
@objc public extension UIImage{

    var assetName: String? {
        guard let imageAsset = imageAsset else { return nil }
        return imageAsset.value(forKey:"assetName") as? String
    }
}
*/


@available(iOS 13.0, *)
@objc public extension UIImage{
	/// square.and.arrow.up
	static let square_and_arrow_up = UIImage(systemName: "square.and.arrow.up")

	/// square.and.arrow.up.fill
	static let square_and_arrow_up_fill = UIImage(systemName: "square.and.arrow.up.fill")

	/// square.and.arrow.up.trianglebadge.exclamationmark
	static let square_and_arrow_up_trianglebadge_exclamationmark = UIImage(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")

	/// square.and.arrow.down
	static let square_and_arrow_down = UIImage(systemName: "square.and.arrow.down")

	/// square.and.arrow.down.fill
	static let square_and_arrow_down_fill = UIImage(systemName: "square.and.arrow.down.fill")

	/// square.and.arrow.up.on.square
	static let square_and_arrow_up_on_square = UIImage(systemName: "square.and.arrow.up.on.square")

	/// square.and.arrow.up.on.square.fill
	static let square_and_arrow_up_on_square_fill = UIImage(systemName: "square.and.arrow.up.on.square.fill")

	/// square.and.arrow.down.on.square
	static let square_and_arrow_down_on_square = UIImage(systemName: "square.and.arrow.down.on.square")

	/// square.and.arrow.down.on.square.fill
	static let square_and_arrow_down_on_square_fill = UIImage(systemName: "square.and.arrow.down.on.square.fill")

	/// rectangle.portrait.and.arrow.right
	static let rectangle_portrait_and_arrow_right = UIImage(systemName: "rectangle.portrait.and.arrow.right")

	/// rectangle.portrait.and.arrow.right.fill
	static let rectangle_portrait_and_arrow_right_fill = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")

	/// pencil
	static let pencil = UIImage(systemName: "pencil")

	/// pencil.circle
	static let pencil_circle = UIImage(systemName: "pencil.circle")

	/// pencil.circle.fill
	static let pencil_circle_fill = UIImage(systemName: "pencil.circle.fill")

	/// pencil.slash
	static let pencil_slash = UIImage(systemName: "pencil.slash")

	/// square.and.pencil
	static let square_and_pencil = UIImage(systemName: "square.and.pencil")

	/// rectangle.and.pencil.and.ellipsis
	static let rectangle_and_pencil_and_ellipsis = UIImage(systemName: "rectangle.and.pencil.and.ellipsis")

	/// scribble
	static let scribble = UIImage(systemName: "scribble")

	/// scribble.variable
	static let scribble_variable = UIImage(systemName: "scribble.variable")

	/// highlighter
	static let highlighter = UIImage(systemName: "highlighter")

	/// pencil.and.outline
	static let pencil_and_outline = UIImage(systemName: "pencil.and.outline")

	/// pencil.tip
	static let pencil_tip = UIImage(systemName: "pencil.tip")

	/// pencil.tip.crop.circle
	static let pencil_tip_crop_circle = UIImage(systemName: "pencil.tip.crop.circle")

	/// pencil.tip.crop.circle.badge.plus
	static let pencil_tip_crop_circle_badge_plus = UIImage(systemName: "pencil.tip.crop.circle.badge.plus")

	/// pencil.tip.crop.circle.badge.minus
	static let pencil_tip_crop_circle_badge_minus = UIImage(systemName: "pencil.tip.crop.circle.badge.minus")

	/// pencil.tip.crop.circle.badge.arrow.forward
	static let pencil_tip_crop_circle_badge_arrow_forward = UIImage(systemName: "pencil.tip.crop.circle.badge.arrow.forward")

	/// lasso
	static let lasso = UIImage(systemName: "lasso")

	/// lasso.and.sparkles
	static let lasso_and_sparkles = UIImage(systemName: "lasso.and.sparkles")

	/// trash
	static let trash = UIImage(systemName: "trash")

	/// trash.fill
	static let trash_fill = UIImage(systemName: "trash.fill")

	/// trash.circle
	static let trash_circle = UIImage(systemName: "trash.circle")

	/// trash.circle.fill
	static let trash_circle_fill = UIImage(systemName: "trash.circle.fill")

	/// trash.square
	static let trash_square = UIImage(systemName: "trash.square")

	/// trash.square.fill
	static let trash_square_fill = UIImage(systemName: "trash.square.fill")

	/// trash.slash
	static let trash_slash = UIImage(systemName: "trash.slash")

	/// trash.slash.fill
	static let trash_slash_fill = UIImage(systemName: "trash.slash.fill")

	/// trash.slash.circle
	static let trash_slash_circle = UIImage(systemName: "trash.slash.circle")

	/// trash.slash.circle.fill
	static let trash_slash_circle_fill = UIImage(systemName: "trash.slash.circle.fill")

	/// trash.slash.square
	static let trash_slash_square = UIImage(systemName: "trash.slash.square")

	/// trash.slash.square.fill
	static let trash_slash_square_fill = UIImage(systemName: "trash.slash.square.fill")

	/// folder
	static let folder = UIImage(systemName: "folder")

	/// folder.fill
	static let folder_fill = UIImage(systemName: "folder.fill")

	/// folder.circle
	static let folder_circle = UIImage(systemName: "folder.circle")

	/// folder.circle.fill
	static let folder_circle_fill = UIImage(systemName: "folder.circle.fill")

	/// folder.badge.plus
	static let folder_badge_plus = UIImage(systemName: "folder.badge.plus")

	/// folder.fill.badge.plus
	static let folder_fill_badge_plus = UIImage(systemName: "folder.fill.badge.plus")

	/// folder.badge.minus
	static let folder_badge_minus = UIImage(systemName: "folder.badge.minus")

	/// folder.fill.badge.minus
	static let folder_fill_badge_minus = UIImage(systemName: "folder.fill.badge.minus")

	/// folder.badge.questionmark
	static let folder_badge_questionmark = UIImage(systemName: "folder.badge.questionmark")

	/// folder.fill.badge.questionmark
	static let folder_fill_badge_questionmark = UIImage(systemName: "folder.fill.badge.questionmark")

	/// folder.badge.person.crop
	static let folder_badge_person_crop = UIImage(systemName: "folder.badge.person.crop")

	/// folder.fill.badge.person.crop
	static let folder_fill_badge_person_crop = UIImage(systemName: "folder.fill.badge.person.crop")

	/// square.grid.3x1.folder.badge.plus
	static let square_grid_3x1_folder_badge_plus = UIImage(systemName: "square.grid.3x1.folder.badge.plus")

	/// square.grid.3x1.folder.fill.badge.plus
	static let square_grid_3x1_folder_fill_badge_plus = UIImage(systemName: "square.grid.3x1.folder.fill.badge.plus")

	/// folder.badge.gearshape
	static let folder_badge_gearshape = UIImage(systemName: "folder.badge.gearshape")

	/// folder.fill.badge.gearshape
	static let folder_fill_badge_gearshape = UIImage(systemName: "folder.fill.badge.gearshape")

	/// plus.rectangle.on.folder
	static let plus_rectangle_on_folder = UIImage(systemName: "plus.rectangle.on.folder")

	/// plus.rectangle.on.folder.fill
	static let plus_rectangle_on_folder_fill = UIImage(systemName: "plus.rectangle.on.folder.fill")

	/// questionmark.folder
	static let questionmark_folder = UIImage(systemName: "questionmark.folder")

	/// questionmark.folder.fill
	static let questionmark_folder_fill = UIImage(systemName: "questionmark.folder.fill")

	/// paperplane
	static let paperplane = UIImage(systemName: "paperplane")

	/// paperplane.fill
	static let paperplane_fill = UIImage(systemName: "paperplane.fill")

	/// paperplane.circle
	static let paperplane_circle = UIImage(systemName: "paperplane.circle")

	/// paperplane.circle.fill
	static let paperplane_circle_fill = UIImage(systemName: "paperplane.circle.fill")

	/// tray
	static let tray = UIImage(systemName: "tray")

	/// tray.fill
	static let tray_fill = UIImage(systemName: "tray.fill")

	/// tray.circle
	static let tray_circle = UIImage(systemName: "tray.circle")

	/// tray.circle.fill
	static let tray_circle_fill = UIImage(systemName: "tray.circle.fill")

	/// tray.and.arrow.up
	static let tray_and_arrow_up = UIImage(systemName: "tray.and.arrow.up")

	/// tray.and.arrow.up.fill
	static let tray_and_arrow_up_fill = UIImage(systemName: "tray.and.arrow.up.fill")

	/// tray.and.arrow.down
	static let tray_and_arrow_down = UIImage(systemName: "tray.and.arrow.down")

	/// tray.and.arrow.down.fill
	static let tray_and_arrow_down_fill = UIImage(systemName: "tray.and.arrow.down.fill")

	/// tray.2
	static let tray_2 = UIImage(systemName: "tray.2")

	/// tray.2.fill
	static let tray_2_fill = UIImage(systemName: "tray.2.fill")

	/// tray.full
	static let tray_full = UIImage(systemName: "tray.full")

	/// tray.full.fill
	static let tray_full_fill = UIImage(systemName: "tray.full.fill")

	/// externaldrive
	static let externaldrive = UIImage(systemName: "externaldrive")

	/// externaldrive.fill
	static let externaldrive_fill = UIImage(systemName: "externaldrive.fill")

	/// externaldrive.badge.plus
	static let externaldrive_badge_plus = UIImage(systemName: "externaldrive.badge.plus")

	/// externaldrive.fill.badge.plus
	static let externaldrive_fill_badge_plus = UIImage(systemName: "externaldrive.fill.badge.plus")

	/// externaldrive.badge.minus
	static let externaldrive_badge_minus = UIImage(systemName: "externaldrive.badge.minus")

	/// externaldrive.fill.badge.minus
	static let externaldrive_fill_badge_minus = UIImage(systemName: "externaldrive.fill.badge.minus")

	/// externaldrive.badge.checkmark
	static let externaldrive_badge_checkmark = UIImage(systemName: "externaldrive.badge.checkmark")

	/// externaldrive.fill.badge.checkmark
	static let externaldrive_fill_badge_checkmark = UIImage(systemName: "externaldrive.fill.badge.checkmark")

	/// externaldrive.badge.xmark
	static let externaldrive_badge_xmark = UIImage(systemName: "externaldrive.badge.xmark")

	/// externaldrive.fill.badge.xmark
	static let externaldrive_fill_badge_xmark = UIImage(systemName: "externaldrive.fill.badge.xmark")

	/// externaldrive.badge.person.crop
	static let externaldrive_badge_person_crop = UIImage(systemName: "externaldrive.badge.person.crop")

	/// externaldrive.fill.badge.person.crop
	static let externaldrive_fill_badge_person_crop = UIImage(systemName: "externaldrive.fill.badge.person.crop")

	/// externaldrive.badge.icloud
	static let externaldrive_badge_icloud = UIImage(systemName: "externaldrive.badge.icloud")

	/// externaldrive.fill.badge.icloud
	static let externaldrive_fill_badge_icloud = UIImage(systemName: "externaldrive.fill.badge.icloud")

	/// externaldrive.badge.wifi
	static let externaldrive_badge_wifi = UIImage(systemName: "externaldrive.badge.wifi")

	/// externaldrive.fill.badge.wifi
	static let externaldrive_fill_badge_wifi = UIImage(systemName: "externaldrive.fill.badge.wifi")

	/// externaldrive.badge.timemachine
	static let externaldrive_badge_timemachine = UIImage(systemName: "externaldrive.badge.timemachine")

	/// externaldrive.fill.badge.timemachine
	static let externaldrive_fill_badge_timemachine = UIImage(systemName: "externaldrive.fill.badge.timemachine")

	/// internaldrive
	static let internaldrive = UIImage(systemName: "internaldrive")

	/// internaldrive.fill
	static let internaldrive_fill = UIImage(systemName: "internaldrive.fill")

	/// opticaldiscdrive
	static let opticaldiscdrive = UIImage(systemName: "opticaldiscdrive")

	/// opticaldiscdrive.fill
	static let opticaldiscdrive_fill = UIImage(systemName: "opticaldiscdrive.fill")

	/// externaldrive.connected.to.line.below
	static let externaldrive_connected_to_line_below = UIImage(systemName: "externaldrive.connected.to.line.below")

	/// externaldrive.connected.to.line.below.fill
	static let externaldrive_connected_to_line_below_fill = UIImage(systemName: "externaldrive.connected.to.line.below.fill")

	/// archivebox
	static let archivebox = UIImage(systemName: "archivebox")

	/// archivebox.fill
	static let archivebox_fill = UIImage(systemName: "archivebox.fill")

	/// archivebox.circle
	static let archivebox_circle = UIImage(systemName: "archivebox.circle")

	/// archivebox.circle.fill
	static let archivebox_circle_fill = UIImage(systemName: "archivebox.circle.fill")

	/// xmark.bin
	static let xmark_bin = UIImage(systemName: "xmark.bin")

	/// xmark.bin.fill
	static let xmark_bin_fill = UIImage(systemName: "xmark.bin.fill")

	/// xmark.bin.circle
	static let xmark_bin_circle = UIImage(systemName: "xmark.bin.circle")

	/// xmark.bin.circle.fill
	static let xmark_bin_circle_fill = UIImage(systemName: "xmark.bin.circle.fill")

	/// arrow.up.bin
	static let arrow_up_bin = UIImage(systemName: "arrow.up.bin")

	/// arrow.up.bin.fill
	static let arrow_up_bin_fill = UIImage(systemName: "arrow.up.bin.fill")

	/// doc
	static let doc = UIImage(systemName: "doc")

	/// doc.fill
	static let doc_fill = UIImage(systemName: "doc.fill")

	/// doc.circle
	static let doc_circle = UIImage(systemName: "doc.circle")

	/// doc.circle.fill
	static let doc_circle_fill = UIImage(systemName: "doc.circle.fill")

	/// doc.badge.plus
	static let doc_badge_plus = UIImage(systemName: "doc.badge.plus")

	/// doc.fill.badge.plus
	static let doc_fill_badge_plus = UIImage(systemName: "doc.fill.badge.plus")

	/// doc.badge.gearshape
	static let doc_badge_gearshape = UIImage(systemName: "doc.badge.gearshape")

	/// doc.badge.gearshape.fill
	static let doc_badge_gearshape_fill = UIImage(systemName: "doc.badge.gearshape.fill")

	/// doc.badge.ellipsis
	static let doc_badge_ellipsis = UIImage(systemName: "doc.badge.ellipsis")

	/// doc.fill.badge.ellipsis
	static let doc_fill_badge_ellipsis = UIImage(systemName: "doc.fill.badge.ellipsis")

	/// lock.doc
	static let lock_doc = UIImage(systemName: "lock.doc")

	/// lock.doc.fill
	static let lock_doc_fill = UIImage(systemName: "lock.doc.fill")

	/// arrow.up.doc
	static let arrow_up_doc = UIImage(systemName: "arrow.up.doc")

	/// arrow.up.doc.fill
	static let arrow_up_doc_fill = UIImage(systemName: "arrow.up.doc.fill")

	/// arrow.down.doc
	static let arrow_down_doc = UIImage(systemName: "arrow.down.doc")

	/// arrow.down.doc.fill
	static let arrow_down_doc_fill = UIImage(systemName: "arrow.down.doc.fill")

	/// doc.text
	static let doc_text = UIImage(systemName: "doc.text")

	/// doc.text.fill
	static let doc_text_fill = UIImage(systemName: "doc.text.fill")

	/// doc.zipper
	static let doc_zipper = UIImage(systemName: "doc.zipper")

	/// doc.on.doc
	static let doc_on_doc = UIImage(systemName: "doc.on.doc")

	/// doc.on.doc.fill
	static let doc_on_doc_fill = UIImage(systemName: "doc.on.doc.fill")

	/// doc.on.clipboard
	static let doc_on_clipboard = UIImage(systemName: "doc.on.clipboard")

	/// arrow.right.doc.on.clipboard
	static let arrow_right_doc_on_clipboard = UIImage(systemName: "arrow.right.doc.on.clipboard")

	/// arrow.up.doc.on.clipboard
	static let arrow_up_doc_on_clipboard = UIImage(systemName: "arrow.up.doc.on.clipboard")

	/// arrow.triangle.2.circlepath.doc.on.clipboard
	static let arrow_triangle_2_circlepath_doc_on_clipboard = UIImage(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")

	/// doc.on.clipboard.fill
	static let doc_on_clipboard_fill = UIImage(systemName: "doc.on.clipboard.fill")

	/// doc.richtext
	static let doc_richtext = UIImage(systemName: "doc.richtext")

	/// doc.richtext.fill
	static let doc_richtext_fill = UIImage(systemName: "doc.richtext.fill")

	/// doc.plaintext
	static let doc_plaintext = UIImage(systemName: "doc.plaintext")

	/// doc.plaintext.fill
	static let doc_plaintext_fill = UIImage(systemName: "doc.plaintext.fill")

	/// doc.append
	static let doc_append = UIImage(systemName: "doc.append")

	/// doc.append.fill
	static let doc_append_fill = UIImage(systemName: "doc.append.fill")

	/// doc.text.below.ecg
	static let doc_text_below_ecg = UIImage(systemName: "doc.text.below.ecg")

	/// doc.text.below.ecg.fill
	static let doc_text_below_ecg_fill = UIImage(systemName: "doc.text.below.ecg.fill")

	/// chart.bar.doc.horizontal
	static let chart_bar_doc_horizontal = UIImage(systemName: "chart.bar.doc.horizontal")

	/// chart.bar.doc.horizontal.fill
	static let chart_bar_doc_horizontal_fill = UIImage(systemName: "chart.bar.doc.horizontal.fill")

	/// list.bullet.rectangle.portrait
	static let list_bullet_rectangle_portrait = UIImage(systemName: "list.bullet.rectangle.portrait")

	/// list.bullet.rectangle.portrait.fill
	static let list_bullet_rectangle_portrait_fill = UIImage(systemName: "list.bullet.rectangle.portrait.fill")

	/// doc.text.magnifyingglass
	static let doc_text_magnifyingglass = UIImage(systemName: "doc.text.magnifyingglass")

	/// list.bullet.rectangle
	static let list_bullet_rectangle = UIImage(systemName: "list.bullet.rectangle")

	/// list.bullet.rectangle.fill
	static let list_bullet_rectangle_fill = UIImage(systemName: "list.bullet.rectangle.fill")

	/// list.dash.header.rectangle
	static let list_dash_header_rectangle = UIImage(systemName: "list.dash.header.rectangle")

	/// terminal
	static let terminal = UIImage(systemName: "terminal")

	/// terminal.fill
	static let terminal_fill = UIImage(systemName: "terminal.fill")

	/// note
	static let note = UIImage(systemName: "note")

	/// note.text
	static let note_text = UIImage(systemName: "note.text")

	/// note.text.badge.plus
	static let note_text_badge_plus = UIImage(systemName: "note.text.badge.plus")

	/// calendar
	static let calendar = UIImage(systemName: "calendar")

	/// calendar.circle
	static let calendar_circle = UIImage(systemName: "calendar.circle")

	/// calendar.circle.fill
	static let calendar_circle_fill = UIImage(systemName: "calendar.circle.fill")

	/// calendar.badge.plus
	static let calendar_badge_plus = UIImage(systemName: "calendar.badge.plus")

	/// calendar.badge.minus
	static let calendar_badge_minus = UIImage(systemName: "calendar.badge.minus")

	/// calendar.badge.clock
	static let calendar_badge_clock = UIImage(systemName: "calendar.badge.clock")

	/// calendar.badge.exclamationmark
	static let calendar_badge_exclamationmark = UIImage(systemName: "calendar.badge.exclamationmark")

	/// calendar.day.timeline.left
	static let calendar_day_timeline_left = UIImage(systemName: "calendar.day.timeline.left")

	/// calendar.day.timeline.right
	static let calendar_day_timeline_right = UIImage(systemName: "calendar.day.timeline.right")

	/// calendar.day.timeline.leading
	static let calendar_day_timeline_leading = UIImage(systemName: "calendar.day.timeline.leading")

	/// calendar.day.timeline.trailing
	static let calendar_day_timeline_trailing = UIImage(systemName: "calendar.day.timeline.trailing")

	/// arrowshape.turn.up.left
	static let arrowshape_turn_up_left = UIImage(systemName: "arrowshape.turn.up.left")

	/// arrowshape.turn.up.left.fill
	static let arrowshape_turn_up_left_fill = UIImage(systemName: "arrowshape.turn.up.left.fill")

	/// arrowshape.turn.up.left.circle
	static let arrowshape_turn_up_left_circle = UIImage(systemName: "arrowshape.turn.up.left.circle")

	/// arrowshape.turn.up.left.circle.fill
	static let arrowshape_turn_up_left_circle_fill = UIImage(systemName: "arrowshape.turn.up.left.circle.fill")

	/// arrowshape.turn.up.backward
	static let arrowshape_turn_up_backward = UIImage(systemName: "arrowshape.turn.up.backward")

	/// arrowshape.turn.up.backward.fill
	static let arrowshape_turn_up_backward_fill = UIImage(systemName: "arrowshape.turn.up.backward.fill")

	/// arrowshape.turn.up.backward.circle
	static let arrowshape_turn_up_backward_circle = UIImage(systemName: "arrowshape.turn.up.backward.circle")

	/// arrowshape.turn.up.backward.circle.fill
	static let arrowshape_turn_up_backward_circle_fill = UIImage(systemName: "arrowshape.turn.up.backward.circle.fill")

	/// arrowshape.turn.up.right
	static let arrowshape_turn_up_right = UIImage(systemName: "arrowshape.turn.up.right")

	/// arrowshape.turn.up.right.fill
	static let arrowshape_turn_up_right_fill = UIImage(systemName: "arrowshape.turn.up.right.fill")

	/// arrowshape.turn.up.right.circle
	static let arrowshape_turn_up_right_circle = UIImage(systemName: "arrowshape.turn.up.right.circle")

	/// arrowshape.turn.up.right.circle.fill
	static let arrowshape_turn_up_right_circle_fill = UIImage(systemName: "arrowshape.turn.up.right.circle.fill")

	/// arrowshape.turn.up.forward
	static let arrowshape_turn_up_forward = UIImage(systemName: "arrowshape.turn.up.forward")

	/// arrowshape.turn.up.forward.fill
	static let arrowshape_turn_up_forward_fill = UIImage(systemName: "arrowshape.turn.up.forward.fill")

	/// arrowshape.turn.up.forward.circle
	static let arrowshape_turn_up_forward_circle = UIImage(systemName: "arrowshape.turn.up.forward.circle")

	/// arrowshape.turn.up.forward.circle.fill
	static let arrowshape_turn_up_forward_circle_fill = UIImage(systemName: "arrowshape.turn.up.forward.circle.fill")

	/// arrowshape.turn.up.left.2
	static let arrowshape_turn_up_left_2 = UIImage(systemName: "arrowshape.turn.up.left.2")

	/// arrowshape.turn.up.left.2.fill
	static let arrowshape_turn_up_left_2_fill = UIImage(systemName: "arrowshape.turn.up.left.2.fill")

	/// arrowshape.turn.up.left.2.circle
	static let arrowshape_turn_up_left_2_circle = UIImage(systemName: "arrowshape.turn.up.left.2.circle")

	/// arrowshape.turn.up.left.2.circle.fill
	static let arrowshape_turn_up_left_2_circle_fill = UIImage(systemName: "arrowshape.turn.up.left.2.circle.fill")

	/// arrowshape.turn.up.backward.2
	static let arrowshape_turn_up_backward_2 = UIImage(systemName: "arrowshape.turn.up.backward.2")

	/// arrowshape.turn.up.backward.2.fill
	static let arrowshape_turn_up_backward_2_fill = UIImage(systemName: "arrowshape.turn.up.backward.2.fill")

	/// arrowshape.turn.up.backward.2.circle
	static let arrowshape_turn_up_backward_2_circle = UIImage(systemName: "arrowshape.turn.up.backward.2.circle")

	/// arrowshape.turn.up.backward.2.circle.fill
	static let arrowshape_turn_up_backward_2_circle_fill = UIImage(systemName: "arrowshape.turn.up.backward.2.circle.fill")

	/// arrowshape.zigzag.right
	static let arrowshape_zigzag_right = UIImage(systemName: "arrowshape.zigzag.right")

	/// arrowshape.zigzag.right.fill
	static let arrowshape_zigzag_right_fill = UIImage(systemName: "arrowshape.zigzag.right.fill")

	/// arrowshape.zigzag.forward
	static let arrowshape_zigzag_forward = UIImage(systemName: "arrowshape.zigzag.forward")

	/// arrowshape.zigzag.forward.fill
	static let arrowshape_zigzag_forward_fill = UIImage(systemName: "arrowshape.zigzag.forward.fill")

	/// arrowshape.bounce.right
	static let arrowshape_bounce_right = UIImage(systemName: "arrowshape.bounce.right")

	/// arrowshape.bounce.right.fill
	static let arrowshape_bounce_right_fill = UIImage(systemName: "arrowshape.bounce.right.fill")

	/// arrowshape.bounce.forward
	static let arrowshape_bounce_forward = UIImage(systemName: "arrowshape.bounce.forward")

	/// arrowshape.bounce.forward.fill
	static let arrowshape_bounce_forward_fill = UIImage(systemName: "arrowshape.bounce.forward.fill")

	/// book
	static let book = UIImage(systemName: "book")

	/// book.fill
	static let book_fill = UIImage(systemName: "book.fill")

	/// book.circle
	static let book_circle = UIImage(systemName: "book.circle")

	/// book.circle.fill
	static let book_circle_fill = UIImage(systemName: "book.circle.fill")

	/// books.vertical
	static let books_vertical = UIImage(systemName: "books.vertical")

	/// books.vertical.fill
	static let books_vertical_fill = UIImage(systemName: "books.vertical.fill")

	/// book.closed
	static let book_closed = UIImage(systemName: "book.closed")

	/// book.closed.fill
	static let book_closed_fill = UIImage(systemName: "book.closed.fill")

	/// character.book.closed
	static let character_book_closed = UIImage(systemName: "character.book.closed")

	/// character.book.closed.fill
	static let character_book_closed_fill = UIImage(systemName: "character.book.closed.fill")

	/// text.book.closed
	static let text_book_closed = UIImage(systemName: "text.book.closed")

	/// text.book.closed.fill
	static let text_book_closed_fill = UIImage(systemName: "text.book.closed.fill")

	/// menucard
	static let menucard = UIImage(systemName: "menucard")

	/// menucard.fill
	static let menucard_fill = UIImage(systemName: "menucard.fill")

	/// greetingcard
	static let greetingcard = UIImage(systemName: "greetingcard")

	/// greetingcard.fill
	static let greetingcard_fill = UIImage(systemName: "greetingcard.fill")

	/// magazine
	static let magazine = UIImage(systemName: "magazine")

	/// magazine.fill
	static let magazine_fill = UIImage(systemName: "magazine.fill")

	/// newspaper
	static let newspaper = UIImage(systemName: "newspaper")

	/// newspaper.fill
	static let newspaper_fill = UIImage(systemName: "newspaper.fill")

	/// heart.text.square
	static let heart_text_square = UIImage(systemName: "heart.text.square")

	/// heart.text.square.fill
	static let heart_text_square_fill = UIImage(systemName: "heart.text.square.fill")

	/// square.text.square
	static let square_text_square = UIImage(systemName: "square.text.square")

	/// square.text.square.fill
	static let square_text_square_fill = UIImage(systemName: "square.text.square.fill")

	/// doc.text.image
	static let doc_text_image = UIImage(systemName: "doc.text.image")

	/// doc.text.image.fill
	static let doc_text_image_fill = UIImage(systemName: "doc.text.image.fill")

	/// bookmark
	static let bookmark = UIImage(systemName: "bookmark")

	/// bookmark.fill
	static let bookmark_fill = UIImage(systemName: "bookmark.fill")

	/// bookmark.circle
	static let bookmark_circle = UIImage(systemName: "bookmark.circle")

	/// bookmark.circle.fill
	static let bookmark_circle_fill = UIImage(systemName: "bookmark.circle.fill")

	/// bookmark.square
	static let bookmark_square = UIImage(systemName: "bookmark.square")

	/// bookmark.square.fill
	static let bookmark_square_fill = UIImage(systemName: "bookmark.square.fill")

	/// bookmark.slash
	static let bookmark_slash = UIImage(systemName: "bookmark.slash")

	/// bookmark.slash.fill
	static let bookmark_slash_fill = UIImage(systemName: "bookmark.slash.fill")

	/// rosette
	static let rosette = UIImage(systemName: "rosette")

	/// graduationcap
	static let graduationcap = UIImage(systemName: "graduationcap")

	/// graduationcap.fill
	static let graduationcap_fill = UIImage(systemName: "graduationcap.fill")

	/// ticket
	static let ticket = UIImage(systemName: "ticket")

	/// ticket.fill
	static let ticket_fill = UIImage(systemName: "ticket.fill")

	/// paperclip
	static let paperclip = UIImage(systemName: "paperclip")

	/// paperclip.circle
	static let paperclip_circle = UIImage(systemName: "paperclip.circle")

	/// paperclip.circle.fill
	static let paperclip_circle_fill = UIImage(systemName: "paperclip.circle.fill")

	/// paperclip.badge.ellipsis
	static let paperclip_badge_ellipsis = UIImage(systemName: "paperclip.badge.ellipsis")

	/// rectangle.and.paperclip
	static let rectangle_and_paperclip = UIImage(systemName: "rectangle.and.paperclip")

	/// rectangle.dashed.and.paperclip
	static let rectangle_dashed_and_paperclip = UIImage(systemName: "rectangle.dashed.and.paperclip")

	/// link
	static let link = UIImage(systemName: "link")

	/// link.circle
	static let link_circle = UIImage(systemName: "link.circle")

	/// link.circle.fill
	static let link_circle_fill = UIImage(systemName: "link.circle.fill")

	/// link.badge.plus
	static let link_badge_plus = UIImage(systemName: "link.badge.plus")

	/// personalhotspot
	static let personalhotspot = UIImage(systemName: "personalhotspot")

	/// lineweight
	static let lineweight = UIImage(systemName: "lineweight")

	/// person
	static let person = UIImage(systemName: "person")

	/// person.fill
	static let person_fill = UIImage(systemName: "person.fill")

	/// person.fill.turn.right
	static let person_fill_turn_right = UIImage(systemName: "person.fill.turn.right")

	/// person.fill.turn.down
	static let person_fill_turn_down = UIImage(systemName: "person.fill.turn.down")

	/// person.fill.turn.left
	static let person_fill_turn_left = UIImage(systemName: "person.fill.turn.left")

	/// person.fill.checkmark
	static let person_fill_checkmark = UIImage(systemName: "person.fill.checkmark")

	/// person.fill.xmark
	static let person_fill_xmark = UIImage(systemName: "person.fill.xmark")

	/// person.fill.questionmark
	static let person_fill_questionmark = UIImage(systemName: "person.fill.questionmark")

	/// person.circle
	static let person_circle = UIImage(systemName: "person.circle")

	/// person.circle.fill
	static let person_circle_fill = UIImage(systemName: "person.circle.fill")

	/// person.badge.plus
	static let person_badge_plus = UIImage(systemName: "person.badge.plus")

	/// person.fill.badge.plus
	static let person_fill_badge_plus = UIImage(systemName: "person.fill.badge.plus")

	/// person.badge.minus
	static let person_badge_minus = UIImage(systemName: "person.badge.minus")

	/// person.fill.badge.minus
	static let person_fill_badge_minus = UIImage(systemName: "person.fill.badge.minus")

	/// shareplay
	static let shareplay = UIImage(systemName: "shareplay")

	/// person.and.arrow.left.and.arrow.right
	static let person_and_arrow_left_and_arrow_right = UIImage(systemName: "person.and.arrow.left.and.arrow.right")

	/// person.fill.and.arrow.left.and.arrow.right
	static let person_fill_and_arrow_left_and_arrow_right = UIImage(systemName: "person.fill.and.arrow.left.and.arrow.right")

	/// person.2
	static let person_2 = UIImage(systemName: "person.2")

	/// person.2.fill
	static let person_2_fill = UIImage(systemName: "person.2.fill")

	/// person.2.circle
	static let person_2_circle = UIImage(systemName: "person.2.circle")

	/// person.2.circle.fill
	static let person_2_circle_fill = UIImage(systemName: "person.2.circle.fill")

	/// person.2.wave.2
	static let person_2_wave_2 = UIImage(systemName: "person.2.wave.2")

	/// person.2.wave.2.fill
	static let person_2_wave_2_fill = UIImage(systemName: "person.2.wave.2.fill")

	/// person.3
	static let person_3 = UIImage(systemName: "person.3")

	/// person.3.fill
	static let person_3_fill = UIImage(systemName: "person.3.fill")

	/// person.3.sequence
	static let person_3_sequence = UIImage(systemName: "person.3.sequence")

	/// person.3.sequence.fill
	static let person_3_sequence_fill = UIImage(systemName: "person.3.sequence.fill")

	/// lanyardcard
	static let lanyardcard = UIImage(systemName: "lanyardcard")

	/// lanyardcard.fill
	static let lanyardcard_fill = UIImage(systemName: "lanyardcard.fill")

	/// person.crop.circle
	static let person_crop_circle = UIImage(systemName: "person.crop.circle")

	/// person.crop.circle.fill
	static let person_crop_circle_fill = UIImage(systemName: "person.crop.circle.fill")

	/// person.crop.circle.badge.plus
	static let person_crop_circle_badge_plus = UIImage(systemName: "person.crop.circle.badge.plus")

	/// person.crop.circle.fill.badge.plus
	static let person_crop_circle_fill_badge_plus = UIImage(systemName: "person.crop.circle.fill.badge.plus")

	/// person.crop.circle.badge.minus
	static let person_crop_circle_badge_minus = UIImage(systemName: "person.crop.circle.badge.minus")

	/// person.crop.circle.fill.badge.minus
	static let person_crop_circle_fill_badge_minus = UIImage(systemName: "person.crop.circle.fill.badge.minus")

	/// person.crop.circle.badge.checkmark
	static let person_crop_circle_badge_checkmark = UIImage(systemName: "person.crop.circle.badge.checkmark")

	/// person.crop.circle.fill.badge.checkmark
	static let person_crop_circle_fill_badge_checkmark = UIImage(systemName: "person.crop.circle.fill.badge.checkmark")

	/// person.crop.circle.badge.xmark
	static let person_crop_circle_badge_xmark = UIImage(systemName: "person.crop.circle.badge.xmark")

	/// person.crop.circle.fill.badge.xmark
	static let person_crop_circle_fill_badge_xmark = UIImage(systemName: "person.crop.circle.fill.badge.xmark")

	/// person.crop.circle.badge.questionmark
	static let person_crop_circle_badge_questionmark = UIImage(systemName: "person.crop.circle.badge.questionmark")

	/// person.crop.circle.badge.questionmark.fill
	static let person_crop_circle_badge_questionmark_fill = UIImage(systemName: "person.crop.circle.badge.questionmark.fill")

	/// person.crop.circle.badge.exclamationmark
	static let person_crop_circle_badge_exclamationmark = UIImage(systemName: "person.crop.circle.badge.exclamationmark")

	/// person.crop.circle.badge.exclamationmark.fill
	static let person_crop_circle_badge_exclamationmark_fill = UIImage(systemName: "person.crop.circle.badge.exclamationmark.fill")

	/// person.crop.circle.badge.moon
	static let person_crop_circle_badge_moon = UIImage(systemName: "person.crop.circle.badge.moon")

	/// person.crop.circle.badge.moon.fill
	static let person_crop_circle_badge_moon_fill = UIImage(systemName: "person.crop.circle.badge.moon.fill")

	/// person.crop.circle.badge
	static let person_crop_circle_badge = UIImage(systemName: "person.crop.circle.badge")

	/// person.crop.circle.badge.fill
	static let person_crop_circle_badge_fill = UIImage(systemName: "person.crop.circle.badge.fill")

	/// person.crop.square
	static let person_crop_square = UIImage(systemName: "person.crop.square")

	/// person.crop.square.fill
	static let person_crop_square_fill = UIImage(systemName: "person.crop.square.fill")

	/// person.crop.artframe
	static let person_crop_artframe = UIImage(systemName: "person.crop.artframe")

	/// person.crop.rectangle.stack
	static let person_crop_rectangle_stack = UIImage(systemName: "person.crop.rectangle.stack")

	/// person.crop.rectangle.stack.fill
	static let person_crop_rectangle_stack_fill = UIImage(systemName: "person.crop.rectangle.stack.fill")

	/// person.2.crop.square.stack
	static let person_2_crop_square_stack = UIImage(systemName: "person.2.crop.square.stack")

	/// person.2.crop.square.stack.fill
	static let person_2_crop_square_stack_fill = UIImage(systemName: "person.2.crop.square.stack.fill")

	/// person.crop.rectangle
	static let person_crop_rectangle = UIImage(systemName: "person.crop.rectangle")

	/// person.crop.rectangle.fill
	static let person_crop_rectangle_fill = UIImage(systemName: "person.crop.rectangle.fill")

	/// arrow.up.and.person.rectangle.portrait
	static let arrow_up_and_person_rectangle_portrait = UIImage(systemName: "arrow.up.and.person.rectangle.portrait")

	/// arrow.up.and.person.rectangle.turn.right
	static let arrow_up_and_person_rectangle_turn_right = UIImage(systemName: "arrow.up.and.person.rectangle.turn.right")

	/// arrow.up.and.person.rectangle.turn.left
	static let arrow_up_and_person_rectangle_turn_left = UIImage(systemName: "arrow.up.and.person.rectangle.turn.left")

	/// person.crop.square.filled.and.at.rectangle
	static let person_crop_square_filled_and_at_rectangle = UIImage(systemName: "person.crop.square.filled.and.at.rectangle")

	/// person.crop.square.filled.and.at.rectangle.fill
	static let person_crop_square_filled_and_at_rectangle_fill = UIImage(systemName: "person.crop.square.filled.and.at.rectangle.fill")

	/// square.and.at.rectangle
	static let square_and_at_rectangle = UIImage(systemName: "square.and.at.rectangle")

	/// square.and.at.rectangle.fill
	static let square_and_at_rectangle_fill = UIImage(systemName: "square.and.at.rectangle.fill")

	/// person.text.rectangle
	static let person_text_rectangle = UIImage(systemName: "person.text.rectangle")

	/// person.text.rectangle.fill
	static let person_text_rectangle_fill = UIImage(systemName: "person.text.rectangle.fill")

	/// command
	static let command = UIImage(systemName: "command")

	/// command.circle
	static let command_circle = UIImage(systemName: "command.circle")

	/// command.circle.fill
	static let command_circle_fill = UIImage(systemName: "command.circle.fill")

	/// command.square
	static let command_square = UIImage(systemName: "command.square")

	/// command.square.fill
	static let command_square_fill = UIImage(systemName: "command.square.fill")

	/// option
	static let option = UIImage(systemName: "option")

	/// alt
	static let alt = UIImage(systemName: "alt")

	/// clear
	static let clear = UIImage(systemName: "clear")

	/// clear.fill
	static let clear_fill = UIImage(systemName: "clear.fill")

	/// delete.left
	static let delete_left = UIImage(systemName: "delete.left")

	/// delete.left.fill
	static let delete_left_fill = UIImage(systemName: "delete.left.fill")

	/// delete.backward
	static let delete_backward = UIImage(systemName: "delete.backward")

	/// delete.backward.fill
	static let delete_backward_fill = UIImage(systemName: "delete.backward.fill")

	/// delete.right
	static let delete_right = UIImage(systemName: "delete.right")

	/// delete.right.fill
	static let delete_right_fill = UIImage(systemName: "delete.right.fill")

	/// delete.forward
	static let delete_forward = UIImage(systemName: "delete.forward")

	/// delete.forward.fill
	static let delete_forward_fill = UIImage(systemName: "delete.forward.fill")

	/// shift
	static let shift = UIImage(systemName: "shift")

	/// shift.fill
	static let shift_fill = UIImage(systemName: "shift.fill")

	/// capslock
	static let capslock = UIImage(systemName: "capslock")

	/// capslock.fill
	static let capslock_fill = UIImage(systemName: "capslock.fill")

	/// escape
	static let escape = UIImage(systemName: "escape")

	/// restart
	static let restart = UIImage(systemName: "restart")

	/// restart.circle
	static let restart_circle = UIImage(systemName: "restart.circle")

	/// restart.circle.fill
	static let restart_circle_fill = UIImage(systemName: "restart.circle.fill")

	/// sleep
	static let sleep = UIImage(systemName: "sleep")

	/// sleep.circle
	static let sleep_circle = UIImage(systemName: "sleep.circle")

	/// sleep.circle.fill
	static let sleep_circle_fill = UIImage(systemName: "sleep.circle.fill")

	/// wake
	static let wake = UIImage(systemName: "wake")

	/// wake.circle
	static let wake_circle = UIImage(systemName: "wake.circle")

	/// wake.circle.fill
	static let wake_circle_fill = UIImage(systemName: "wake.circle.fill")

	/// power
	static let power = UIImage(systemName: "power")

	/// power.circle
	static let power_circle = UIImage(systemName: "power.circle")

	/// power.circle.fill
	static let power_circle_fill = UIImage(systemName: "power.circle.fill")

	/// power.dotted
	static let power_dotted = UIImage(systemName: "power.dotted")

	/// togglepower
	static let togglepower = UIImage(systemName: "togglepower")

	/// poweron
	static let poweron = UIImage(systemName: "poweron")

	/// poweroff
	static let poweroff = UIImage(systemName: "poweroff")

	/// powersleep
	static let powersleep = UIImage(systemName: "powersleep")

	/// directcurrent
	static let directcurrent = UIImage(systemName: "directcurrent")

	/// peacesign
	static let peacesign = UIImage(systemName: "peacesign")

	/// dot.arrowtriangles.up.right.down.left.circle
	static let dot_arrowtriangles_up_right_down_left_circle = UIImage(systemName: "dot.arrowtriangles.up.right.down.left.circle")

	/// globe
	static let globe = UIImage(systemName: "globe")

	/// network
	static let network = UIImage(systemName: "network")

	/// globe.americas
	static let globe_americas = UIImage(systemName: "globe.americas")

	/// globe.americas.fill
	static let globe_americas_fill = UIImage(systemName: "globe.americas.fill")

	/// globe.europe.africa
	static let globe_europe_africa = UIImage(systemName: "globe.europe.africa")

	/// globe.europe.africa.fill
	static let globe_europe_africa_fill = UIImage(systemName: "globe.europe.africa.fill")

	/// globe.asia.australia
	static let globe_asia_australia = UIImage(systemName: "globe.asia.australia")

	/// globe.asia.australia.fill
	static let globe_asia_australia_fill = UIImage(systemName: "globe.asia.australia.fill")

	/// sun.min
	static let sun_min = UIImage(systemName: "sun.min")

	/// sun.min.fill
	static let sun_min_fill = UIImage(systemName: "sun.min.fill")

	/// sun.max
	static let sun_max = UIImage(systemName: "sun.max")

	/// sun.max.fill
	static let sun_max_fill = UIImage(systemName: "sun.max.fill")

	/// sun.max.circle
	static let sun_max_circle = UIImage(systemName: "sun.max.circle")

	/// sun.max.circle.fill
	static let sun_max_circle_fill = UIImage(systemName: "sun.max.circle.fill")

	/// sunrise
	static let sunrise = UIImage(systemName: "sunrise")

	/// sunrise.fill
	static let sunrise_fill = UIImage(systemName: "sunrise.fill")

	/// sunset
	static let sunset = UIImage(systemName: "sunset")

	/// sunset.fill
	static let sunset_fill = UIImage(systemName: "sunset.fill")

	/// sun.and.horizon
	static let sun_and_horizon = UIImage(systemName: "sun.and.horizon")

	/// sun.and.horizon.fill
	static let sun_and_horizon_fill = UIImage(systemName: "sun.and.horizon.fill")

	/// sun.dust
	static let sun_dust = UIImage(systemName: "sun.dust")

	/// sun.dust.fill
	static let sun_dust_fill = UIImage(systemName: "sun.dust.fill")

	/// sun.haze
	static let sun_haze = UIImage(systemName: "sun.haze")

	/// sun.haze.fill
	static let sun_haze_fill = UIImage(systemName: "sun.haze.fill")

	/// moon
	static let moon = UIImage(systemName: "moon")

	/// moon.fill
	static let moon_fill = UIImage(systemName: "moon.fill")

	/// moon.circle
	static let moon_circle = UIImage(systemName: "moon.circle")

	/// moon.circle.fill
	static let moon_circle_fill = UIImage(systemName: "moon.circle.fill")

	/// zzz
	static let zzz = UIImage(systemName: "zzz")

	/// moon.zzz
	static let moon_zzz = UIImage(systemName: "moon.zzz")

	/// moon.zzz.fill
	static let moon_zzz_fill = UIImage(systemName: "moon.zzz.fill")

	/// sparkle
	static let sparkle = UIImage(systemName: "sparkle")

	/// sparkles
	static let sparkles = UIImage(systemName: "sparkles")

	/// moon.stars
	static let moon_stars = UIImage(systemName: "moon.stars")

	/// moon.stars.fill
	static let moon_stars_fill = UIImage(systemName: "moon.stars.fill")

	/// cloud
	static let cloud = UIImage(systemName: "cloud")

	/// cloud.fill
	static let cloud_fill = UIImage(systemName: "cloud.fill")

	/// cloud.drizzle
	static let cloud_drizzle = UIImage(systemName: "cloud.drizzle")

	/// cloud.drizzle.fill
	static let cloud_drizzle_fill = UIImage(systemName: "cloud.drizzle.fill")

	/// cloud.rain
	static let cloud_rain = UIImage(systemName: "cloud.rain")

	/// cloud.rain.fill
	static let cloud_rain_fill = UIImage(systemName: "cloud.rain.fill")

	/// cloud.heavyrain
	static let cloud_heavyrain = UIImage(systemName: "cloud.heavyrain")

	/// cloud.heavyrain.fill
	static let cloud_heavyrain_fill = UIImage(systemName: "cloud.heavyrain.fill")

	/// cloud.fog
	static let cloud_fog = UIImage(systemName: "cloud.fog")

	/// cloud.fog.fill
	static let cloud_fog_fill = UIImage(systemName: "cloud.fog.fill")

	/// cloud.hail
	static let cloud_hail = UIImage(systemName: "cloud.hail")

	/// cloud.hail.fill
	static let cloud_hail_fill = UIImage(systemName: "cloud.hail.fill")

	/// cloud.snow
	static let cloud_snow = UIImage(systemName: "cloud.snow")

	/// cloud.snow.fill
	static let cloud_snow_fill = UIImage(systemName: "cloud.snow.fill")

	/// cloud.sleet
	static let cloud_sleet = UIImage(systemName: "cloud.sleet")

	/// cloud.sleet.fill
	static let cloud_sleet_fill = UIImage(systemName: "cloud.sleet.fill")

	/// cloud.bolt
	static let cloud_bolt = UIImage(systemName: "cloud.bolt")

	/// cloud.bolt.fill
	static let cloud_bolt_fill = UIImage(systemName: "cloud.bolt.fill")

	/// cloud.bolt.rain
	static let cloud_bolt_rain = UIImage(systemName: "cloud.bolt.rain")

	/// cloud.bolt.rain.fill
	static let cloud_bolt_rain_fill = UIImage(systemName: "cloud.bolt.rain.fill")

	/// cloud.sun
	static let cloud_sun = UIImage(systemName: "cloud.sun")

	/// cloud.sun.fill
	static let cloud_sun_fill = UIImage(systemName: "cloud.sun.fill")

	/// cloud.sun.rain
	static let cloud_sun_rain = UIImage(systemName: "cloud.sun.rain")

	/// cloud.sun.rain.fill
	static let cloud_sun_rain_fill = UIImage(systemName: "cloud.sun.rain.fill")

	/// cloud.sun.bolt
	static let cloud_sun_bolt = UIImage(systemName: "cloud.sun.bolt")

	/// cloud.sun.bolt.fill
	static let cloud_sun_bolt_fill = UIImage(systemName: "cloud.sun.bolt.fill")

	/// cloud.moon
	static let cloud_moon = UIImage(systemName: "cloud.moon")

	/// cloud.moon.fill
	static let cloud_moon_fill = UIImage(systemName: "cloud.moon.fill")

	/// cloud.moon.rain
	static let cloud_moon_rain = UIImage(systemName: "cloud.moon.rain")

	/// cloud.moon.rain.fill
	static let cloud_moon_rain_fill = UIImage(systemName: "cloud.moon.rain.fill")

	/// cloud.moon.bolt
	static let cloud_moon_bolt = UIImage(systemName: "cloud.moon.bolt")

	/// cloud.moon.bolt.fill
	static let cloud_moon_bolt_fill = UIImage(systemName: "cloud.moon.bolt.fill")

	/// smoke
	static let smoke = UIImage(systemName: "smoke")

	/// smoke.fill
	static let smoke_fill = UIImage(systemName: "smoke.fill")

	/// wind
	static let wind = UIImage(systemName: "wind")

	/// wind.snow
	static let wind_snow = UIImage(systemName: "wind.snow")

	/// snowflake
	static let snowflake = UIImage(systemName: "snowflake")

	/// tornado
	static let tornado = UIImage(systemName: "tornado")

	/// tropicalstorm
	static let tropicalstorm = UIImage(systemName: "tropicalstorm")

	/// hurricane
	static let hurricane = UIImage(systemName: "hurricane")

	/// thermometer.sun
	static let thermometer_sun = UIImage(systemName: "thermometer.sun")

	/// thermometer.sun.fill
	static let thermometer_sun_fill = UIImage(systemName: "thermometer.sun.fill")

	/// thermometer.snowflake
	static let thermometer_snowflake = UIImage(systemName: "thermometer.snowflake")

	/// thermometer
	static let thermometer = UIImage(systemName: "thermometer")

	/// aqi.low
	static let aqi_low = UIImage(systemName: "aqi.low")

	/// aqi.medium
	static let aqi_medium = UIImage(systemName: "aqi.medium")

	/// aqi.high
	static let aqi_high = UIImage(systemName: "aqi.high")

	/// humidity
	static let humidity = UIImage(systemName: "humidity")

	/// humidity.fill
	static let humidity_fill = UIImage(systemName: "humidity.fill")

	/// umbrella
	static let umbrella = UIImage(systemName: "umbrella")

	/// umbrella.fill
	static let umbrella_fill = UIImage(systemName: "umbrella.fill")

	/// flame
	static let flame = UIImage(systemName: "flame")

	/// flame.fill
	static let flame_fill = UIImage(systemName: "flame.fill")

	/// light.min
	static let light_min = UIImage(systemName: "light.min")

	/// light.max
	static let light_max = UIImage(systemName: "light.max")

	/// rays
	static let rays = UIImage(systemName: "rays")

	/// slowmo
	static let slowmo = UIImage(systemName: "slowmo")

	/// timelapse
	static let timelapse = UIImage(systemName: "timelapse")

	/// cursorarrow.rays
	static let cursorarrow_rays = UIImage(systemName: "cursorarrow.rays")

	/// cursorarrow
	static let cursorarrow = UIImage(systemName: "cursorarrow")

	/// cursorarrow.square
	static let cursorarrow_square = UIImage(systemName: "cursorarrow.square")

	/// cursorarrow.and.square.on.square.dashed
	static let cursorarrow_and_square_on_square_dashed = UIImage(systemName: "cursorarrow.and.square.on.square.dashed")

	/// cursorarrow.click
	static let cursorarrow_click = UIImage(systemName: "cursorarrow.click")

	/// cursorarrow.click.2
	static let cursorarrow_click_2 = UIImage(systemName: "cursorarrow.click.2")

	/// contextualmenu.and.cursorarrow
	static let contextualmenu_and_cursorarrow = UIImage(systemName: "contextualmenu.and.cursorarrow")

	/// filemenu.and.cursorarrow
	static let filemenu_and_cursorarrow = UIImage(systemName: "filemenu.and.cursorarrow")

	/// filemenu.and.selection
	static let filemenu_and_selection = UIImage(systemName: "filemenu.and.selection")

	/// dot.circle.and.hand.point.up.left.fill
	static let dot_circle_and_hand_point_up_left_fill = UIImage(systemName: "dot.circle.and.hand.point.up.left.fill")

	/// dot.circle.and.cursorarrow
	static let dot_circle_and_cursorarrow = UIImage(systemName: "dot.circle.and.cursorarrow")

	/// cursorarrow.motionlines
	static let cursorarrow_motionlines = UIImage(systemName: "cursorarrow.motionlines")

	/// cursorarrow.motionlines.click
	static let cursorarrow_motionlines_click = UIImage(systemName: "cursorarrow.motionlines.click")

	/// cursorarrow.click.badge.clock
	static let cursorarrow_click_badge_clock = UIImage(systemName: "cursorarrow.click.badge.clock")

	/// keyboard
	static let keyboard = UIImage(systemName: "keyboard")

	/// keyboard.fill
	static let keyboard_fill = UIImage(systemName: "keyboard.fill")

	/// keyboard.badge.ellipsis
	static let keyboard_badge_ellipsis = UIImage(systemName: "keyboard.badge.ellipsis")

	/// keyboard.chevron.compact.down
	static let keyboard_chevron_compact_down = UIImage(systemName: "keyboard.chevron.compact.down")

	/// keyboard.chevron.compact.left
	static let keyboard_chevron_compact_left = UIImage(systemName: "keyboard.chevron.compact.left")

	/// keyboard.onehanded.left
	static let keyboard_onehanded_left = UIImage(systemName: "keyboard.onehanded.left")

	/// keyboard.onehanded.right
	static let keyboard_onehanded_right = UIImage(systemName: "keyboard.onehanded.right")

	/// rectangle.3.offgrid
	static let rectangle_3_offgrid = UIImage(systemName: "rectangle.3.offgrid")

	/// rectangle.3.offgrid.fill
	static let rectangle_3_offgrid_fill = UIImage(systemName: "rectangle.3.offgrid.fill")

	/// square.grid.3x2
	static let square_grid_3x2 = UIImage(systemName: "square.grid.3x2")

	/// square.grid.3x2.fill
	static let square_grid_3x2_fill = UIImage(systemName: "square.grid.3x2.fill")

	/// rectangle.grid.3x2
	static let rectangle_grid_3x2 = UIImage(systemName: "rectangle.grid.3x2")

	/// rectangle.grid.3x2.fill
	static let rectangle_grid_3x2_fill = UIImage(systemName: "rectangle.grid.3x2.fill")

	/// square.grid.2x2
	static let square_grid_2x2 = UIImage(systemName: "square.grid.2x2")

	/// square.grid.2x2.fill
	static let square_grid_2x2_fill = UIImage(systemName: "square.grid.2x2.fill")

	/// rectangle.grid.2x2
	static let rectangle_grid_2x2 = UIImage(systemName: "rectangle.grid.2x2")

	/// rectangle.grid.2x2.fill
	static let rectangle_grid_2x2_fill = UIImage(systemName: "rectangle.grid.2x2.fill")

	/// square.grid.3x1.below.line.grid.1x2
	static let square_grid_3x1_below_line_grid_1x2 = UIImage(systemName: "square.grid.3x1.below.line.grid.1x2")

	/// square.grid.3x1.fill.below.line.grid.1x2
	static let square_grid_3x1_fill_below_line_grid_1x2 = UIImage(systemName: "square.grid.3x1.fill.below.line.grid.1x2")

	/// square.grid.4x3.fill
	static let square_grid_4x3_fill = UIImage(systemName: "square.grid.4x3.fill")

	/// rectangle.grid.1x2
	static let rectangle_grid_1x2 = UIImage(systemName: "rectangle.grid.1x2")

	/// rectangle.grid.1x2.fill
	static let rectangle_grid_1x2_fill = UIImage(systemName: "rectangle.grid.1x2.fill")

	/// circle.grid.2x2
	static let circle_grid_2x2 = UIImage(systemName: "circle.grid.2x2")

	/// circle.grid.2x2.fill
	static let circle_grid_2x2_fill = UIImage(systemName: "circle.grid.2x2.fill")

	/// circle.grid.3x3
	static let circle_grid_3x3 = UIImage(systemName: "circle.grid.3x3")

	/// circle.grid.3x3.fill
	static let circle_grid_3x3_fill = UIImage(systemName: "circle.grid.3x3.fill")

	/// circle.grid.3x3.circle
	static let circle_grid_3x3_circle = UIImage(systemName: "circle.grid.3x3.circle")

	/// circle.grid.3x3.circle.fill
	static let circle_grid_3x3_circle_fill = UIImage(systemName: "circle.grid.3x3.circle.fill")

	/// square.grid.3x3
	static let square_grid_3x3 = UIImage(systemName: "square.grid.3x3")

	/// square.grid.3x3.fill
	static let square_grid_3x3_fill = UIImage(systemName: "square.grid.3x3.fill")

	/// square.grid.3x3.topleft.filled
	static let square_grid_3x3_topleft_filled = UIImage(systemName: "square.grid.3x3.topleft.filled")

	/// square.grid.3x3.topmiddle.filled
	static let square_grid_3x3_topmiddle_filled = UIImage(systemName: "square.grid.3x3.topmiddle.filled")

	/// square.grid.3x3.topright.filled
	static let square_grid_3x3_topright_filled = UIImage(systemName: "square.grid.3x3.topright.filled")

	/// square.grid.3x3.middleleft.filled
	static let square_grid_3x3_middleleft_filled = UIImage(systemName: "square.grid.3x3.middleleft.filled")

	/// square.grid.3x3.middle.filled
	static let square_grid_3x3_middle_filled = UIImage(systemName: "square.grid.3x3.middle.filled")

	/// square.grid.3x3.middleright.filled
	static let square_grid_3x3_middleright_filled = UIImage(systemName: "square.grid.3x3.middleright.filled")

	/// square.grid.3x3.bottomleft.filled
	static let square_grid_3x3_bottomleft_filled = UIImage(systemName: "square.grid.3x3.bottomleft.filled")

	/// square.grid.3x3.bottommiddle.filled
	static let square_grid_3x3_bottommiddle_filled = UIImage(systemName: "square.grid.3x3.bottommiddle.filled")

	/// square.grid.3x3.bottomright.filled
	static let square_grid_3x3_bottomright_filled = UIImage(systemName: "square.grid.3x3.bottomright.filled")

	/// circle.hexagongrid
	static let circle_hexagongrid = UIImage(systemName: "circle.hexagongrid")

	/// circle.hexagongrid.fill
	static let circle_hexagongrid_fill = UIImage(systemName: "circle.hexagongrid.fill")

	/// circle.hexagongrid.circle
	static let circle_hexagongrid_circle = UIImage(systemName: "circle.hexagongrid.circle")

	/// circle.hexagongrid.circle.fill
	static let circle_hexagongrid_circle_fill = UIImage(systemName: "circle.hexagongrid.circle.fill")

	/// circle.hexagonpath
	static let circle_hexagonpath = UIImage(systemName: "circle.hexagonpath")

	/// circle.hexagonpath.fill
	static let circle_hexagonpath_fill = UIImage(systemName: "circle.hexagonpath.fill")

	/// circle.grid.cross
	static let circle_grid_cross = UIImage(systemName: "circle.grid.cross")

	/// circle.grid.cross.fill
	static let circle_grid_cross_fill = UIImage(systemName: "circle.grid.cross.fill")

	/// circle.grid.cross.left.fill
	static let circle_grid_cross_left_fill = UIImage(systemName: "circle.grid.cross.left.fill")

	/// circle.grid.cross.up.fill
	static let circle_grid_cross_up_fill = UIImage(systemName: "circle.grid.cross.up.fill")

	/// circle.grid.cross.right.fill
	static let circle_grid_cross_right_fill = UIImage(systemName: "circle.grid.cross.right.fill")

	/// circle.grid.cross.down.fill
	static let circle_grid_cross_down_fill = UIImage(systemName: "circle.grid.cross.down.fill")

	/// seal
	static let seal = UIImage(systemName: "seal")

	/// seal.fill
	static let seal_fill = UIImage(systemName: "seal.fill")

	/// checkmark.seal
	static let checkmark_seal = UIImage(systemName: "checkmark.seal")

	/// checkmark.seal.fill
	static let checkmark_seal_fill = UIImage(systemName: "checkmark.seal.fill")

	/// xmark.seal
	static let xmark_seal = UIImage(systemName: "xmark.seal")

	/// xmark.seal.fill
	static let xmark_seal_fill = UIImage(systemName: "xmark.seal.fill")

	/// exclamationmark.triangle
	static let exclamationmark_triangle = UIImage(systemName: "exclamationmark.triangle")

	/// exclamationmark.triangle.fill
	static let exclamationmark_triangle_fill = UIImage(systemName: "exclamationmark.triangle.fill")

	/// drop
	static let drop = UIImage(systemName: "drop")

	/// drop.fill
	static let drop_fill = UIImage(systemName: "drop.fill")

	/// drop.triangle
	static let drop_triangle = UIImage(systemName: "drop.triangle")

	/// drop.triangle.fill
	static let drop_triangle_fill = UIImage(systemName: "drop.triangle.fill")

	/// play
	static let play = UIImage(systemName: "play")

	/// play.fill
	static let play_fill = UIImage(systemName: "play.fill")

	/// play.circle
	static let play_circle = UIImage(systemName: "play.circle")

	/// play.circle.fill
	static let play_circle_fill = UIImage(systemName: "play.circle.fill")

	/// play.square
	static let play_square = UIImage(systemName: "play.square")

	/// play.square.fill
	static let play_square_fill = UIImage(systemName: "play.square.fill")

	/// play.rectangle
	static let play_rectangle = UIImage(systemName: "play.rectangle")

	/// play.rectangle.fill
	static let play_rectangle_fill = UIImage(systemName: "play.rectangle.fill")

	/// play.slash
	static let play_slash = UIImage(systemName: "play.slash")

	/// play.slash.fill
	static let play_slash_fill = UIImage(systemName: "play.slash.fill")

	/// pause
	static let pause = UIImage(systemName: "pause")

	/// pause.fill
	static let pause_fill = UIImage(systemName: "pause.fill")

	/// pause.circle
	static let pause_circle = UIImage(systemName: "pause.circle")

	/// pause.circle.fill
	static let pause_circle_fill = UIImage(systemName: "pause.circle.fill")

	/// pause.rectangle
	static let pause_rectangle = UIImage(systemName: "pause.rectangle")

	/// pause.rectangle.fill
	static let pause_rectangle_fill = UIImage(systemName: "pause.rectangle.fill")

	/// stop
	static let stop = UIImage(systemName: "stop")

	/// stop.fill
	static let stop_fill = UIImage(systemName: "stop.fill")

	/// stop.circle
	static let stop_circle = UIImage(systemName: "stop.circle")

	/// stop.circle.fill
	static let stop_circle_fill = UIImage(systemName: "stop.circle.fill")

	/// record.circle
	static let record_circle = UIImage(systemName: "record.circle")

	/// record.circle.fill
	static let record_circle_fill = UIImage(systemName: "record.circle.fill")

	/// playpause
	static let playpause = UIImage(systemName: "playpause")

	/// playpause.fill
	static let playpause_fill = UIImage(systemName: "playpause.fill")

	/// backward
	static let backward = UIImage(systemName: "backward")

	/// backward.fill
	static let backward_fill = UIImage(systemName: "backward.fill")

	/// backward.circle
	static let backward_circle = UIImage(systemName: "backward.circle")

	/// backward.circle.fill
	static let backward_circle_fill = UIImage(systemName: "backward.circle.fill")

	/// forward
	static let forward = UIImage(systemName: "forward")

	/// forward.fill
	static let forward_fill = UIImage(systemName: "forward.fill")

	/// forward.circle
	static let forward_circle = UIImage(systemName: "forward.circle")

	/// forward.circle.fill
	static let forward_circle_fill = UIImage(systemName: "forward.circle.fill")

	/// backward.end
	static let backward_end = UIImage(systemName: "backward.end")

	/// backward.end.fill
	static let backward_end_fill = UIImage(systemName: "backward.end.fill")

	/// forward.end
	static let forward_end = UIImage(systemName: "forward.end")

	/// forward.end.fill
	static let forward_end_fill = UIImage(systemName: "forward.end.fill")

	/// backward.end.alt
	static let backward_end_alt = UIImage(systemName: "backward.end.alt")

	/// backward.end.alt.fill
	static let backward_end_alt_fill = UIImage(systemName: "backward.end.alt.fill")

	/// forward.end.alt
	static let forward_end_alt = UIImage(systemName: "forward.end.alt")

	/// forward.end.alt.fill
	static let forward_end_alt_fill = UIImage(systemName: "forward.end.alt.fill")

	/// backward.frame
	static let backward_frame = UIImage(systemName: "backward.frame")

	/// backward.frame.fill
	static let backward_frame_fill = UIImage(systemName: "backward.frame.fill")

	/// forward.frame
	static let forward_frame = UIImage(systemName: "forward.frame")

	/// forward.frame.fill
	static let forward_frame_fill = UIImage(systemName: "forward.frame.fill")

	/// eject
	static let eject = UIImage(systemName: "eject")

	/// eject.fill
	static let eject_fill = UIImage(systemName: "eject.fill")

	/// eject.circle
	static let eject_circle = UIImage(systemName: "eject.circle")

	/// eject.circle.fill
	static let eject_circle_fill = UIImage(systemName: "eject.circle.fill")

	/// mount
	static let mount = UIImage(systemName: "mount")

	/// mount.fill
	static let mount_fill = UIImage(systemName: "mount.fill")

	/// memories
	static let memories = UIImage(systemName: "memories")

	/// memories.badge.plus
	static let memories_badge_plus = UIImage(systemName: "memories.badge.plus")

	/// memories.badge.minus
	static let memories_badge_minus = UIImage(systemName: "memories.badge.minus")

	/// shuffle
	static let shuffle = UIImage(systemName: "shuffle")

	/// shuffle.circle
	static let shuffle_circle = UIImage(systemName: "shuffle.circle")

	/// shuffle.circle.fill
	static let shuffle_circle_fill = UIImage(systemName: "shuffle.circle.fill")

	/// repeat
	static let repeat_Image = UIImage(systemName: "repeat")

	/// repeat.circle
	static let repeat_circle = UIImage(systemName: "repeat.circle")

	/// repeat.circle.fill
	static let repeat_circle_fill = UIImage(systemName: "repeat.circle.fill")

	/// repeat.1
	static let repeat_1 = UIImage(systemName: "repeat.1")

	/// repeat.1.circle
	static let repeat_1_circle = UIImage(systemName: "repeat.1.circle")

	/// repeat.1.circle.fill
	static let repeat_1_circle_fill = UIImage(systemName: "repeat.1.circle.fill")

	/// infinity
	static let infinity = UIImage(systemName: "infinity")

	/// infinity.circle
	static let infinity_circle = UIImage(systemName: "infinity.circle")

	/// infinity.circle.fill
	static let infinity_circle_fill = UIImage(systemName: "infinity.circle.fill")

	/// megaphone
	static let megaphone = UIImage(systemName: "megaphone")

	/// megaphone.fill
	static let megaphone_fill = UIImage(systemName: "megaphone.fill")

	/// speaker
	static let speaker = UIImage(systemName: "speaker")

	/// speaker.fill
	static let speaker_fill = UIImage(systemName: "speaker.fill")

	/// speaker.circle
	static let speaker_circle = UIImage(systemName: "speaker.circle")

	/// speaker.circle.fill
	static let speaker_circle_fill = UIImage(systemName: "speaker.circle.fill")

	/// speaker.slash
	static let speaker_slash = UIImage(systemName: "speaker.slash")

	/// speaker.slash.fill
	static let speaker_slash_fill = UIImage(systemName: "speaker.slash.fill")

	/// speaker.slash.circle
	static let speaker_slash_circle = UIImage(systemName: "speaker.slash.circle")

	/// speaker.slash.circle.fill
	static let speaker_slash_circle_fill = UIImage(systemName: "speaker.slash.circle.fill")

	/// speaker.zzz
	static let speaker_zzz = UIImage(systemName: "speaker.zzz")

	/// speaker.zzz.fill
	static let speaker_zzz_fill = UIImage(systemName: "speaker.zzz.fill")

	/// speaker.wave.1
	static let speaker_wave_1 = UIImage(systemName: "speaker.wave.1")

	/// speaker.wave.1.fill
	static let speaker_wave_1_fill = UIImage(systemName: "speaker.wave.1.fill")

	/// speaker.wave.2
	static let speaker_wave_2 = UIImage(systemName: "speaker.wave.2")

	/// speaker.wave.2.fill
	static let speaker_wave_2_fill = UIImage(systemName: "speaker.wave.2.fill")

	/// speaker.wave.2.circle
	static let speaker_wave_2_circle = UIImage(systemName: "speaker.wave.2.circle")

	/// speaker.wave.2.circle.fill
	static let speaker_wave_2_circle_fill = UIImage(systemName: "speaker.wave.2.circle.fill")

	/// speaker.wave.3
	static let speaker_wave_3 = UIImage(systemName: "speaker.wave.3")

	/// speaker.wave.3.fill
	static let speaker_wave_3_fill = UIImage(systemName: "speaker.wave.3.fill")

	/// speaker.badge.exclamationmark
	static let speaker_badge_exclamationmark = UIImage(systemName: "speaker.badge.exclamationmark")

	/// speaker.badge.exclamationmark.fill
	static let speaker_badge_exclamationmark_fill = UIImage(systemName: "speaker.badge.exclamationmark.fill")

	/// badge.plus.radiowaves.right
	static let badge_plus_radiowaves_right = UIImage(systemName: "badge.plus.radiowaves.right")

	/// badge.plus.radiowaves.forward
	static let badge_plus_radiowaves_forward = UIImage(systemName: "badge.plus.radiowaves.forward")

	/// music.note
	static let music_note = UIImage(systemName: "music.note")

	/// music.note.list
	static let music_note_list = UIImage(systemName: "music.note.list")

	/// music.quarternote.3
	static let music_quarternote_3 = UIImage(systemName: "music.quarternote.3")

	/// music.mic
	static let music_mic = UIImage(systemName: "music.mic")

	/// music.mic.circle
	static let music_mic_circle = UIImage(systemName: "music.mic.circle")

	/// music.mic.circle.fill
	static let music_mic_circle_fill = UIImage(systemName: "music.mic.circle.fill")

	/// arrow.rectanglepath
	static let arrow_rectanglepath = UIImage(systemName: "arrow.rectanglepath")

	/// goforward
	static let goforward = UIImage(systemName: "goforward")

	/// gobackward
	static let gobackward = UIImage(systemName: "gobackward")

	/// goforward.5
	static let goforward_5 = UIImage(systemName: "goforward.5")

	/// gobackward.5
	static let gobackward_5 = UIImage(systemName: "gobackward.5")

	/// goforward.10
	static let goforward_10 = UIImage(systemName: "goforward.10")

	/// gobackward.10
	static let gobackward_10 = UIImage(systemName: "gobackward.10")

	/// goforward.15
	static let goforward_15 = UIImage(systemName: "goforward.15")

	/// gobackward.15
	static let gobackward_15 = UIImage(systemName: "gobackward.15")

	/// goforward.30
	static let goforward_30 = UIImage(systemName: "goforward.30")

	/// gobackward.30
	static let gobackward_30 = UIImage(systemName: "gobackward.30")

	/// goforward.45
	static let goforward_45 = UIImage(systemName: "goforward.45")

	/// gobackward.45
	static let gobackward_45 = UIImage(systemName: "gobackward.45")

	/// goforward.60
	static let goforward_60 = UIImage(systemName: "goforward.60")

	/// gobackward.60
	static let gobackward_60 = UIImage(systemName: "gobackward.60")

	/// goforward.75
	static let goforward_75 = UIImage(systemName: "goforward.75")

	/// gobackward.75
	static let gobackward_75 = UIImage(systemName: "gobackward.75")

	/// goforward.90
	static let goforward_90 = UIImage(systemName: "goforward.90")

	/// gobackward.90
	static let gobackward_90 = UIImage(systemName: "gobackward.90")

	/// goforward.plus
	static let goforward_plus = UIImage(systemName: "goforward.plus")

	/// gobackward.minus
	static let gobackward_minus = UIImage(systemName: "gobackward.minus")

	/// swift
	static let swift = UIImage(systemName: "swift")

	/// magnifyingglass
	static let magnifyingglass = UIImage(systemName: "magnifyingglass")

	/// magnifyingglass.circle
	static let magnifyingglass_circle = UIImage(systemName: "magnifyingglass.circle")

	/// magnifyingglass.circle.fill
	static let magnifyingglass_circle_fill = UIImage(systemName: "magnifyingglass.circle.fill")

	/// plus.magnifyingglass
	static let plus_magnifyingglass = UIImage(systemName: "plus.magnifyingglass")

	/// minus.magnifyingglass
	static let minus_magnifyingglass = UIImage(systemName: "minus.magnifyingglass")

	/// 1.magnifyingglass
	static let magnifyingglass_1 = UIImage(systemName: "1.magnifyingglass")

	/// arrow.up.left.and.down.right.magnifyingglass
	static let arrow_up_left_and_down_right_magnifyingglass = UIImage(systemName: "arrow.up.left.and.down.right.magnifyingglass")

	/// text.magnifyingglass
	static let text_magnifyingglass = UIImage(systemName: "text.magnifyingglass")

	/// loupe
	static let loupe = UIImage(systemName: "loupe")

	/// mic
	static let mic = UIImage(systemName: "mic")

	/// mic.fill
	static let mic_fill = UIImage(systemName: "mic.fill")

	/// mic.circle
	static let mic_circle = UIImage(systemName: "mic.circle")

	/// mic.circle.fill
	static let mic_circle_fill = UIImage(systemName: "mic.circle.fill")

	/// mic.square
	static let mic_square = UIImage(systemName: "mic.square")

	/// mic.square.fill
	static let mic_square_fill = UIImage(systemName: "mic.square.fill")

	/// mic.slash
	static let mic_slash = UIImage(systemName: "mic.slash")

	/// mic.slash.fill
	static let mic_slash_fill = UIImage(systemName: "mic.slash.fill")

	/// mic.slash.circle
	static let mic_slash_circle = UIImage(systemName: "mic.slash.circle")

	/// mic.slash.circle.fill
	static let mic_slash_circle_fill = UIImage(systemName: "mic.slash.circle.fill")

	/// mic.badge.plus
	static let mic_badge_plus = UIImage(systemName: "mic.badge.plus")

	/// mic.fill.badge.plus
	static let mic_fill_badge_plus = UIImage(systemName: "mic.fill.badge.plus")

	/// line.diagonal
	static let line_diagonal = UIImage(systemName: "line.diagonal")

	/// line.diagonal.arrow
	static let line_diagonal_arrow = UIImage(systemName: "line.diagonal.arrow")

	/// circle
	static let circle = UIImage(systemName: "circle")

	/// circle.fill
	static let circle_fill = UIImage(systemName: "circle.fill")

	/// circle.slash
	static let circle_slash = UIImage(systemName: "circle.slash")

	/// circle.slash.fill
	static let circle_slash_fill = UIImage(systemName: "circle.slash.fill")

	/// circle.lefthalf.filled
	static let circle_lefthalf_filled = UIImage(systemName: "circle.lefthalf.filled")

	/// circle.righthalf.filled
	static let circle_righthalf_filled = UIImage(systemName: "circle.righthalf.filled")

	/// circle.tophalf.filled
	static let circle_tophalf_filled = UIImage(systemName: "circle.tophalf.filled")

	/// circle.bottomhalf.filled
	static let circle_bottomhalf_filled = UIImage(systemName: "circle.bottomhalf.filled")

	/// circle.inset.filled
	static let circle_inset_filled = UIImage(systemName: "circle.inset.filled")

	/// smallcircle.fill.circle
	static let smallcircle_fill_circle = UIImage(systemName: "smallcircle.fill.circle")

	/// smallcircle.fill.circle.fill
	static let smallcircle_fill_circle_fill = UIImage(systemName: "smallcircle.fill.circle.fill")

	/// circle.dashed
	static let circle_dashed = UIImage(systemName: "circle.dashed")

	/// circle.dashed.inset.filled
	static let circle_dashed_inset_filled = UIImage(systemName: "circle.dashed.inset.filled")

	/// circlebadge
	static let circlebadge = UIImage(systemName: "circlebadge")

	/// circlebadge.fill
	static let circlebadge_fill = UIImage(systemName: "circlebadge.fill")

	/// circlebadge.2
	static let circlebadge_2 = UIImage(systemName: "circlebadge.2")

	/// circlebadge.2.fill
	static let circlebadge_2_fill = UIImage(systemName: "circlebadge.2.fill")

	/// smallcircle.circle
	static let smallcircle_circle = UIImage(systemName: "smallcircle.circle")

	/// smallcircle.circle.fill
	static let smallcircle_circle_fill = UIImage(systemName: "smallcircle.circle.fill")

	/// target
	static let target = UIImage(systemName: "target")

	/// capsule
	static let capsule = UIImage(systemName: "capsule")

	/// capsule.fill
	static let capsule_fill = UIImage(systemName: "capsule.fill")

	/// capsule.lefthalf.filled
	static let capsule_lefthalf_filled = UIImage(systemName: "capsule.lefthalf.filled")

	/// capsule.righthalf.filled
	static let capsule_righthalf_filled = UIImage(systemName: "capsule.righthalf.filled")

	/// capsule.tophalf.filled
	static let capsule_tophalf_filled = UIImage(systemName: "capsule.tophalf.filled")

	/// capsule.bottomhalf.filled
	static let capsule_bottomhalf_filled = UIImage(systemName: "capsule.bottomhalf.filled")

	/// capsule.inset.filled
	static let capsule_inset_filled = UIImage(systemName: "capsule.inset.filled")

	/// capsule.portrait
	static let capsule_portrait = UIImage(systemName: "capsule.portrait")

	/// capsule.portrait.fill
	static let capsule_portrait_fill = UIImage(systemName: "capsule.portrait.fill")

	/// capsule.portrait.lefthalf.filled
	static let capsule_portrait_lefthalf_filled = UIImage(systemName: "capsule.portrait.lefthalf.filled")

	/// capsule.portrait.righthalf.filled
	static let capsule_portrait_righthalf_filled = UIImage(systemName: "capsule.portrait.righthalf.filled")

	/// capsule.portrait.tophalf.filled
	static let capsule_portrait_tophalf_filled = UIImage(systemName: "capsule.portrait.tophalf.filled")

	/// capsule.portrait.bottomhalf.filled
	static let capsule_portrait_bottomhalf_filled = UIImage(systemName: "capsule.portrait.bottomhalf.filled")

	/// capsule.portrait.inset.filled
	static let capsule_portrait_inset_filled = UIImage(systemName: "capsule.portrait.inset.filled")

	/// oval
	static let oval = UIImage(systemName: "oval")

	/// oval.fill
	static let oval_fill = UIImage(systemName: "oval.fill")

	/// oval.lefthalf.filled
	static let oval_lefthalf_filled = UIImage(systemName: "oval.lefthalf.filled")

	/// oval.righthalf.filled
	static let oval_righthalf_filled = UIImage(systemName: "oval.righthalf.filled")

	/// oval.tophalf.filled
	static let oval_tophalf_filled = UIImage(systemName: "oval.tophalf.filled")

	/// oval.bottomhalf.filled
	static let oval_bottomhalf_filled = UIImage(systemName: "oval.bottomhalf.filled")

	/// oval.inset.filled
	static let oval_inset_filled = UIImage(systemName: "oval.inset.filled")

	/// oval.portrait
	static let oval_portrait = UIImage(systemName: "oval.portrait")

	/// oval.portrait.fill
	static let oval_portrait_fill = UIImage(systemName: "oval.portrait.fill")

	/// oval.portrait.lefthalf.filled
	static let oval_portrait_lefthalf_filled = UIImage(systemName: "oval.portrait.lefthalf.filled")

	/// oval.portrait.righthalf.filled
	static let oval_portrait_righthalf_filled = UIImage(systemName: "oval.portrait.righthalf.filled")

	/// oval.portrait.tophalf.filled
	static let oval_portrait_tophalf_filled = UIImage(systemName: "oval.portrait.tophalf.filled")

	/// oval.portrait.bottomhalf.filled
	static let oval_portrait_bottomhalf_filled = UIImage(systemName: "oval.portrait.bottomhalf.filled")

	/// oval.portrait.inset.filled
	static let oval_portrait_inset_filled = UIImage(systemName: "oval.portrait.inset.filled")

	/// placeholdertext.fill
	static let placeholdertext_fill = UIImage(systemName: "placeholdertext.fill")

	/// square
	static let square = UIImage(systemName: "square")

	/// square.fill
	static let square_fill = UIImage(systemName: "square.fill")

	/// square.slash
	static let square_slash = UIImage(systemName: "square.slash")

	/// square.slash.fill
	static let square_slash_fill = UIImage(systemName: "square.slash.fill")

	/// square.lefthalf.filled
	static let square_lefthalf_filled = UIImage(systemName: "square.lefthalf.filled")

	/// square.righthalf.filled
	static let square_righthalf_filled = UIImage(systemName: "square.righthalf.filled")

	/// square.tophalf.filled
	static let square_tophalf_filled = UIImage(systemName: "square.tophalf.filled")

	/// square.bottomhalf.filled
	static let square_bottomhalf_filled = UIImage(systemName: "square.bottomhalf.filled")

	/// square.inset.filled
	static let square_inset_filled = UIImage(systemName: "square.inset.filled")

	/// square.split.2x1
	static let square_split_2x1 = UIImage(systemName: "square.split.2x1")

	/// square.split.2x1.fill
	static let square_split_2x1_fill = UIImage(systemName: "square.split.2x1.fill")

	/// square.split.1x2
	static let square_split_1x2 = UIImage(systemName: "square.split.1x2")

	/// square.split.1x2.fill
	static let square_split_1x2_fill = UIImage(systemName: "square.split.1x2.fill")

	/// square.split.2x2
	static let square_split_2x2 = UIImage(systemName: "square.split.2x2")

	/// square.split.2x2.fill
	static let square_split_2x2_fill = UIImage(systemName: "square.split.2x2.fill")

	/// square.split.diagonal.2x2
	static let square_split_diagonal_2x2 = UIImage(systemName: "square.split.diagonal.2x2")

	/// square.split.diagonal.2x2.fill
	static let square_split_diagonal_2x2_fill = UIImage(systemName: "square.split.diagonal.2x2.fill")

	/// square.split.diagonal
	static let square_split_diagonal = UIImage(systemName: "square.split.diagonal")

	/// square.split.diagonal.fill
	static let square_split_diagonal_fill = UIImage(systemName: "square.split.diagonal.fill")

	/// dot.square
	static let dot_square = UIImage(systemName: "dot.square")

	/// dot.square.fill
	static let dot_square_fill = UIImage(systemName: "dot.square.fill")

	/// circle.square
	static let circle_square = UIImage(systemName: "circle.square")

	/// circle.fill.square.fill
	static let circle_fill_square_fill = UIImage(systemName: "circle.fill.square.fill")

	/// square.dashed
	static let square_dashed = UIImage(systemName: "square.dashed")

	/// square.dashed.inset.filled
	static let square_dashed_inset_filled = UIImage(systemName: "square.dashed.inset.filled")

	/// questionmark.square.dashed
	static let questionmark_square_dashed = UIImage(systemName: "questionmark.square.dashed")

	/// square.on.square
	static let square_on_square = UIImage(systemName: "square.on.square")

	/// square.fill.on.square.fill
	static let square_fill_on_square_fill = UIImage(systemName: "square.fill.on.square.fill")

	/// square.filled.on.square
	static let square_filled_on_square = UIImage(systemName: "square.filled.on.square")

	/// sparkles.square.filled.on.square
	static let sparkles_square_filled_on_square = UIImage(systemName: "sparkles.square.filled.on.square")

	/// square.on.square.dashed
	static let square_on_square_dashed = UIImage(systemName: "square.on.square.dashed")

	/// plus.square.on.square
	static let plus_square_on_square = UIImage(systemName: "plus.square.on.square")

	/// plus.square.fill.on.square.fill
	static let plus_square_fill_on_square_fill = UIImage(systemName: "plus.square.fill.on.square.fill")

	/// square.on.circle
	static let square_on_circle = UIImage(systemName: "square.on.circle")

	/// square.fill.on.circle.fill
	static let square_fill_on_circle_fill = UIImage(systemName: "square.fill.on.circle.fill")

	/// r.square.on.square
	static let r_square_on_square = UIImage(systemName: "r.square.on.square")

	/// r.square.on.square.fill
	static let r_square_on_square_fill = UIImage(systemName: "r.square.on.square.fill")

	/// j.square.on.square
	static let j_square_on_square = UIImage(systemName: "j.square.on.square")

	/// j.square.on.square.fill
	static let j_square_on_square_fill = UIImage(systemName: "j.square.on.square.fill")

	/// h.square.on.square
	static let h_square_on_square = UIImage(systemName: "h.square.on.square")

	/// h.square.on.square.fill
	static let h_square_on_square_fill = UIImage(systemName: "h.square.on.square.fill")

	/// square.stack
	static let square_stack = UIImage(systemName: "square.stack")

	/// square.stack.fill
	static let square_stack_fill = UIImage(systemName: "square.stack.fill")

	/// squareshape
	static let squareshape = UIImage(systemName: "squareshape")

	/// squareshape.fill
	static let squareshape_fill = UIImage(systemName: "squareshape.fill")

	/// squareshape.dashed.squareshape
	static let squareshape_dashed_squareshape = UIImage(systemName: "squareshape.dashed.squareshape")

	/// squareshape.squareshape.dashed
	static let squareshape_squareshape_dashed = UIImage(systemName: "squareshape.squareshape.dashed")

	/// dot.squareshape
	static let dot_squareshape = UIImage(systemName: "dot.squareshape")

	/// dot.squareshape.fill
	static let dot_squareshape_fill = UIImage(systemName: "dot.squareshape.fill")

	/// app
	static let app = UIImage(systemName: "app")

	/// app.fill
	static let app_fill = UIImage(systemName: "app.fill")

	/// rectangle
	static let rectangle = UIImage(systemName: "rectangle")

	/// rectangle.fill
	static let rectangle_fill = UIImage(systemName: "rectangle.fill")

	/// rectangle.slash
	static let rectangle_slash = UIImage(systemName: "rectangle.slash")

	/// rectangle.slash.fill
	static let rectangle_slash_fill = UIImage(systemName: "rectangle.slash.fill")

	/// rectangle.lefthalf.filled
	static let rectangle_lefthalf_filled = UIImage(systemName: "rectangle.lefthalf.filled")

	/// rectangle.righthalf.filled
	static let rectangle_righthalf_filled = UIImage(systemName: "rectangle.righthalf.filled")

	/// rectangle.tophalf.filled
	static let rectangle_tophalf_filled = UIImage(systemName: "rectangle.tophalf.filled")

	/// rectangle.bottomhalf.filled
	static let rectangle_bottomhalf_filled = UIImage(systemName: "rectangle.bottomhalf.filled")

	/// rectangle.split.2x1
	static let rectangle_split_2x1 = UIImage(systemName: "rectangle.split.2x1")

	/// rectangle.split.2x1.fill
	static let rectangle_split_2x1_fill = UIImage(systemName: "rectangle.split.2x1.fill")

	/// rectangle.split.2x1.slash
	static let rectangle_split_2x1_slash = UIImage(systemName: "rectangle.split.2x1.slash")

	/// rectangle.split.2x1.slash.fill
	static let rectangle_split_2x1_slash_fill = UIImage(systemName: "rectangle.split.2x1.slash.fill")

	/// rectangle.split.1x2
	static let rectangle_split_1x2 = UIImage(systemName: "rectangle.split.1x2")

	/// rectangle.split.1x2.fill
	static let rectangle_split_1x2_fill = UIImage(systemName: "rectangle.split.1x2.fill")

	/// rectangle.split.3x1
	static let rectangle_split_3x1 = UIImage(systemName: "rectangle.split.3x1")

	/// rectangle.split.3x1.fill
	static let rectangle_split_3x1_fill = UIImage(systemName: "rectangle.split.3x1.fill")

	/// rectangle.split.2x2
	static let rectangle_split_2x2 = UIImage(systemName: "rectangle.split.2x2")

	/// rectangle.split.2x2.fill
	static let rectangle_split_2x2_fill = UIImage(systemName: "rectangle.split.2x2.fill")

	/// tablecells
	static let tablecells = UIImage(systemName: "tablecells")

	/// tablecells.fill
	static let tablecells_fill = UIImage(systemName: "tablecells.fill")

	/// tablecells.badge.ellipsis
	static let tablecells_badge_ellipsis = UIImage(systemName: "tablecells.badge.ellipsis")

	/// tablecells.fill.badge.ellipsis
	static let tablecells_fill_badge_ellipsis = UIImage(systemName: "tablecells.fill.badge.ellipsis")

	/// rectangle.split.3x3
	static let rectangle_split_3x3 = UIImage(systemName: "rectangle.split.3x3")

	/// rectangle.inset.fill
	static let rectangle_inset_fill = UIImage(systemName: "rectangle.inset.fill")

	/// rectangle.tophalf.inset.filled
	static let rectangle_tophalf_inset_filled = UIImage(systemName: "rectangle.tophalf.inset.filled")

	/// rectangle.bottomhalf.inset.filled
	static let rectangle_bottomhalf_inset_filled = UIImage(systemName: "rectangle.bottomhalf.inset.filled")

	/// rectangle.lefthalf.inset.filled
	static let rectangle_lefthalf_inset_filled = UIImage(systemName: "rectangle.lefthalf.inset.filled")

	/// rectangle.righthalf.inset.filled
	static let rectangle_righthalf_inset_filled = UIImage(systemName: "rectangle.righthalf.inset.filled")

	/// rectangle.leadinghalf.inset.filled
	static let rectangle_leadinghalf_inset_filled = UIImage(systemName: "rectangle.leadinghalf.inset.filled")

	/// rectangle.trailinghalf.inset.filled
	static let rectangle_trailinghalf_inset_filled = UIImage(systemName: "rectangle.trailinghalf.inset.filled")

	/// rectangle.lefthalf.inset.filled.arrow.left
	static let rectangle_lefthalf_inset_filled_arrow_left = UIImage(systemName: "rectangle.lefthalf.inset.filled.arrow.left")

	/// rectangle.righthalf.inset.filled.arrow.right
	static let rectangle_righthalf_inset_filled_arrow_right = UIImage(systemName: "rectangle.righthalf.inset.filled.arrow.right")

	/// rectangle.leadinghalf.inset.filled.arrow.leading
	static let rectangle_leadinghalf_inset_filled_arrow_leading = UIImage(systemName: "rectangle.leadinghalf.inset.filled.arrow.leading")

	/// rectangle.trailinghalf.inset.filled.arrow.trailing
	static let rectangle_trailinghalf_inset_filled_arrow_trailing = UIImage(systemName: "rectangle.trailinghalf.inset.filled.arrow.trailing")

	/// rectangle.topthird.inset.filled
	static let rectangle_topthird_inset_filled = UIImage(systemName: "rectangle.topthird.inset.filled")

	/// rectangle.bottomthird.inset.filled
	static let rectangle_bottomthird_inset_filled = UIImage(systemName: "rectangle.bottomthird.inset.filled")

	/// rectangle.leftthird.inset.filled
	static let rectangle_leftthird_inset_filled = UIImage(systemName: "rectangle.leftthird.inset.filled")

	/// rectangle.rightthird.inset.filled
	static let rectangle_rightthird_inset_filled = UIImage(systemName: "rectangle.rightthird.inset.filled")

	/// rectangle.leadingthird.inset.filled
	static let rectangle_leadingthird_inset_filled = UIImage(systemName: "rectangle.leadingthird.inset.filled")

	/// rectangle.trailingthird.inset.filled
	static let rectangle_trailingthird_inset_filled = UIImage(systemName: "rectangle.trailingthird.inset.filled")

	/// rectangle.center.inset.filled
	static let rectangle_center_inset_filled = UIImage(systemName: "rectangle.center.inset.filled")

	/// rectangle.inset.topleft.filled
	static let rectangle_inset_topleft_filled = UIImage(systemName: "rectangle.inset.topleft.filled")

	/// rectangle.inset.topright.filled
	static let rectangle_inset_topright_filled = UIImage(systemName: "rectangle.inset.topright.filled")

	/// rectangle.inset.topleading.filled
	static let rectangle_inset_topleading_filled = UIImage(systemName: "rectangle.inset.topleading.filled")

	/// rectangle.inset.toptrailing.filled
	static let rectangle_inset_toptrailing_filled = UIImage(systemName: "rectangle.inset.toptrailing.filled")

	/// rectangle.inset.bottomleft.filled
	static let rectangle_inset_bottomleft_filled = UIImage(systemName: "rectangle.inset.bottomleft.filled")

	/// rectangle.inset.bottomright.filled
	static let rectangle_inset_bottomright_filled = UIImage(systemName: "rectangle.inset.bottomright.filled")

	/// rectangle.inset.bottomleading.filled
	static let rectangle_inset_bottomleading_filled = UIImage(systemName: "rectangle.inset.bottomleading.filled")

	/// rectangle.inset.bottomtrailing.filled
	static let rectangle_inset_bottomtrailing_filled = UIImage(systemName: "rectangle.inset.bottomtrailing.filled")

	/// rectangle.on.rectangle
	static let rectangle_on_rectangle = UIImage(systemName: "rectangle.on.rectangle")

	/// rectangle.fill.on.rectangle.fill
	static let rectangle_fill_on_rectangle_fill = UIImage(systemName: "rectangle.fill.on.rectangle.fill")

	/// rectangle.on.rectangle.circle
	static let rectangle_on_rectangle_circle = UIImage(systemName: "rectangle.on.rectangle.circle")

	/// rectangle.on.rectangle.circle.fill
	static let rectangle_on_rectangle_circle_fill = UIImage(systemName: "rectangle.on.rectangle.circle.fill")

	/// rectangle.on.rectangle.square
	static let rectangle_on_rectangle_square = UIImage(systemName: "rectangle.on.rectangle.square")

	/// rectangle.on.rectangle.square.fill
	static let rectangle_on_rectangle_square_fill = UIImage(systemName: "rectangle.on.rectangle.square.fill")

	/// rectangle.inset.filled.on.rectangle
	static let rectangle_inset_filled_on_rectangle = UIImage(systemName: "rectangle.inset.filled.on.rectangle")

	/// rectangle.on.rectangle.slash
	static let rectangle_on_rectangle_slash = UIImage(systemName: "rectangle.on.rectangle.slash")

	/// rectangle.on.rectangle.slash.fill
	static let rectangle_on_rectangle_slash_fill = UIImage(systemName: "rectangle.on.rectangle.slash.fill")

	/// rectangle.on.rectangle.slash.circle
	static let rectangle_on_rectangle_slash_circle = UIImage(systemName: "rectangle.on.rectangle.slash.circle")

	/// rectangle.on.rectangle.slash.circle.fill
	static let rectangle_on_rectangle_slash_circle_fill = UIImage(systemName: "rectangle.on.rectangle.slash.circle.fill")

	/// play.rectangle.on.rectangle
	static let play_rectangle_on_rectangle = UIImage(systemName: "play.rectangle.on.rectangle")

	/// play.rectangle.on.rectangle.fill
	static let play_rectangle_on_rectangle_fill = UIImage(systemName: "play.rectangle.on.rectangle.fill")

	/// play.rectangle.on.rectangle.circle
	static let play_rectangle_on_rectangle_circle = UIImage(systemName: "play.rectangle.on.rectangle.circle")

	/// play.rectangle.on.rectangle.circle.fill
	static let play_rectangle_on_rectangle_circle_fill = UIImage(systemName: "play.rectangle.on.rectangle.circle.fill")

	/// plus.rectangle.on.rectangle
	static let plus_rectangle_on_rectangle = UIImage(systemName: "plus.rectangle.on.rectangle")

	/// plus.rectangle.fill.on.rectangle.fill
	static let plus_rectangle_fill_on_rectangle_fill = UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill")

	/// rectangle.portrait
	static let rectangle_portrait = UIImage(systemName: "rectangle.portrait")

	/// rectangle.portrait.fill
	static let rectangle_portrait_fill = UIImage(systemName: "rectangle.portrait.fill")

	/// rectangle.portrait.slash
	static let rectangle_portrait_slash = UIImage(systemName: "rectangle.portrait.slash")

	/// rectangle.portrait.slash.fill
	static let rectangle_portrait_slash_fill = UIImage(systemName: "rectangle.portrait.slash.fill")

	/// rectangle.portrait.lefthalf.filled
	static let rectangle_portrait_lefthalf_filled = UIImage(systemName: "rectangle.portrait.lefthalf.filled")

	/// rectangle.portrait.righthalf.filled
	static let rectangle_portrait_righthalf_filled = UIImage(systemName: "rectangle.portrait.righthalf.filled")

	/// rectangle.portrait.tophalf.filled
	static let rectangle_portrait_tophalf_filled = UIImage(systemName: "rectangle.portrait.tophalf.filled")

	/// rectangle.portrait.bottomhalf.filled
	static let rectangle_portrait_bottomhalf_filled = UIImage(systemName: "rectangle.portrait.bottomhalf.filled")

	/// rectangle.portrait.inset.filled
	static let rectangle_portrait_inset_filled = UIImage(systemName: "rectangle.portrait.inset.filled")

	/// rectangle.portrait.tophalf.inset.filled
	static let rectangle_portrait_tophalf_inset_filled = UIImage(systemName: "rectangle.portrait.tophalf.inset.filled")

	/// rectangle.portrait.bottomhalf.inset.filled
	static let rectangle_portrait_bottomhalf_inset_filled = UIImage(systemName: "rectangle.portrait.bottomhalf.inset.filled")

	/// rectangle.portrait.lefthalf.inset.filled
	static let rectangle_portrait_lefthalf_inset_filled = UIImage(systemName: "rectangle.portrait.lefthalf.inset.filled")

	/// rectangle.portrait.righthalf.inset.filled
	static let rectangle_portrait_righthalf_inset_filled = UIImage(systemName: "rectangle.portrait.righthalf.inset.filled")

	/// rectangle.portrait.leadinghalf.inset.filled
	static let rectangle_portrait_leadinghalf_inset_filled = UIImage(systemName: "rectangle.portrait.leadinghalf.inset.filled")

	/// rectangle.portrait.trailinghalf.inset.filled
	static let rectangle_portrait_trailinghalf_inset_filled = UIImage(systemName: "rectangle.portrait.trailinghalf.inset.filled")

	/// rectangle.portrait.topthird.inset.filled
	static let rectangle_portrait_topthird_inset_filled = UIImage(systemName: "rectangle.portrait.topthird.inset.filled")

	/// rectangle.portrait.bottomthird.inset.filled
	static let rectangle_portrait_bottomthird_inset_filled = UIImage(systemName: "rectangle.portrait.bottomthird.inset.filled")

	/// rectangle.portrait.leftthird.inset.filled
	static let rectangle_portrait_leftthird_inset_filled = UIImage(systemName: "rectangle.portrait.leftthird.inset.filled")

	/// rectangle.portrait.rightthird.inset.filled
	static let rectangle_portrait_rightthird_inset_filled = UIImage(systemName: "rectangle.portrait.rightthird.inset.filled")

	/// rectangle.portrait.leadingthird.inset.filled
	static let rectangle_portrait_leadingthird_inset_filled = UIImage(systemName: "rectangle.portrait.leadingthird.inset.filled")

	/// rectangle.portrait.trailingthird.inset.filled
	static let rectangle_portrait_trailingthird_inset_filled = UIImage(systemName: "rectangle.portrait.trailingthird.inset.filled")

	/// rectangle.portrait.center.inset.filled
	static let rectangle_portrait_center_inset_filled = UIImage(systemName: "rectangle.portrait.center.inset.filled")

	/// rectangle.portrait.topleft.inset.filled
	static let rectangle_portrait_topleft_inset_filled = UIImage(systemName: "rectangle.portrait.topleft.inset.filled")

	/// rectangle.portrait.topright.inset.filled
	static let rectangle_portrait_topright_inset_filled = UIImage(systemName: "rectangle.portrait.topright.inset.filled")

	/// rectangle.portrait.topleading.inset.filled
	static let rectangle_portrait_topleading_inset_filled = UIImage(systemName: "rectangle.portrait.topleading.inset.filled")

	/// rectangle.portrait.toptrailing.inset.filled
	static let rectangle_portrait_toptrailing_inset_filled = UIImage(systemName: "rectangle.portrait.toptrailing.inset.filled")

	/// rectangle.portrait.bottomleft.inset.filled
	static let rectangle_portrait_bottomleft_inset_filled = UIImage(systemName: "rectangle.portrait.bottomleft.inset.filled")

	/// rectangle.portrait.bottomright.inset.filled
	static let rectangle_portrait_bottomright_inset_filled = UIImage(systemName: "rectangle.portrait.bottomright.inset.filled")

	/// rectangle.portrait.bottomleading.inset.filled
	static let rectangle_portrait_bottomleading_inset_filled = UIImage(systemName: "rectangle.portrait.bottomleading.inset.filled")

	/// rectangle.portrait.bottomtrailing.inset.filled
	static let rectangle_portrait_bottomtrailing_inset_filled = UIImage(systemName: "rectangle.portrait.bottomtrailing.inset.filled")

	/// rectangle.portrait.on.rectangle.portrait
	static let rectangle_portrait_on_rectangle_portrait = UIImage(systemName: "rectangle.portrait.on.rectangle.portrait")

	/// rectangle.portrait.on.rectangle.portrait.fill
	static let rectangle_portrait_on_rectangle_portrait_fill = UIImage(systemName: "rectangle.portrait.on.rectangle.portrait.fill")

	/// rectangle.portrait.on.rectangle.portrait.slash
	static let rectangle_portrait_on_rectangle_portrait_slash = UIImage(systemName: "rectangle.portrait.on.rectangle.portrait.slash")

	/// rectangle.portrait.on.rectangle.portrait.slash.fill
	static let rectangle_portrait_on_rectangle_portrait_slash_fill = UIImage(systemName: "rectangle.portrait.on.rectangle.portrait.slash.fill")

	/// rectangle.portrait.split.2x1
	static let rectangle_portrait_split_2x1 = UIImage(systemName: "rectangle.portrait.split.2x1")

	/// rectangle.portrait.split.2x1.fill
	static let rectangle_portrait_split_2x1_fill = UIImage(systemName: "rectangle.portrait.split.2x1.fill")

	/// rectangle.portrait.split.2x1.slash
	static let rectangle_portrait_split_2x1_slash = UIImage(systemName: "rectangle.portrait.split.2x1.slash")

	/// rectangle.portrait.split.2x1.slash.fill
	static let rectangle_portrait_split_2x1_slash_fill = UIImage(systemName: "rectangle.portrait.split.2x1.slash.fill")

	/// triangle
	static let triangle = UIImage(systemName: "triangle")

	/// triangle.fill
	static let triangle_fill = UIImage(systemName: "triangle.fill")

	/// triangle.lefthalf.filled
	static let triangle_lefthalf_filled = UIImage(systemName: "triangle.lefthalf.filled")

	/// triangle.righthalf.filled
	static let triangle_righthalf_filled = UIImage(systemName: "triangle.righthalf.filled")

	/// triangle.tophalf.filled
	static let triangle_tophalf_filled = UIImage(systemName: "triangle.tophalf.filled")

	/// triangle.bottomhalf.filled
	static let triangle_bottomhalf_filled = UIImage(systemName: "triangle.bottomhalf.filled")

	/// triangle.inset.filled
	static let triangle_inset_filled = UIImage(systemName: "triangle.inset.filled")

	/// diamond
	static let diamond = UIImage(systemName: "diamond")

	/// diamond.fill
	static let diamond_fill = UIImage(systemName: "diamond.fill")

	/// diamond.lefthalf.filled
	static let diamond_lefthalf_filled = UIImage(systemName: "diamond.lefthalf.filled")

	/// diamond.righthalf.filled
	static let diamond_righthalf_filled = UIImage(systemName: "diamond.righthalf.filled")

	/// diamond.tophalf.filled
	static let diamond_tophalf_filled = UIImage(systemName: "diamond.tophalf.filled")

	/// diamond.bottomhalf.filled
	static let diamond_bottomhalf_filled = UIImage(systemName: "diamond.bottomhalf.filled")

	/// diamond.inset.filled
	static let diamond_inset_filled = UIImage(systemName: "diamond.inset.filled")

	/// octagon
	static let octagon = UIImage(systemName: "octagon")

	/// octagon.fill
	static let octagon_fill = UIImage(systemName: "octagon.fill")

	/// octagon.lefthalf.filled
	static let octagon_lefthalf_filled = UIImage(systemName: "octagon.lefthalf.filled")

	/// octagon.righthalf.filled
	static let octagon_righthalf_filled = UIImage(systemName: "octagon.righthalf.filled")

	/// octagon.tophalf.filled
	static let octagon_tophalf_filled = UIImage(systemName: "octagon.tophalf.filled")

	/// octagon.bottomhalf.filled
	static let octagon_bottomhalf_filled = UIImage(systemName: "octagon.bottomhalf.filled")

	/// hexagon
	static let hexagon = UIImage(systemName: "hexagon")

	/// hexagon.fill
	static let hexagon_fill = UIImage(systemName: "hexagon.fill")

	/// hexagon.lefthalf.filled
	static let hexagon_lefthalf_filled = UIImage(systemName: "hexagon.lefthalf.filled")

	/// hexagon.righthalf.filled
	static let hexagon_righthalf_filled = UIImage(systemName: "hexagon.righthalf.filled")

	/// hexagon.tophalf.filled
	static let hexagon_tophalf_filled = UIImage(systemName: "hexagon.tophalf.filled")

	/// hexagon.bottomhalf.filled
	static let hexagon_bottomhalf_filled = UIImage(systemName: "hexagon.bottomhalf.filled")

	/// pentagon
	static let pentagon = UIImage(systemName: "pentagon")

	/// pentagon.fill
	static let pentagon_fill = UIImage(systemName: "pentagon.fill")

	/// pentagon.lefthalf.filled
	static let pentagon_lefthalf_filled = UIImage(systemName: "pentagon.lefthalf.filled")

	/// pentagon.righthalf.filled
	static let pentagon_righthalf_filled = UIImage(systemName: "pentagon.righthalf.filled")

	/// pentagon.tophalf.filled
	static let pentagon_tophalf_filled = UIImage(systemName: "pentagon.tophalf.filled")

	/// pentagon.bottomhalf.filled
	static let pentagon_bottomhalf_filled = UIImage(systemName: "pentagon.bottomhalf.filled")

	/// suit.heart
	static let suit_heart = UIImage(systemName: "suit.heart")

	/// suit.heart.fill
	static let suit_heart_fill = UIImage(systemName: "suit.heart.fill")

	/// suit.club
	static let suit_club = UIImage(systemName: "suit.club")

	/// suit.club.fill
	static let suit_club_fill = UIImage(systemName: "suit.club.fill")

	/// suit.spade
	static let suit_spade = UIImage(systemName: "suit.spade")

	/// suit.spade.fill
	static let suit_spade_fill = UIImage(systemName: "suit.spade.fill")

	/// suit.diamond
	static let suit_diamond = UIImage(systemName: "suit.diamond")

	/// suit.diamond.fill
	static let suit_diamond_fill = UIImage(systemName: "suit.diamond.fill")

	/// heart
	static let heart = UIImage(systemName: "heart")

	/// heart.fill
	static let heart_fill = UIImage(systemName: "heart.fill")

	/// heart.circle
	static let heart_circle = UIImage(systemName: "heart.circle")

	/// heart.circle.fill
	static let heart_circle_fill = UIImage(systemName: "heart.circle.fill")

	/// heart.square
	static let heart_square = UIImage(systemName: "heart.square")

	/// heart.square.fill
	static let heart_square_fill = UIImage(systemName: "heart.square.fill")

	/// heart.rectangle
	static let heart_rectangle = UIImage(systemName: "heart.rectangle")

	/// heart.rectangle.fill
	static let heart_rectangle_fill = UIImage(systemName: "heart.rectangle.fill")

	/// heart.slash
	static let heart_slash = UIImage(systemName: "heart.slash")

	/// heart.slash.fill
	static let heart_slash_fill = UIImage(systemName: "heart.slash.fill")

	/// heart.slash.circle
	static let heart_slash_circle = UIImage(systemName: "heart.slash.circle")

	/// heart.slash.circle.fill
	static let heart_slash_circle_fill = UIImage(systemName: "heart.slash.circle.fill")

	/// bolt.heart
	static let bolt_heart = UIImage(systemName: "bolt.heart")

	/// bolt.heart.fill
	static let bolt_heart_fill = UIImage(systemName: "bolt.heart.fill")

	/// arrow.up.heart
	static let arrow_up_heart = UIImage(systemName: "arrow.up.heart")

	/// arrow.up.heart.fill
	static let arrow_up_heart_fill = UIImage(systemName: "arrow.up.heart.fill")

	/// arrow.down.heart
	static let arrow_down_heart = UIImage(systemName: "arrow.down.heart")

	/// arrow.down.heart.fill
	static let arrow_down_heart_fill = UIImage(systemName: "arrow.down.heart.fill")

	/// arrow.clockwise.heart
	static let arrow_clockwise_heart = UIImage(systemName: "arrow.clockwise.heart")

	/// arrow.clockwise.heart.fill
	static let arrow_clockwise_heart_fill = UIImage(systemName: "arrow.clockwise.heart.fill")

	/// rhombus
	static let rhombus = UIImage(systemName: "rhombus")

	/// rhombus.fill
	static let rhombus_fill = UIImage(systemName: "rhombus.fill")

	/// star
	static let star = UIImage(systemName: "star")

	/// star.fill
	static let star_fill = UIImage(systemName: "star.fill")

	/// star.leadinghalf.filled
	static let star_leadinghalf_filled = UIImage(systemName: "star.leadinghalf.filled")

	/// star.circle
	static let star_circle = UIImage(systemName: "star.circle")

	/// star.circle.fill
	static let star_circle_fill = UIImage(systemName: "star.circle.fill")

	/// star.square
	static let star_square = UIImage(systemName: "star.square")

	/// star.square.fill
	static let star_square_fill = UIImage(systemName: "star.square.fill")

	/// star.slash
	static let star_slash = UIImage(systemName: "star.slash")

	/// star.slash.fill
	static let star_slash_fill = UIImage(systemName: "star.slash.fill")

	/// line.horizontal.star.fill.line.horizontal
	static let line_horizontal_star_fill_line_horizontal = UIImage(systemName: "line.horizontal.star.fill.line.horizontal")

	/// flag
	static let flag = UIImage(systemName: "flag")

	/// flag.fill
	static let flag_fill = UIImage(systemName: "flag.fill")

	/// flag.circle
	static let flag_circle = UIImage(systemName: "flag.circle")

	/// flag.circle.fill
	static let flag_circle_fill = UIImage(systemName: "flag.circle.fill")

	/// flag.square
	static let flag_square = UIImage(systemName: "flag.square")

	/// flag.square.fill
	static let flag_square_fill = UIImage(systemName: "flag.square.fill")

	/// flag.slash
	static let flag_slash = UIImage(systemName: "flag.slash")

	/// flag.slash.fill
	static let flag_slash_fill = UIImage(systemName: "flag.slash.fill")

	/// flag.slash.circle
	static let flag_slash_circle = UIImage(systemName: "flag.slash.circle")

	/// flag.slash.circle.fill
	static let flag_slash_circle_fill = UIImage(systemName: "flag.slash.circle.fill")

	/// flag.badge.ellipsis
	static let flag_badge_ellipsis = UIImage(systemName: "flag.badge.ellipsis")

	/// flag.badge.ellipsis.fill
	static let flag_badge_ellipsis_fill = UIImage(systemName: "flag.badge.ellipsis.fill")

	/// flag.2.crossed
	static let flag_2_crossed = UIImage(systemName: "flag.2.crossed")

	/// flag.2.crossed.fill
	static let flag_2_crossed_fill = UIImage(systemName: "flag.2.crossed.fill")

	/// flag.filled.and.flag.crossed
	static let flag_filled_and_flag_crossed = UIImage(systemName: "flag.filled.and.flag.crossed")

	/// flag.and.flag.filled.crossed
	static let flag_and_flag_filled_crossed = UIImage(systemName: "flag.and.flag.filled.crossed")

	/// location
	static let location = UIImage(systemName: "location")

	/// location.fill
	static let location_fill = UIImage(systemName: "location.fill")

	/// location.north.circle
	static let location_north_circle = UIImage(systemName: "location.north.circle")

	/// location.north.circle.fill
	static let location_north_circle_fill = UIImage(systemName: "location.north.circle.fill")

	/// location.slash
	static let location_slash = UIImage(systemName: "location.slash")

	/// location.slash.fill
	static let location_slash_fill = UIImage(systemName: "location.slash.fill")

	/// location.north
	static let location_north = UIImage(systemName: "location.north")

	/// location.north.fill
	static let location_north_fill = UIImage(systemName: "location.north.fill")

	/// location.circle
	static let location_circle = UIImage(systemName: "location.circle")

	/// location.circle.fill
	static let location_circle_fill = UIImage(systemName: "location.circle.fill")

	/// location.square
	static let location_square = UIImage(systemName: "location.square")

	/// location.square.fill
	static let location_square_fill = UIImage(systemName: "location.square.fill")

	/// location.north.line
	static let location_north_line = UIImage(systemName: "location.north.line")

	/// location.north.line.fill
	static let location_north_line_fill = UIImage(systemName: "location.north.line.fill")

	/// sensor.tag.radiowaves.forward
	static let sensor_tag_radiowaves_forward = UIImage(systemName: "sensor.tag.radiowaves.forward")

	/// sensor.tag.radiowaves.forward.fill
	static let sensor_tag_radiowaves_forward_fill = UIImage(systemName: "sensor.tag.radiowaves.forward.fill")

	/// bell
	static let bell = UIImage(systemName: "bell")

	/// bell.fill
	static let bell_fill = UIImage(systemName: "bell.fill")

	/// bell.circle
	static let bell_circle = UIImage(systemName: "bell.circle")

	/// bell.circle.fill
	static let bell_circle_fill = UIImage(systemName: "bell.circle.fill")

	/// bell.square
	static let bell_square = UIImage(systemName: "bell.square")

	/// bell.square.fill
	static let bell_square_fill = UIImage(systemName: "bell.square.fill")

	/// bell.slash
	static let bell_slash = UIImage(systemName: "bell.slash")

	/// bell.slash.fill
	static let bell_slash_fill = UIImage(systemName: "bell.slash.fill")

	/// bell.slash.circle
	static let bell_slash_circle = UIImage(systemName: "bell.slash.circle")

	/// bell.slash.circle.fill
	static let bell_slash_circle_fill = UIImage(systemName: "bell.slash.circle.fill")

	/// bell.and.waveform
	static let bell_and_waveform = UIImage(systemName: "bell.and.waveform")

	/// bell.and.waveform.fill
	static let bell_and_waveform_fill = UIImage(systemName: "bell.and.waveform.fill")

	/// bell.badge
	static let bell_badge = UIImage(systemName: "bell.badge")

	/// bell.badge.fill
	static let bell_badge_fill = UIImage(systemName: "bell.badge.fill")

	/// bell.badge.circle
	static let bell_badge_circle = UIImage(systemName: "bell.badge.circle")

	/// bell.badge.circle.fill
	static let bell_badge_circle_fill = UIImage(systemName: "bell.badge.circle.fill")

	/// tag
	static let tag = UIImage(systemName: "tag")

	/// tag.fill
	static let tag_fill = UIImage(systemName: "tag.fill")

	/// tag.circle
	static let tag_circle = UIImage(systemName: "tag.circle")

	/// tag.circle.fill
	static let tag_circle_fill = UIImage(systemName: "tag.circle.fill")

	/// tag.square
	static let tag_square = UIImage(systemName: "tag.square")

	/// tag.square.fill
	static let tag_square_fill = UIImage(systemName: "tag.square.fill")

	/// tag.slash
	static let tag_slash = UIImage(systemName: "tag.slash")

	/// tag.slash.fill
	static let tag_slash_fill = UIImage(systemName: "tag.slash.fill")

	/// bolt
	static let bolt = UIImage(systemName: "bolt")

	/// bolt.fill
	static let bolt_fill = UIImage(systemName: "bolt.fill")

	/// bolt.circle
	static let bolt_circle = UIImage(systemName: "bolt.circle")

	/// bolt.circle.fill
	static let bolt_circle_fill = UIImage(systemName: "bolt.circle.fill")

	/// bolt.square
	static let bolt_square = UIImage(systemName: "bolt.square")

	/// bolt.square.fill
	static let bolt_square_fill = UIImage(systemName: "bolt.square.fill")

	/// bolt.shield
	static let bolt_shield = UIImage(systemName: "bolt.shield")

	/// bolt.shield.fill
	static let bolt_shield_fill = UIImage(systemName: "bolt.shield.fill")

	/// bolt.slash
	static let bolt_slash = UIImage(systemName: "bolt.slash")

	/// bolt.slash.fill
	static let bolt_slash_fill = UIImage(systemName: "bolt.slash.fill")

	/// bolt.slash.circle
	static let bolt_slash_circle = UIImage(systemName: "bolt.slash.circle")

	/// bolt.slash.circle.fill
	static let bolt_slash_circle_fill = UIImage(systemName: "bolt.slash.circle.fill")

	/// bolt.badge.a
	static let bolt_badge_a = UIImage(systemName: "bolt.badge.a")

	/// bolt.badge.a.fill
	static let bolt_badge_a_fill = UIImage(systemName: "bolt.badge.a.fill")

	/// bolt.horizontal
	static let bolt_horizontal = UIImage(systemName: "bolt.horizontal")

	/// bolt.horizontal.fill
	static let bolt_horizontal_fill = UIImage(systemName: "bolt.horizontal.fill")

	/// bolt.horizontal.circle
	static let bolt_horizontal_circle = UIImage(systemName: "bolt.horizontal.circle")

	/// bolt.horizontal.circle.fill
	static let bolt_horizontal_circle_fill = UIImage(systemName: "bolt.horizontal.circle.fill")

	/// eye
	static let eye = UIImage(systemName: "eye")

	/// eye.fill
	static let eye_fill = UIImage(systemName: "eye.fill")

	/// eye.circle
	static let eye_circle = UIImage(systemName: "eye.circle")

	/// eye.circle.fill
	static let eye_circle_fill = UIImage(systemName: "eye.circle.fill")

	/// eye.square
	static let eye_square = UIImage(systemName: "eye.square")

	/// eye.square.fill
	static let eye_square_fill = UIImage(systemName: "eye.square.fill")

	/// eye.slash
	static let eye_slash = UIImage(systemName: "eye.slash")

	/// eye.slash.fill
	static let eye_slash_fill = UIImage(systemName: "eye.slash.fill")

	/// eye.slash.circle
	static let eye_slash_circle = UIImage(systemName: "eye.slash.circle")

	/// eye.slash.circle.fill
	static let eye_slash_circle_fill = UIImage(systemName: "eye.slash.circle.fill")

	/// eye.trianglebadge.exclamationmark
	static let eye_trianglebadge_exclamationmark = UIImage(systemName: "eye.trianglebadge.exclamationmark")

	/// eye.trianglebadge.exclamationmark.fill
	static let eye_trianglebadge_exclamationmark_fill = UIImage(systemName: "eye.trianglebadge.exclamationmark.fill")

	/// tshirt
	static let tshirt = UIImage(systemName: "tshirt")

	/// tshirt.fill
	static let tshirt_fill = UIImage(systemName: "tshirt.fill")

	/// eyes
	static let eyes = UIImage(systemName: "eyes")

	/// eyes.inverse
	static let eyes_inverse = UIImage(systemName: "eyes.inverse")

	/// eyebrow
	static let eyebrow = UIImage(systemName: "eyebrow")

	/// nose
	static let nose = UIImage(systemName: "nose")

	/// nose.fill
	static let nose_fill = UIImage(systemName: "nose.fill")

	/// mustache
	static let mustache = UIImage(systemName: "mustache")

	/// mustache.fill
	static let mustache_fill = UIImage(systemName: "mustache.fill")

	/// mouth
	static let mouth = UIImage(systemName: "mouth")

	/// mouth.fill
	static let mouth_fill = UIImage(systemName: "mouth.fill")

	/// eyeglasses
	static let eyeglasses = UIImage(systemName: "eyeglasses")

	/// facemask
	static let facemask = UIImage(systemName: "facemask")

	/// facemask.fill
	static let facemask_fill = UIImage(systemName: "facemask.fill")

	/// brain.head.profile
	static let brain_head_profile = UIImage(systemName: "brain.head.profile")

	/// brain
	static let brain = UIImage(systemName: "brain")

	/// icloud
	static let icloud = UIImage(systemName: "icloud")

	/// icloud.fill
	static let icloud_fill = UIImage(systemName: "icloud.fill")

	/// icloud.circle
	static let icloud_circle = UIImage(systemName: "icloud.circle")

	/// icloud.circle.fill
	static let icloud_circle_fill = UIImage(systemName: "icloud.circle.fill")

	/// icloud.square
	static let icloud_square = UIImage(systemName: "icloud.square")

	/// icloud.square.fill
	static let icloud_square_fill = UIImage(systemName: "icloud.square.fill")

	/// icloud.slash
	static let icloud_slash = UIImage(systemName: "icloud.slash")

	/// icloud.slash.fill
	static let icloud_slash_fill = UIImage(systemName: "icloud.slash.fill")

	/// exclamationmark.icloud
	static let exclamationmark_icloud = UIImage(systemName: "exclamationmark.icloud")

	/// exclamationmark.icloud.fill
	static let exclamationmark_icloud_fill = UIImage(systemName: "exclamationmark.icloud.fill")

	/// checkmark.icloud
	static let checkmark_icloud = UIImage(systemName: "checkmark.icloud")

	/// checkmark.icloud.fill
	static let checkmark_icloud_fill = UIImage(systemName: "checkmark.icloud.fill")

	/// xmark.icloud
	static let xmark_icloud = UIImage(systemName: "xmark.icloud")

	/// xmark.icloud.fill
	static let xmark_icloud_fill = UIImage(systemName: "xmark.icloud.fill")

	/// link.icloud
	static let link_icloud = UIImage(systemName: "link.icloud")

	/// link.icloud.fill
	static let link_icloud_fill = UIImage(systemName: "link.icloud.fill")

	/// bolt.horizontal.icloud
	static let bolt_horizontal_icloud = UIImage(systemName: "bolt.horizontal.icloud")

	/// bolt.horizontal.icloud.fill
	static let bolt_horizontal_icloud_fill = UIImage(systemName: "bolt.horizontal.icloud.fill")

	/// person.icloud
	static let person_icloud = UIImage(systemName: "person.icloud")

	/// person.icloud.fill
	static let person_icloud_fill = UIImage(systemName: "person.icloud.fill")

	/// lock.icloud
	static let lock_icloud = UIImage(systemName: "lock.icloud")

	/// lock.icloud.fill
	static let lock_icloud_fill = UIImage(systemName: "lock.icloud.fill")

	/// key.icloud
	static let key_icloud = UIImage(systemName: "key.icloud")

	/// key.icloud.fill
	static let key_icloud_fill = UIImage(systemName: "key.icloud.fill")

	/// arrow.clockwise.icloud
	static let arrow_clockwise_icloud = UIImage(systemName: "arrow.clockwise.icloud")

	/// arrow.clockwise.icloud.fill
	static let arrow_clockwise_icloud_fill = UIImage(systemName: "arrow.clockwise.icloud.fill")

	/// arrow.counterclockwise.icloud
	static let arrow_counterclockwise_icloud = UIImage(systemName: "arrow.counterclockwise.icloud")

	/// arrow.counterclockwise.icloud.fill
	static let arrow_counterclockwise_icloud_fill = UIImage(systemName: "arrow.counterclockwise.icloud.fill")

	/// icloud.and.arrow.down
	static let icloud_and_arrow_down = UIImage(systemName: "icloud.and.arrow.down")

	/// icloud.and.arrow.down.fill
	static let icloud_and_arrow_down_fill = UIImage(systemName: "icloud.and.arrow.down.fill")

	/// icloud.and.arrow.up
	static let icloud_and_arrow_up = UIImage(systemName: "icloud.and.arrow.up")

	/// icloud.and.arrow.up.fill
	static let icloud_and_arrow_up_fill = UIImage(systemName: "icloud.and.arrow.up.fill")

	/// flashlight.off.fill
	static let flashlight_off_fill = UIImage(systemName: "flashlight.off.fill")

	/// flashlight.on.fill
	static let flashlight_on_fill = UIImage(systemName: "flashlight.on.fill")

	/// camera
	static let camera = UIImage(systemName: "camera")

	/// camera.fill
	static let camera_fill = UIImage(systemName: "camera.fill")

	/// camera.circle
	static let camera_circle = UIImage(systemName: "camera.circle")

	/// camera.circle.fill
	static let camera_circle_fill = UIImage(systemName: "camera.circle.fill")

	/// camera.shutter.button
	static let camera_shutter_button = UIImage(systemName: "camera.shutter.button")

	/// camera.shutter.button.fill
	static let camera_shutter_button_fill = UIImage(systemName: "camera.shutter.button.fill")

	/// camera.badge.ellipsis
	static let camera_badge_ellipsis = UIImage(systemName: "camera.badge.ellipsis")

	/// camera.fill.badge.ellipsis
	static let camera_fill_badge_ellipsis = UIImage(systemName: "camera.fill.badge.ellipsis")

	/// arrow.triangle.2.circlepath.camera
	static let arrow_triangle_2_circlepath_camera = UIImage(systemName: "arrow.triangle.2.circlepath.camera")

	/// arrow.triangle.2.circlepath.camera.fill
	static let arrow_triangle_2_circlepath_camera_fill = UIImage(systemName: "arrow.triangle.2.circlepath.camera.fill")

	/// camera.on.rectangle
	static let camera_on_rectangle = UIImage(systemName: "camera.on.rectangle")

	/// camera.on.rectangle.fill
	static let camera_on_rectangle_fill = UIImage(systemName: "camera.on.rectangle.fill")

	/// message
	static let message = UIImage(systemName: "message")

	/// message.fill
	static let message_fill = UIImage(systemName: "message.fill")

	/// message.circle
	static let message_circle = UIImage(systemName: "message.circle")

	/// message.circle.fill
	static let message_circle_fill = UIImage(systemName: "message.circle.fill")

	/// message.and.waveform
	static let message_and_waveform = UIImage(systemName: "message.and.waveform")

	/// message.and.waveform.fill
	static let message_and_waveform_fill = UIImage(systemName: "message.and.waveform.fill")

	/// arrow.up.message
	static let arrow_up_message = UIImage(systemName: "arrow.up.message")

	/// arrow.up.message.fill
	static let arrow_up_message_fill = UIImage(systemName: "arrow.up.message.fill")

	/// plus.message
	static let plus_message = UIImage(systemName: "plus.message")

	/// plus.message.fill
	static let plus_message_fill = UIImage(systemName: "plus.message.fill")

	/// bubble.right
	static let bubble_right = UIImage(systemName: "bubble.right")

	/// bubble.right.fill
	static let bubble_right_fill = UIImage(systemName: "bubble.right.fill")

	/// bubble.left
	static let bubble_left = UIImage(systemName: "bubble.left")

	/// bubble.left.fill
	static let bubble_left_fill = UIImage(systemName: "bubble.left.fill")

	/// exclamationmark.bubble
	static let exclamationmark_bubble = UIImage(systemName: "exclamationmark.bubble")

	/// exclamationmark.bubble.fill
	static let exclamationmark_bubble_fill = UIImage(systemName: "exclamationmark.bubble.fill")

	/// quote.bubble
	static let quote_bubble = UIImage(systemName: "quote.bubble")

	/// quote.bubble.fill
	static let quote_bubble_fill = UIImage(systemName: "quote.bubble.fill")

	/// star.bubble
	static let star_bubble = UIImage(systemName: "star.bubble")

	/// star.bubble.fill
	static let star_bubble_fill = UIImage(systemName: "star.bubble.fill")

	/// character.bubble
	static let character_bubble = UIImage(systemName: "character.bubble")

	/// character.bubble.fill
	static let character_bubble_fill = UIImage(systemName: "character.bubble.fill")

	/// text.bubble
	static let text_bubble = UIImage(systemName: "text.bubble")

	/// text.bubble.fill
	static let text_bubble_fill = UIImage(systemName: "text.bubble.fill")

	/// captions.bubble
	static let captions_bubble = UIImage(systemName: "captions.bubble")

	/// captions.bubble.fill
	static let captions_bubble_fill = UIImage(systemName: "captions.bubble.fill")

	/// plus.bubble
	static let plus_bubble = UIImage(systemName: "plus.bubble")

	/// plus.bubble.fill
	static let plus_bubble_fill = UIImage(systemName: "plus.bubble.fill")

	/// checkmark.bubble
	static let checkmark_bubble = UIImage(systemName: "checkmark.bubble")

	/// checkmark.bubble.fill
	static let checkmark_bubble_fill = UIImage(systemName: "checkmark.bubble.fill")

	/// rectangle.3.offgrid.bubble.left
	static let rectangle_3_offgrid_bubble_left = UIImage(systemName: "rectangle.3.offgrid.bubble.left")

	/// rectangle.3.offgrid.bubble.left.fill
	static let rectangle_3_offgrid_bubble_left_fill = UIImage(systemName: "rectangle.3.offgrid.bubble.left.fill")

	/// ellipsis.bubble
	static let ellipsis_bubble = UIImage(systemName: "ellipsis.bubble")

	/// ellipsis.bubble.fill
	static let ellipsis_bubble_fill = UIImage(systemName: "ellipsis.bubble.fill")

	/// ellipsis.vertical.bubble
	static let ellipsis_vertical_bubble = UIImage(systemName: "ellipsis.vertical.bubble")

	/// ellipsis.vertical.bubble.fill
	static let ellipsis_vertical_bubble_fill = UIImage(systemName: "ellipsis.vertical.bubble.fill")

	/// phone.bubble.left
	static let phone_bubble_left = UIImage(systemName: "phone.bubble.left")

	/// phone.bubble.left.fill
	static let phone_bubble_left_fill = UIImage(systemName: "phone.bubble.left.fill")

	/// video.bubble.left
	static let video_bubble_left = UIImage(systemName: "video.bubble.left")

	/// video.bubble.left.fill
	static let video_bubble_left_fill = UIImage(systemName: "video.bubble.left.fill")

	/// bubble.middle.bottom
	static let bubble_middle_bottom = UIImage(systemName: "bubble.middle.bottom")

	/// bubble.middle.bottom.fill
	static let bubble_middle_bottom_fill = UIImage(systemName: "bubble.middle.bottom.fill")

	/// bubble.middle.top
	static let bubble_middle_top = UIImage(systemName: "bubble.middle.top")

	/// bubble.middle.top.fill
	static let bubble_middle_top_fill = UIImage(systemName: "bubble.middle.top.fill")

	/// bubble.left.and.bubble.right
	static let bubble_left_and_bubble_right = UIImage(systemName: "bubble.left.and.bubble.right")

	/// bubble.left.and.bubble.right.fill
	static let bubble_left_and_bubble_right_fill = UIImage(systemName: "bubble.left.and.bubble.right.fill")

	/// bubble.left.and.exclamationmark.bubble.right
	static let bubble_left_and_exclamationmark_bubble_right = UIImage(systemName: "bubble.left.and.exclamationmark.bubble.right")

	/// bubble.left.and.exclamationmark.bubble.right.fill
	static let bubble_left_and_exclamationmark_bubble_right_fill = UIImage(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")

	/// phone
	static let phone = UIImage(systemName: "phone")

	/// phone.fill
	static let phone_fill = UIImage(systemName: "phone.fill")

	/// phone.circle
	static let phone_circle = UIImage(systemName: "phone.circle")

	/// phone.circle.fill
	static let phone_circle_fill = UIImage(systemName: "phone.circle.fill")

	/// phone.badge.plus
	static let phone_badge_plus = UIImage(systemName: "phone.badge.plus")

	/// phone.fill.badge.plus
	static let phone_fill_badge_plus = UIImage(systemName: "phone.fill.badge.plus")

	/// phone.connection
	static let phone_connection = UIImage(systemName: "phone.connection")

	/// phone.fill.connection
	static let phone_fill_connection = UIImage(systemName: "phone.fill.connection")

	/// phone.and.waveform
	static let phone_and_waveform = UIImage(systemName: "phone.and.waveform")

	/// phone.and.waveform.fill
	static let phone_and_waveform_fill = UIImage(systemName: "phone.and.waveform.fill")

	/// phone.arrow.up.right
	static let phone_arrow_up_right = UIImage(systemName: "phone.arrow.up.right")

	/// phone.fill.arrow.up.right
	static let phone_fill_arrow_up_right = UIImage(systemName: "phone.fill.arrow.up.right")

	/// phone.arrow.down.left
	static let phone_arrow_down_left = UIImage(systemName: "phone.arrow.down.left")

	/// phone.fill.arrow.down.left
	static let phone_fill_arrow_down_left = UIImage(systemName: "phone.fill.arrow.down.left")

	/// phone.arrow.right
	static let phone_arrow_right = UIImage(systemName: "phone.arrow.right")

	/// phone.fill.arrow.right
	static let phone_fill_arrow_right = UIImage(systemName: "phone.fill.arrow.right")

	/// phone.down
	static let phone_down = UIImage(systemName: "phone.down")

	/// phone.down.fill
	static let phone_down_fill = UIImage(systemName: "phone.down.fill")

	/// phone.down.circle
	static let phone_down_circle = UIImage(systemName: "phone.down.circle")

	/// phone.down.circle.fill
	static let phone_down_circle_fill = UIImage(systemName: "phone.down.circle.fill")

	/// teletype
	static let teletype = UIImage(systemName: "teletype")

	/// teletype.circle
	static let teletype_circle = UIImage(systemName: "teletype.circle")

	/// teletype.circle.fill
	static let teletype_circle_fill = UIImage(systemName: "teletype.circle.fill")

	/// teletype.answer
	static let teletype_answer = UIImage(systemName: "teletype.answer")

	/// video
	static let video = UIImage(systemName: "video")

	/// video.fill
	static let video_fill = UIImage(systemName: "video.fill")

	/// video.circle
	static let video_circle = UIImage(systemName: "video.circle")

	/// video.circle.fill
	static let video_circle_fill = UIImage(systemName: "video.circle.fill")

	/// video.square
	static let video_square = UIImage(systemName: "video.square")

	/// video.square.fill
	static let video_square_fill = UIImage(systemName: "video.square.fill")

	/// video.slash
	static let video_slash = UIImage(systemName: "video.slash")

	/// video.slash.fill
	static let video_slash_fill = UIImage(systemName: "video.slash.fill")

	/// video.badge.plus
	static let video_badge_plus = UIImage(systemName: "video.badge.plus")

	/// video.fill.badge.plus
	static let video_fill_badge_plus = UIImage(systemName: "video.fill.badge.plus")

	/// video.badge.checkmark
	static let video_badge_checkmark = UIImage(systemName: "video.badge.checkmark")

	/// video.fill.badge.checkmark
	static let video_fill_badge_checkmark = UIImage(systemName: "video.fill.badge.checkmark")

	/// video.badge.ellipsis
	static let video_badge_ellipsis = UIImage(systemName: "video.badge.ellipsis")

	/// video.fill.badge.ellipsis
	static let video_fill_badge_ellipsis = UIImage(systemName: "video.fill.badge.ellipsis")

	/// video.and.waveform
	static let video_and_waveform = UIImage(systemName: "video.and.waveform")

	/// video.and.waveform.fill
	static let video_and_waveform_fill = UIImage(systemName: "video.and.waveform.fill")

	/// arrow.up.right.video
	static let arrow_up_right_video = UIImage(systemName: "arrow.up.right.video")

	/// arrow.up.right.video.fill
	static let arrow_up_right_video_fill = UIImage(systemName: "arrow.up.right.video.fill")

	/// arrow.down.left.video
	static let arrow_down_left_video = UIImage(systemName: "arrow.down.left.video")

	/// arrow.down.left.video.fill
	static let arrow_down_left_video_fill = UIImage(systemName: "arrow.down.left.video.fill")

	/// questionmark.video
	static let questionmark_video = UIImage(systemName: "questionmark.video")

	/// questionmark.video.fill
	static let questionmark_video_fill = UIImage(systemName: "questionmark.video.fill")

	/// envelope
	static let envelope = UIImage(systemName: "envelope")

	/// envelope.fill
	static let envelope_fill = UIImage(systemName: "envelope.fill")

	/// envelope.circle
	static let envelope_circle = UIImage(systemName: "envelope.circle")

	/// envelope.circle.fill
	static let envelope_circle_fill = UIImage(systemName: "envelope.circle.fill")

	/// envelope.arrow.triangle.branch
	static let envelope_arrow_triangle_branch = UIImage(systemName: "envelope.arrow.triangle.branch")

	/// envelope.arrow.triangle.branch.fill
	static let envelope_arrow_triangle_branch_fill = UIImage(systemName: "envelope.arrow.triangle.branch.fill")

	/// envelope.open
	static let envelope_open = UIImage(systemName: "envelope.open")

	/// envelope.open.fill
	static let envelope_open_fill = UIImage(systemName: "envelope.open.fill")

	/// envelope.badge
	static let envelope_badge = UIImage(systemName: "envelope.badge")

	/// envelope.badge.fill
	static let envelope_badge_fill = UIImage(systemName: "envelope.badge.fill")

	/// envelope.badge.shield.half.filled
	static let envelope_badge_shield_half_filled = UIImage(systemName: "envelope.badge.shield.half.filled")

	/// envelope.badge.shield.half.filled.fill
	static let envelope_badge_shield_half_filled_fill = UIImage(systemName: "envelope.badge.shield.half.filled.fill")

	/// mail.stack
	static let mail_stack = UIImage(systemName: "mail.stack")

	/// mail.stack.fill
	static let mail_stack_fill = UIImage(systemName: "mail.stack.fill")

	/// mail
	static let mail = UIImage(systemName: "mail")

	/// mail.fill
	static let mail_fill = UIImage(systemName: "mail.fill")

	/// mail.and.text.magnifyingglass
	static let mail_and_text_magnifyingglass = UIImage(systemName: "mail.and.text.magnifyingglass")

	/// rectangle.and.text.magnifyingglass
	static let rectangle_and_text_magnifyingglass = UIImage(systemName: "rectangle.and.text.magnifyingglass")

	/// arrow.up.right.and.arrow.down.left.rectangle
	static let arrow_up_right_and_arrow_down_left_rectangle = UIImage(systemName: "arrow.up.right.and.arrow.down.left.rectangle")

	/// arrow.up.right.and.arrow.down.left.rectangle.fill
	static let arrow_up_right_and_arrow_down_left_rectangle_fill = UIImage(systemName: "arrow.up.right.and.arrow.down.left.rectangle.fill")

	/// gear
	static let gear = UIImage(systemName: "gear")

	/// gear.circle
	static let gear_circle = UIImage(systemName: "gear.circle")

	/// gear.circle.fill
	static let gear_circle_fill = UIImage(systemName: "gear.circle.fill")

	/// gearshape
	static let gearshape = UIImage(systemName: "gearshape")

	/// gearshape.fill
	static let gearshape_fill = UIImage(systemName: "gearshape.fill")

	/// gearshape.circle
	static let gearshape_circle = UIImage(systemName: "gearshape.circle")

	/// gearshape.circle.fill
	static let gearshape_circle_fill = UIImage(systemName: "gearshape.circle.fill")

	/// gearshape.2
	static let gearshape_2 = UIImage(systemName: "gearshape.2")

	/// gearshape.2.fill
	static let gearshape_2_fill = UIImage(systemName: "gearshape.2.fill")

	/// signature
	static let signature = UIImage(systemName: "signature")

	/// line.3.crossed.swirl.circle
	static let line_3_crossed_swirl_circle = UIImage(systemName: "line.3.crossed.swirl.circle")

	/// line.3.crossed.swirl.circle.fill
	static let line_3_crossed_swirl_circle_fill = UIImage(systemName: "line.3.crossed.swirl.circle.fill")

	/// scissors
	static let scissors = UIImage(systemName: "scissors")

	/// scissors.badge.ellipsis
	static let scissors_badge_ellipsis = UIImage(systemName: "scissors.badge.ellipsis")

	/// ellipsis
	static let ellipsis = UIImage(systemName: "ellipsis")

	/// ellipsis.circle
	static let ellipsis_circle = UIImage(systemName: "ellipsis.circle")

	/// ellipsis.circle.fill
	static let ellipsis_circle_fill = UIImage(systemName: "ellipsis.circle.fill")

	/// ellipsis.rectangle
	static let ellipsis_rectangle = UIImage(systemName: "ellipsis.rectangle")

	/// ellipsis.rectangle.fill
	static let ellipsis_rectangle_fill = UIImage(systemName: "ellipsis.rectangle.fill")

	/// bag
	static let bag = UIImage(systemName: "bag")

	/// bag.fill
	static let bag_fill = UIImage(systemName: "bag.fill")

	/// bag.circle
	static let bag_circle = UIImage(systemName: "bag.circle")

	/// bag.circle.fill
	static let bag_circle_fill = UIImage(systemName: "bag.circle.fill")

	/// bag.badge.plus
	static let bag_badge_plus = UIImage(systemName: "bag.badge.plus")

	/// bag.fill.badge.plus
	static let bag_fill_badge_plus = UIImage(systemName: "bag.fill.badge.plus")

	/// bag.badge.minus
	static let bag_badge_minus = UIImage(systemName: "bag.badge.minus")

	/// bag.fill.badge.minus
	static let bag_fill_badge_minus = UIImage(systemName: "bag.fill.badge.minus")

	/// cart
	static let cart = UIImage(systemName: "cart")

	/// cart.fill
	static let cart_fill = UIImage(systemName: "cart.fill")

	/// cart.circle
	static let cart_circle = UIImage(systemName: "cart.circle")

	/// cart.circle.fill
	static let cart_circle_fill = UIImage(systemName: "cart.circle.fill")

	/// cart.badge.plus
	static let cart_badge_plus = UIImage(systemName: "cart.badge.plus")

	/// cart.fill.badge.plus
	static let cart_fill_badge_plus = UIImage(systemName: "cart.fill.badge.plus")

	/// cart.badge.minus
	static let cart_badge_minus = UIImage(systemName: "cart.badge.minus")

	/// cart.fill.badge.minus
	static let cart_fill_badge_minus = UIImage(systemName: "cart.fill.badge.minus")

	/// creditcard
	static let creditcard = UIImage(systemName: "creditcard")

	/// creditcard.fill
	static let creditcard_fill = UIImage(systemName: "creditcard.fill")

	/// creditcard.circle
	static let creditcard_circle = UIImage(systemName: "creditcard.circle")

	/// creditcard.circle.fill
	static let creditcard_circle_fill = UIImage(systemName: "creditcard.circle.fill")

	/// creditcard.and.123
	static let creditcard_and_123 = UIImage(systemName: "creditcard.and.123")

	/// creditcard.trianglebadge.exclamationmark
	static let creditcard_trianglebadge_exclamationmark = UIImage(systemName: "creditcard.trianglebadge.exclamationmark")

	/// giftcard
	static let giftcard = UIImage(systemName: "giftcard")

	/// giftcard.fill
	static let giftcard_fill = UIImage(systemName: "giftcard.fill")

	/// wallet.pass
	static let wallet_pass = UIImage(systemName: "wallet.pass")

	/// wallet.pass.fill
	static let wallet_pass_fill = UIImage(systemName: "wallet.pass.fill")

	/// wand.and.rays
	static let wand_and_rays = UIImage(systemName: "wand.and.rays")

	/// wand.and.rays.inverse
	static let wand_and_rays_inverse = UIImage(systemName: "wand.and.rays.inverse")

	/// wand.and.stars
	static let wand_and_stars = UIImage(systemName: "wand.and.stars")

	/// wand.and.stars.inverse
	static let wand_and_stars_inverse = UIImage(systemName: "wand.and.stars.inverse")

	/// crop
	static let crop = UIImage(systemName: "crop")

	/// crop.rotate
	static let crop_rotate = UIImage(systemName: "crop.rotate")

	/// dial.min
	static let dial_min = UIImage(systemName: "dial.min")

	/// dial.min.fill
	static let dial_min_fill = UIImage(systemName: "dial.min.fill")

	/// dial.max
	static let dial_max = UIImage(systemName: "dial.max")

	/// dial.max.fill
	static let dial_max_fill = UIImage(systemName: "dial.max.fill")

	/// gyroscope
	static let gyroscope = UIImage(systemName: "gyroscope")

	/// nosign
	static let nosign = UIImage(systemName: "nosign")

	/// gauge
	static let gauge = UIImage(systemName: "gauge")

	/// gauge.badge.plus
	static let gauge_badge_plus = UIImage(systemName: "gauge.badge.plus")

	/// gauge.badge.minus
	static let gauge_badge_minus = UIImage(systemName: "gauge.badge.minus")

	/// speedometer
	static let speedometer = UIImage(systemName: "speedometer")

	/// barometer
	static let barometer = UIImage(systemName: "barometer")

	/// metronome
	static let metronome = UIImage(systemName: "metronome")

	/// metronome.fill
	static let metronome_fill = UIImage(systemName: "metronome.fill")

	/// amplifier
	static let amplifier = UIImage(systemName: "amplifier")

	/// dice
	static let dice = UIImage(systemName: "dice")

	/// dice.fill
	static let dice_fill = UIImage(systemName: "dice.fill")

	/// die.face.1
	static let die_face_1 = UIImage(systemName: "die.face.1")

	/// die.face.1.fill
	static let die_face_1_fill = UIImage(systemName: "die.face.1.fill")

	/// die.face.2
	static let die_face_2 = UIImage(systemName: "die.face.2")

	/// die.face.2.fill
	static let die_face_2_fill = UIImage(systemName: "die.face.2.fill")

	/// die.face.3
	static let die_face_3 = UIImage(systemName: "die.face.3")

	/// die.face.3.fill
	static let die_face_3_fill = UIImage(systemName: "die.face.3.fill")

	/// die.face.4
	static let die_face_4 = UIImage(systemName: "die.face.4")

	/// die.face.4.fill
	static let die_face_4_fill = UIImage(systemName: "die.face.4.fill")

	/// die.face.5
	static let die_face_5 = UIImage(systemName: "die.face.5")

	/// die.face.5.fill
	static let die_face_5_fill = UIImage(systemName: "die.face.5.fill")

	/// die.face.6
	static let die_face_6 = UIImage(systemName: "die.face.6")

	/// die.face.6.fill
	static let die_face_6_fill = UIImage(systemName: "die.face.6.fill")

	/// square.grid.3x3.square
	static let square_grid_3x3_square = UIImage(systemName: "square.grid.3x3.square")

	/// pianokeys
	static let pianokeys = UIImage(systemName: "pianokeys")

	/// pianokeys.inverse
	static let pianokeys_inverse = UIImage(systemName: "pianokeys.inverse")

	/// tuningfork
	static let tuningfork = UIImage(systemName: "tuningfork")

	/// paintbrush
	static let paintbrush = UIImage(systemName: "paintbrush")

	/// paintbrush.fill
	static let paintbrush_fill = UIImage(systemName: "paintbrush.fill")

	/// paintbrush.pointed
	static let paintbrush_pointed = UIImage(systemName: "paintbrush.pointed")

	/// paintbrush.pointed.fill
	static let paintbrush_pointed_fill = UIImage(systemName: "paintbrush.pointed.fill")

	/// bandage
	static let bandage = UIImage(systemName: "bandage")

	/// bandage.fill
	static let bandage_fill = UIImage(systemName: "bandage.fill")

	/// ruler
	static let ruler = UIImage(systemName: "ruler")

	/// ruler.fill
	static let ruler_fill = UIImage(systemName: "ruler.fill")

	/// level
	static let level = UIImage(systemName: "level")

	/// level.fill
	static let level_fill = UIImage(systemName: "level.fill")

	/// lines.measurement.horizontal
	static let lines_measurement_horizontal = UIImage(systemName: "lines.measurement.horizontal")

	/// wrench
	static let wrench = UIImage(systemName: "wrench")

	/// wrench.fill
	static let wrench_fill = UIImage(systemName: "wrench.fill")

	/// hammer
	static let hammer = UIImage(systemName: "hammer")

	/// hammer.fill
	static let hammer_fill = UIImage(systemName: "hammer.fill")

	/// hammer.circle
	static let hammer_circle = UIImage(systemName: "hammer.circle")

	/// hammer.circle.fill
	static let hammer_circle_fill = UIImage(systemName: "hammer.circle.fill")

	/// screwdriver
	static let screwdriver = UIImage(systemName: "screwdriver")

	/// screwdriver.fill
	static let screwdriver_fill = UIImage(systemName: "screwdriver.fill")

	/// eyedropper
	static let eyedropper = UIImage(systemName: "eyedropper")

	/// eyedropper.halffull
	static let eyedropper_halffull = UIImage(systemName: "eyedropper.halffull")

	/// eyedropper.full
	static let eyedropper_full = UIImage(systemName: "eyedropper.full")

	/// wrench.and.screwdriver
	static let wrench_and_screwdriver = UIImage(systemName: "wrench.and.screwdriver")

	/// wrench.and.screwdriver.fill
	static let wrench_and_screwdriver_fill = UIImage(systemName: "wrench.and.screwdriver.fill")

	/// applescript
	static let applescript = UIImage(systemName: "applescript")

	/// applescript.fill
	static let applescript_fill = UIImage(systemName: "applescript.fill")

	/// scroll
	static let scroll = UIImage(systemName: "scroll")

	/// scroll.fill
	static let scroll_fill = UIImage(systemName: "scroll.fill")

	/// stethoscope
	static let stethoscope = UIImage(systemName: "stethoscope")

	/// printer
	static let printer = UIImage(systemName: "printer")

	/// printer.fill
	static let printer_fill = UIImage(systemName: "printer.fill")

	/// printer.filled.and.paper
	static let printer_filled_and_paper = UIImage(systemName: "printer.filled.and.paper")

	/// printer.dotmatrix
	static let printer_dotmatrix = UIImage(systemName: "printer.dotmatrix")

	/// printer.dotmatrix.fill
	static let printer_dotmatrix_fill = UIImage(systemName: "printer.dotmatrix.fill")

	/// printer.dotmatrix.filled.and.paper
	static let printer_dotmatrix_filled_and_paper = UIImage(systemName: "printer.dotmatrix.filled.and.paper")

	/// scanner
	static let scanner = UIImage(systemName: "scanner")

	/// scanner.fill
	static let scanner_fill = UIImage(systemName: "scanner.fill")

	/// faxmachine
	static let faxmachine = UIImage(systemName: "faxmachine")

	/// briefcase
	static let briefcase = UIImage(systemName: "briefcase")

	/// briefcase.fill
	static let briefcase_fill = UIImage(systemName: "briefcase.fill")

	/// briefcase.circle
	static let briefcase_circle = UIImage(systemName: "briefcase.circle")

	/// briefcase.circle.fill
	static let briefcase_circle_fill = UIImage(systemName: "briefcase.circle.fill")

	/// case
	static let case_Image = UIImage(systemName: "case")

	/// case.fill
	static let case_fill = UIImage(systemName: "case.fill")

	/// latch.2.case
	static let latch_2_case = UIImage(systemName: "latch.2.case")

	/// latch.2.case.fill
	static let latch_2_case_fill = UIImage(systemName: "latch.2.case.fill")

	/// cross.case
	static let cross_case = UIImage(systemName: "cross.case")

	/// cross.case.fill
	static let cross_case_fill = UIImage(systemName: "cross.case.fill")

	/// suitcase
	static let suitcase = UIImage(systemName: "suitcase")

	/// suitcase.fill
	static let suitcase_fill = UIImage(systemName: "suitcase.fill")

	/// suitcase.cart
	static let suitcase_cart = UIImage(systemName: "suitcase.cart")

	/// suitcase.cart.fill
	static let suitcase_cart_fill = UIImage(systemName: "suitcase.cart.fill")

	/// theatermasks
	static let theatermasks = UIImage(systemName: "theatermasks")

	/// theatermasks.fill
	static let theatermasks_fill = UIImage(systemName: "theatermasks.fill")

	/// theatermasks.circle
	static let theatermasks_circle = UIImage(systemName: "theatermasks.circle")

	/// theatermasks.circle.fill
	static let theatermasks_circle_fill = UIImage(systemName: "theatermasks.circle.fill")

	/// puzzlepiece.extension
	static let puzzlepiece_extension = UIImage(systemName: "puzzlepiece.extension")

	/// puzzlepiece.extension.fill
	static let puzzlepiece_extension_fill = UIImage(systemName: "puzzlepiece.extension.fill")

	/// puzzlepiece
	static let puzzlepiece = UIImage(systemName: "puzzlepiece")

	/// puzzlepiece.fill
	static let puzzlepiece_fill = UIImage(systemName: "puzzlepiece.fill")

	/// homekit
	static let homekit = UIImage(systemName: "homekit")

	/// house
	static let house = UIImage(systemName: "house")

	/// house.fill
	static let house_fill = UIImage(systemName: "house.fill")

	/// house.circle
	static let house_circle = UIImage(systemName: "house.circle")

	/// house.circle.fill
	static let house_circle_fill = UIImage(systemName: "house.circle.fill")

	/// music.note.house
	static let music_note_house = UIImage(systemName: "music.note.house")

	/// music.note.house.fill
	static let music_note_house_fill = UIImage(systemName: "music.note.house.fill")

	/// building.columns
	static let building_columns = UIImage(systemName: "building.columns")

	/// building.columns.fill
	static let building_columns_fill = UIImage(systemName: "building.columns.fill")

	/// signpost.left
	static let signpost_left = UIImage(systemName: "signpost.left")

	/// signpost.left.fill
	static let signpost_left_fill = UIImage(systemName: "signpost.left.fill")

	/// signpost.right
	static let signpost_right = UIImage(systemName: "signpost.right")

	/// signpost.right.fill
	static let signpost_right_fill = UIImage(systemName: "signpost.right.fill")

	/// square.split.bottomrightquarter
	static let square_split_bottomrightquarter = UIImage(systemName: "square.split.bottomrightquarter")

	/// square.split.bottomrightquarter.fill
	static let square_split_bottomrightquarter_fill = UIImage(systemName: "square.split.bottomrightquarter.fill")

	/// building
	static let building = UIImage(systemName: "building")

	/// building.fill
	static let building_fill = UIImage(systemName: "building.fill")

	/// building.2
	static let building_2 = UIImage(systemName: "building.2")

	/// building.2.fill
	static let building_2_fill = UIImage(systemName: "building.2.fill")

	/// building.2.crop.circle
	static let building_2_crop_circle = UIImage(systemName: "building.2.crop.circle")

	/// building.2.crop.circle.fill
	static let building_2_crop_circle_fill = UIImage(systemName: "building.2.crop.circle.fill")

	/// lock
	static let lock = UIImage(systemName: "lock")

	/// lock.fill
	static let lock_fill = UIImage(systemName: "lock.fill")

	/// lock.circle
	static let lock_circle = UIImage(systemName: "lock.circle")

	/// lock.circle.fill
	static let lock_circle_fill = UIImage(systemName: "lock.circle.fill")

	/// lock.square
	static let lock_square = UIImage(systemName: "lock.square")

	/// lock.square.fill
	static let lock_square_fill = UIImage(systemName: "lock.square.fill")

	/// lock.square.stack
	static let lock_square_stack = UIImage(systemName: "lock.square.stack")

	/// lock.square.stack.fill
	static let lock_square_stack_fill = UIImage(systemName: "lock.square.stack.fill")

	/// lock.rectangle
	static let lock_rectangle = UIImage(systemName: "lock.rectangle")

	/// lock.rectangle.fill
	static let lock_rectangle_fill = UIImage(systemName: "lock.rectangle.fill")

	/// lock.rectangle.stack
	static let lock_rectangle_stack = UIImage(systemName: "lock.rectangle.stack")

	/// lock.rectangle.stack.fill
	static let lock_rectangle_stack_fill = UIImage(systemName: "lock.rectangle.stack.fill")

	/// lock.rectangle.on.rectangle
	static let lock_rectangle_on_rectangle = UIImage(systemName: "lock.rectangle.on.rectangle")

	/// lock.rectangle.on.rectangle.fill
	static let lock_rectangle_on_rectangle_fill = UIImage(systemName: "lock.rectangle.on.rectangle.fill")

	/// lock.shield
	static let lock_shield = UIImage(systemName: "lock.shield")

	/// lock.shield.fill
	static let lock_shield_fill = UIImage(systemName: "lock.shield.fill")

	/// lock.slash
	static let lock_slash = UIImage(systemName: "lock.slash")

	/// lock.slash.fill
	static let lock_slash_fill = UIImage(systemName: "lock.slash.fill")

	/// lock.open
	static let lock_open = UIImage(systemName: "lock.open")

	/// lock.open.fill
	static let lock_open_fill = UIImage(systemName: "lock.open.fill")

	/// lock.rotation
	static let lock_rotation = UIImage(systemName: "lock.rotation")

	/// lock.rotation.open
	static let lock_rotation_open = UIImage(systemName: "lock.rotation.open")

	/// key
	static let key = UIImage(systemName: "key")

	/// key.fill
	static let key_fill = UIImage(systemName: "key.fill")

	/// wifi
	static let wifi = UIImage(systemName: "wifi")

	/// wifi.circle
	static let wifi_circle = UIImage(systemName: "wifi.circle")

	/// wifi.circle.fill
	static let wifi_circle_fill = UIImage(systemName: "wifi.circle.fill")

	/// wifi.square
	static let wifi_square = UIImage(systemName: "wifi.square")

	/// wifi.square.fill
	static let wifi_square_fill = UIImage(systemName: "wifi.square.fill")

	/// wifi.slash
	static let wifi_slash = UIImage(systemName: "wifi.slash")

	/// wifi.exclamationmark
	static let wifi_exclamationmark = UIImage(systemName: "wifi.exclamationmark")

	/// pin
	static let pin = UIImage(systemName: "pin")

	/// pin.fill
	static let pin_fill = UIImage(systemName: "pin.fill")

	/// pin.circle
	static let pin_circle = UIImage(systemName: "pin.circle")

	/// pin.circle.fill
	static let pin_circle_fill = UIImage(systemName: "pin.circle.fill")

	/// pin.square
	static let pin_square = UIImage(systemName: "pin.square")

	/// pin.square.fill
	static let pin_square_fill = UIImage(systemName: "pin.square.fill")

	/// pin.slash
	static let pin_slash = UIImage(systemName: "pin.slash")

	/// pin.slash.fill
	static let pin_slash_fill = UIImage(systemName: "pin.slash.fill")

	/// mappin
	static let mappin = UIImage(systemName: "mappin")

	/// mappin.circle
	static let mappin_circle = UIImage(systemName: "mappin.circle")

	/// mappin.circle.fill
	static let mappin_circle_fill = UIImage(systemName: "mappin.circle.fill")

	/// mappin.square
	static let mappin_square = UIImage(systemName: "mappin.square")

	/// mappin.square.fill
	static let mappin_square_fill = UIImage(systemName: "mappin.square.fill")

	/// mappin.slash
	static let mappin_slash = UIImage(systemName: "mappin.slash")

	/// mappin.and.ellipse
	static let mappin_and_ellipse = UIImage(systemName: "mappin.and.ellipse")

	/// map
	static let map = UIImage(systemName: "map")

	/// map.fill
	static let map_fill = UIImage(systemName: "map.fill")

	/// map.circle
	static let map_circle = UIImage(systemName: "map.circle")

	/// map.circle.fill
	static let map_circle_fill = UIImage(systemName: "map.circle.fill")

	/// safari
	static let safari = UIImage(systemName: "safari")

	/// safari.fill
	static let safari_fill = UIImage(systemName: "safari.fill")

	/// move.3d
	static let move_3d = UIImage(systemName: "move.3d")

	/// scale.3d
	static let scale_3d = UIImage(systemName: "scale.3d")

	/// rotate.3d
	static let rotate_3d = UIImage(systemName: "rotate.3d")

	/// torus
	static let torus = UIImage(systemName: "torus")

	/// rotate.left
	static let rotate_left = UIImage(systemName: "rotate.left")

	/// rotate.left.fill
	static let rotate_left_fill = UIImage(systemName: "rotate.left.fill")

	/// rotate.right
	static let rotate_right = UIImage(systemName: "rotate.right")

	/// rotate.right.fill
	static let rotate_right_fill = UIImage(systemName: "rotate.right.fill")

	/// selection.pin.in.out
	static let selection_pin_in_out = UIImage(systemName: "selection.pin.in.out")

	/// powerplug
	static let powerplug = UIImage(systemName: "powerplug")

	/// powerplug.fill
	static let powerplug_fill = UIImage(systemName: "powerplug.fill")

	/// timeline.selection
	static let timeline_selection = UIImage(systemName: "timeline.selection")

	/// cpu
	static let cpu = UIImage(systemName: "cpu")

	/// cpu.fill
	static let cpu_fill = UIImage(systemName: "cpu.fill")

	/// memorychip
	static let memorychip = UIImage(systemName: "memorychip")

	/// memorychip.fill
	static let memorychip_fill = UIImage(systemName: "memorychip.fill")

	/// opticaldisc
	static let opticaldisc = UIImage(systemName: "opticaldisc")

	/// display
	static let display = UIImage(systemName: "display")

	/// lock.display
	static let lock_display = UIImage(systemName: "lock.display")

	/// lock.open.display
	static let lock_open_display = UIImage(systemName: "lock.open.display")

	/// display.and.arrow.down
	static let display_and_arrow_down = UIImage(systemName: "display.and.arrow.down")

	/// display.trianglebadge.exclamationmark
	static let display_trianglebadge_exclamationmark = UIImage(systemName: "display.trianglebadge.exclamationmark")

	/// display.2
	static let display_2 = UIImage(systemName: "display.2")

	/// desktopcomputer
	static let desktopcomputer = UIImage(systemName: "desktopcomputer")

	/// lock.desktopcomputer
	static let lock_desktopcomputer = UIImage(systemName: "lock.desktopcomputer")

	/// lock.open.desktopcomputer
	static let lock_open_desktopcomputer = UIImage(systemName: "lock.open.desktopcomputer")

	/// desktopcomputer.and.arrow.down
	static let desktopcomputer_and_arrow_down = UIImage(systemName: "desktopcomputer.and.arrow.down")

	/// desktopcomputer.trianglebadge.exclamationmark
	static let desktopcomputer_trianglebadge_exclamationmark = UIImage(systemName: "desktopcomputer.trianglebadge.exclamationmark")

	/// pc
	static let pc = UIImage(systemName: "pc")

	/// macpro.gen1
	static let macpro_gen1 = UIImage(systemName: "macpro.gen1")

	/// macpro.gen1.fill
	static let macpro_gen1_fill = UIImage(systemName: "macpro.gen1.fill")

	/// macpro.gen2
	static let macpro_gen2 = UIImage(systemName: "macpro.gen2")

	/// macpro.gen2.fill
	static let macpro_gen2_fill = UIImage(systemName: "macpro.gen2.fill")

	/// macpro.gen3
	static let macpro_gen3 = UIImage(systemName: "macpro.gen3")

	/// macpro.gen3.fill
	static let macpro_gen3_fill = UIImage(systemName: "macpro.gen3.fill")

	/// macpro.gen3.server
	static let macpro_gen3_server = UIImage(systemName: "macpro.gen3.server")

	/// server.rack
	static let server_rack = UIImage(systemName: "server.rack")

	/// xserve
	static let xserve = UIImage(systemName: "xserve")

	/// laptopcomputer
	static let laptopcomputer = UIImage(systemName: "laptopcomputer")

	/// lock.laptopcomputer
	static let lock_laptopcomputer = UIImage(systemName: "lock.laptopcomputer")

	/// lock.open.laptopcomputer
	static let lock_open_laptopcomputer = UIImage(systemName: "lock.open.laptopcomputer")

	/// laptopcomputer.and.arrow.down
	static let laptopcomputer_and_arrow_down = UIImage(systemName: "laptopcomputer.and.arrow.down")

	/// laptopcomputer.trianglebadge.exclamationmark
	static let laptopcomputer_trianglebadge_exclamationmark = UIImage(systemName: "laptopcomputer.trianglebadge.exclamationmark")

	/// laptopcomputer.and.iphone
	static let laptopcomputer_and_iphone = UIImage(systemName: "laptopcomputer.and.iphone")

	/// ipad.and.iphone
	static let ipad_and_iphone = UIImage(systemName: "ipad.and.iphone")

	/// macmini
	static let macmini = UIImage(systemName: "macmini")

	/// macmini.fill
	static let macmini_fill = UIImage(systemName: "macmini.fill")

	/// airport.express
	static let airport_express = UIImage(systemName: "airport.express")

	/// airport.extreme
	static let airport_extreme = UIImage(systemName: "airport.extreme")

	/// airport.extreme.tower
	static let airport_extreme_tower = UIImage(systemName: "airport.extreme.tower")

	/// ipod
	static let ipod = UIImage(systemName: "ipod")

	/// ipodshuffle.gen1
	static let ipodshuffle_gen1 = UIImage(systemName: "ipodshuffle.gen1")

	/// ipodshuffle.gen2
	static let ipodshuffle_gen2 = UIImage(systemName: "ipodshuffle.gen2")

	/// ipodshuffle.gen3
	static let ipodshuffle_gen3 = UIImage(systemName: "ipodshuffle.gen3")

	/// ipodshuffle.gen4
	static let ipodshuffle_gen4 = UIImage(systemName: "ipodshuffle.gen4")

	/// ipodtouch
	static let ipodtouch = UIImage(systemName: "ipodtouch")

	/// ipodtouch.slash
	static let ipodtouch_slash = UIImage(systemName: "ipodtouch.slash")

	/// ipodtouch.landscape
	static let ipodtouch_landscape = UIImage(systemName: "ipodtouch.landscape")

	/// flipphone
	static let flipphone = UIImage(systemName: "flipphone")

	/// candybarphone
	static let candybarphone = UIImage(systemName: "candybarphone")

	/// iphone.homebutton
	static let iphone_homebutton = UIImage(systemName: "iphone.homebutton")

	/// iphone.homebutton.circle
	static let iphone_homebutton_circle = UIImage(systemName: "iphone.homebutton.circle")

	/// iphone.homebutton.circle.fill
	static let iphone_homebutton_circle_fill = UIImage(systemName: "iphone.homebutton.circle.fill")

	/// iphone.homebutton.landscape
	static let iphone_homebutton_landscape = UIImage(systemName: "iphone.homebutton.landscape")

	/// iphone.homebutton.radiowaves.left.and.right
	static let iphone_homebutton_radiowaves_left_and_right = UIImage(systemName: "iphone.homebutton.radiowaves.left.and.right")

	/// iphone.homebutton.slash
	static let iphone_homebutton_slash = UIImage(systemName: "iphone.homebutton.slash")

	/// iphone.homebutton.slash.circle
	static let iphone_homebutton_slash_circle = UIImage(systemName: "iphone.homebutton.slash.circle")

	/// iphone.homebutton.slash.circle.fill
	static let iphone_homebutton_slash_circle_fill = UIImage(systemName: "iphone.homebutton.slash.circle.fill")

	/// iphone.homebutton.badge.play
	static let iphone_homebutton_badge_play = UIImage(systemName: "iphone.homebutton.badge.play")

	/// iphone
	static let iphone = UIImage(systemName: "iphone")

	/// iphone.circle
	static let iphone_circle = UIImage(systemName: "iphone.circle")

	/// iphone.circle.fill
	static let iphone_circle_fill = UIImage(systemName: "iphone.circle.fill")

	/// iphone.landscape
	static let iphone_landscape = UIImage(systemName: "iphone.landscape")

	/// iphone.radiowaves.left.and.right
	static let iphone_radiowaves_left_and_right = UIImage(systemName: "iphone.radiowaves.left.and.right")

	/// iphone.slash
	static let iphone_slash = UIImage(systemName: "iphone.slash")

	/// iphone.slash.circle
	static let iphone_slash_circle = UIImage(systemName: "iphone.slash.circle")

	/// iphone.slash.circle.fill
	static let iphone_slash_circle_fill = UIImage(systemName: "iphone.slash.circle.fill")

	/// iphone.badge.play
	static let iphone_badge_play = UIImage(systemName: "iphone.badge.play")

	/// lock.iphone
	static let lock_iphone = UIImage(systemName: "lock.iphone")

	/// lock.open.iphone
	static let lock_open_iphone = UIImage(systemName: "lock.open.iphone")

	/// iphone.and.arrow.forward
	static let iphone_and_arrow_forward = UIImage(systemName: "iphone.and.arrow.forward")

	/// arrow.turn.up.forward.iphone
	static let arrow_turn_up_forward_iphone = UIImage(systemName: "arrow.turn.up.forward.iphone")

	/// arrow.turn.up.forward.iphone.fill
	static let arrow_turn_up_forward_iphone_fill = UIImage(systemName: "arrow.turn.up.forward.iphone.fill")

	/// iphone.rear.camera
	static let iphone_rear_camera = UIImage(systemName: "iphone.rear.camera")

	/// apps.iphone
	static let apps_iphone = UIImage(systemName: "apps.iphone")

	/// apps.iphone.badge.plus
	static let apps_iphone_badge_plus = UIImage(systemName: "apps.iphone.badge.plus")

	/// apps.iphone.landscape
	static let apps_iphone_landscape = UIImage(systemName: "apps.iphone.landscape")

	/// platter.2.filled.iphone
	static let platter_2_filled_iphone = UIImage(systemName: "platter.2.filled.iphone")

	/// platter.2.filled.iphone.landscape
	static let platter_2_filled_iphone_landscape = UIImage(systemName: "platter.2.filled.iphone.landscape")

	/// iphone.smartbatterycase.gen2
	static let iphone_smartbatterycase_gen2 = UIImage(systemName: "iphone.smartbatterycase.gen2")

	/// iphone.smartbatterycase.gen1
	static let iphone_smartbatterycase_gen1 = UIImage(systemName: "iphone.smartbatterycase.gen1")

	/// ipad.homebutton
	static let ipad_homebutton = UIImage(systemName: "ipad.homebutton")

	/// ipad.homebutton.badge.play
	static let ipad_homebutton_badge_play = UIImage(systemName: "ipad.homebutton.badge.play")

	/// ipad.homebutton.landscape
	static let ipad_homebutton_landscape = UIImage(systemName: "ipad.homebutton.landscape")

	/// ipad.homebutton.landscape.badge.play
	static let ipad_homebutton_landscape_badge_play = UIImage(systemName: "ipad.homebutton.landscape.badge.play")

	/// ipad
	static let ipad = UIImage(systemName: "ipad")

	/// ipad.badge.play
	static let ipad_badge_play = UIImage(systemName: "ipad.badge.play")

	/// lock.ipad
	static let lock_ipad = UIImage(systemName: "lock.ipad")

	/// lock.open.ipad
	static let lock_open_ipad = UIImage(systemName: "lock.open.ipad")

	/// ipad.and.arrow.forward
	static let ipad_and_arrow_forward = UIImage(systemName: "ipad.and.arrow.forward")

	/// ipad.landscape
	static let ipad_landscape = UIImage(systemName: "ipad.landscape")

	/// ipad.landscape.badge.play
	static let ipad_landscape_badge_play = UIImage(systemName: "ipad.landscape.badge.play")

	/// ipad.rear.camera
	static let ipad_rear_camera = UIImage(systemName: "ipad.rear.camera")

	/// apps.ipad
	static let apps_ipad = UIImage(systemName: "apps.ipad")

	/// apps.ipad.landscape
	static let apps_ipad_landscape = UIImage(systemName: "apps.ipad.landscape")

	/// platter.2.filled.ipad
	static let platter_2_filled_ipad = UIImage(systemName: "platter.2.filled.ipad")

	/// platter.2.filled.ipad.landscape
	static let platter_2_filled_ipad_landscape = UIImage(systemName: "platter.2.filled.ipad.landscape")

	/// applepencil
	static let applepencil = UIImage(systemName: "applepencil")

	/// magicmouse
	static let magicmouse = UIImage(systemName: "magicmouse")

	/// magicmouse.fill
	static let magicmouse_fill = UIImage(systemName: "magicmouse.fill")

	/// computermouse
	static let computermouse = UIImage(systemName: "computermouse")

	/// computermouse.fill
	static let computermouse_fill = UIImage(systemName: "computermouse.fill")

	/// applewatch
	static let applewatch = UIImage(systemName: "applewatch")

	/// applewatch.watchface
	static let applewatch_watchface = UIImage(systemName: "applewatch.watchface")

	/// exclamationmark.applewatch
	static let exclamationmark_applewatch = UIImage(systemName: "exclamationmark.applewatch")

	/// lock.applewatch
	static let lock_applewatch = UIImage(systemName: "lock.applewatch")

	/// lock.open.applewatch
	static let lock_open_applewatch = UIImage(systemName: "lock.open.applewatch")

	/// applewatch.radiowaves.left.and.right
	static let applewatch_radiowaves_left_and_right = UIImage(systemName: "applewatch.radiowaves.left.and.right")

	/// applewatch.slash
	static let applewatch_slash = UIImage(systemName: "applewatch.slash")

	/// applewatch.side.right
	static let applewatch_side_right = UIImage(systemName: "applewatch.side.right")

	/// watchface.applewatch.case
	static let watchface_applewatch_case = UIImage(systemName: "watchface.applewatch.case")

	/// platter.filled.top.applewatch.case
	static let platter_filled_top_applewatch_case = UIImage(systemName: "platter.filled.top.applewatch.case")

	/// platter.filled.bottom.applewatch.case
	static let platter_filled_bottom_applewatch_case = UIImage(systemName: "platter.filled.bottom.applewatch.case")

	/// platter.top.applewatch.case
	static let platter_top_applewatch_case = UIImage(systemName: "platter.top.applewatch.case")

	/// platter.bottom.applewatch.case
	static let platter_bottom_applewatch_case = UIImage(systemName: "platter.bottom.applewatch.case")

	/// digitalcrown.arrow.clockwise
	static let digitalcrown_arrow_clockwise = UIImage(systemName: "digitalcrown.arrow.clockwise")

	/// digitalcrown.fill.arrow.clockwise
	static let digitalcrown_fill_arrow_clockwise = UIImage(systemName: "digitalcrown.fill.arrow.clockwise")

	/// digitalcrown.arrow.counterclockwise
	static let digitalcrown_arrow_counterclockwise = UIImage(systemName: "digitalcrown.arrow.counterclockwise")

	/// digitalcrown.fill.arrow.counterclockwise
	static let digitalcrown_fill_arrow_counterclockwise = UIImage(systemName: "digitalcrown.fill.arrow.counterclockwise")

	/// digitalcrown.horizontal.arrow.clockwise
	static let digitalcrown_horizontal_arrow_clockwise = UIImage(systemName: "digitalcrown.horizontal.arrow.clockwise")

	/// digitalcrown.horizontal.fill.arrow.clockwise
	static let digitalcrown_horizontal_fill_arrow_clockwise = UIImage(systemName: "digitalcrown.horizontal.fill.arrow.clockwise")

	/// digitalcrown.horizontal.arrow.counterclockwise
	static let digitalcrown_horizontal_arrow_counterclockwise = UIImage(systemName: "digitalcrown.horizontal.arrow.counterclockwise")

	/// digitalcrown.horizontal.fill.arrow.counterclockwise
	static let digitalcrown_horizontal_fill_arrow_counterclockwise = UIImage(systemName: "digitalcrown.horizontal.fill.arrow.counterclockwise")

	/// airpodsmax
	static let airpodsmax = UIImage(systemName: "airpodsmax")

	/// beats.headphones
	static let beats_headphones = UIImage(systemName: "beats.headphones")

	/// headphones
	static let headphones = UIImage(systemName: "headphones")

	/// headphones.circle
	static let headphones_circle = UIImage(systemName: "headphones.circle")

	/// headphones.circle.fill
	static let headphones_circle_fill = UIImage(systemName: "headphones.circle.fill")

	/// earbuds
	static let earbuds = UIImage(systemName: "earbuds")

	/// earbuds.case
	static let earbuds_case = UIImage(systemName: "earbuds.case")

	/// earbuds.case.fill
	static let earbuds_case_fill = UIImage(systemName: "earbuds.case.fill")

	/// earpods
	static let earpods = UIImage(systemName: "earpods")

	/// airpods
	static let airpods = UIImage(systemName: "airpods")

	/// airpod.right
	static let airpod_right = UIImage(systemName: "airpod.right")

	/// airpod.left
	static let airpod_left = UIImage(systemName: "airpod.left")

	/// airpods.chargingcase
	static let airpods_chargingcase = UIImage(systemName: "airpods.chargingcase")

	/// airpods.chargingcase.fill
	static let airpods_chargingcase_fill = UIImage(systemName: "airpods.chargingcase.fill")

	/// airpods.chargingcase.wireless
	static let airpods_chargingcase_wireless = UIImage(systemName: "airpods.chargingcase.wireless")

	/// airpods.chargingcase.wireless.fill
	static let airpods_chargingcase_wireless_fill = UIImage(systemName: "airpods.chargingcase.wireless.fill")

	/// airpodspro
	static let airpodspro = UIImage(systemName: "airpodspro")

	/// airpodpro.right
	static let airpodpro_right = UIImage(systemName: "airpodpro.right")

	/// airpodpro.left
	static let airpodpro_left = UIImage(systemName: "airpodpro.left")

	/// airpodspro.chargingcase.wireless
	static let airpodspro_chargingcase_wireless = UIImage(systemName: "airpodspro.chargingcase.wireless")

	/// airpodspro.chargingcase.wireless.fill
	static let airpodspro_chargingcase_wireless_fill = UIImage(systemName: "airpodspro.chargingcase.wireless.fill")

	/// beats.earphones
	static let beats_earphones = UIImage(systemName: "beats.earphones")

	/// beats.powerbeatspro
	static let beats_powerbeatspro = UIImage(systemName: "beats.powerbeatspro")

	/// beats.powerbeatspro.right
	static let beats_powerbeatspro_right = UIImage(systemName: "beats.powerbeatspro.right")

	/// beats.powerbeatspro.left
	static let beats_powerbeatspro_left = UIImage(systemName: "beats.powerbeatspro.left")

	/// beats.powerbeats
	static let beats_powerbeats = UIImage(systemName: "beats.powerbeats")

	/// beats.powerbeats3
	static let beats_powerbeats3 = UIImage(systemName: "beats.powerbeats3")

	/// beats.powerbeatspro.chargingcase
	static let beats_powerbeatspro_chargingcase = UIImage(systemName: "beats.powerbeatspro.chargingcase")

	/// beats.powerbeatspro.chargingcase.fill
	static let beats_powerbeatspro_chargingcase_fill = UIImage(systemName: "beats.powerbeatspro.chargingcase.fill")

	/// homepodmini
	static let homepodmini = UIImage(systemName: "homepodmini")

	/// homepodmini.fill
	static let homepodmini_fill = UIImage(systemName: "homepodmini.fill")

	/// homepodmini.2
	static let homepodmini_2 = UIImage(systemName: "homepodmini.2")

	/// homepodmini.2.fill
	static let homepodmini_2_fill = UIImage(systemName: "homepodmini.2.fill")

	/// homepod.and.homepodmini
	static let homepod_and_homepodmini = UIImage(systemName: "homepod.and.homepodmini")

	/// homepod.and.homepodmini.fill
	static let homepod_and_homepodmini_fill = UIImage(systemName: "homepod.and.homepodmini.fill")

	/// hifispeaker.and.homepodmini
	static let hifispeaker_and_homepodmini = UIImage(systemName: "hifispeaker.and.homepodmini")

	/// hifispeaker.and.homepodmini.fill
	static let hifispeaker_and_homepodmini_fill = UIImage(systemName: "hifispeaker.and.homepodmini.fill")

	/// homepod
	static let homepod = UIImage(systemName: "homepod")

	/// homepod.fill
	static let homepod_fill = UIImage(systemName: "homepod.fill")

	/// homepod.2
	static let homepod_2 = UIImage(systemName: "homepod.2")

	/// homepod.2.fill
	static let homepod_2_fill = UIImage(systemName: "homepod.2.fill")

	/// hifispeaker.and.homepod
	static let hifispeaker_and_homepod = UIImage(systemName: "hifispeaker.and.homepod")

	/// hifispeaker.and.homepod.fill
	static let hifispeaker_and_homepod_fill = UIImage(systemName: "hifispeaker.and.homepod.fill")

	/// hifispeaker
	static let hifispeaker = UIImage(systemName: "hifispeaker")

	/// hifispeaker.fill
	static let hifispeaker_fill = UIImage(systemName: "hifispeaker.fill")

	/// hifispeaker.2
	static let hifispeaker_2 = UIImage(systemName: "hifispeaker.2")

	/// hifispeaker.2.fill
	static let hifispeaker_2_fill = UIImage(systemName: "hifispeaker.2.fill")

	/// appletv
	static let appletv = UIImage(systemName: "appletv")

	/// appletv.fill
	static let appletv_fill = UIImage(systemName: "appletv.fill")

	/// homepod.and.appletv
	static let homepod_and_appletv = UIImage(systemName: "homepod.and.appletv")

	/// homepod.and.appletv.fill
	static let homepod_and_appletv_fill = UIImage(systemName: "homepod.and.appletv.fill")

	/// homepodmini.and.appletv
	static let homepodmini_and_appletv = UIImage(systemName: "homepodmini.and.appletv")

	/// homepodmini.and.appletv.fill
	static let homepodmini_and_appletv_fill = UIImage(systemName: "homepodmini.and.appletv.fill")

	/// hifispeaker.and.appletv
	static let hifispeaker_and_appletv = UIImage(systemName: "hifispeaker.and.appletv")

	/// hifispeaker.and.appletv.fill
	static let hifispeaker_and_appletv_fill = UIImage(systemName: "hifispeaker.and.appletv.fill")

	/// appletvremote.gen1
	static let appletvremote_gen1 = UIImage(systemName: "appletvremote.gen1")

	/// appletvremote.gen1.fill
	static let appletvremote_gen1_fill = UIImage(systemName: "appletvremote.gen1.fill")

	/// appletvremote.gen2
	static let appletvremote_gen2 = UIImage(systemName: "appletvremote.gen2")

	/// appletvremote.gen2.fill
	static let appletvremote_gen2_fill = UIImage(systemName: "appletvremote.gen2.fill")

	/// appletvremote.gen3
	static let appletvremote_gen3 = UIImage(systemName: "appletvremote.gen3")

	/// appletvremote.gen3.fill
	static let appletvremote_gen3_fill = UIImage(systemName: "appletvremote.gen3.fill")

	/// appletvremote.gen4
	static let appletvremote_gen4 = UIImage(systemName: "appletvremote.gen4")

	/// appletvremote.gen4.fill
	static let appletvremote_gen4_fill = UIImage(systemName: "appletvremote.gen4.fill")

	/// mediastick
	static let mediastick = UIImage(systemName: "mediastick")

	/// cable.connector
	static let cable_connector = UIImage(systemName: "cable.connector")

	/// radio
	static let radio = UIImage(systemName: "radio")

	/// radio.fill
	static let radio_fill = UIImage(systemName: "radio.fill")

	/// tv
	static let tv = UIImage(systemName: "tv")

	/// tv.fill
	static let tv_fill = UIImage(systemName: "tv.fill")

	/// tv.inset.filled
	static let tv_inset_filled = UIImage(systemName: "tv.inset.filled")

	/// tv.circle
	static let tv_circle = UIImage(systemName: "tv.circle")

	/// tv.circle.fill
	static let tv_circle_fill = UIImage(systemName: "tv.circle.fill")

	/// 4k.tv
	static let tv_4k = UIImage(systemName: "4k.tv")

	/// 4k.tv.fill
	static let tv_fill_4k = UIImage(systemName: "4k.tv.fill")

	/// music.note.tv
	static let music_note_tv = UIImage(systemName: "music.note.tv")

	/// music.note.tv.fill
	static let music_note_tv_fill = UIImage(systemName: "music.note.tv.fill")

	/// play.tv
	static let play_tv = UIImage(systemName: "play.tv")

	/// play.tv.fill
	static let play_tv_fill = UIImage(systemName: "play.tv.fill")

	/// photo.tv
	static let photo_tv = UIImage(systemName: "photo.tv")

	/// tv.and.hifispeaker.fill
	static let tv_and_hifispeaker_fill = UIImage(systemName: "tv.and.hifispeaker.fill")

	/// tv.and.mediabox
	static let tv_and_mediabox = UIImage(systemName: "tv.and.mediabox")

	/// airplayvideo
	static let airplayvideo = UIImage(systemName: "airplayvideo")

	/// airplayvideo.circle
	static let airplayvideo_circle = UIImage(systemName: "airplayvideo.circle")

	/// airplayvideo.circle.fill
	static let airplayvideo_circle_fill = UIImage(systemName: "airplayvideo.circle.fill")

	/// airplayvideo.badge.exclamationmark
	static let airplayvideo_badge_exclamationmark = UIImage(systemName: "airplayvideo.badge.exclamationmark")

	/// airplayaudio
	static let airplayaudio = UIImage(systemName: "airplayaudio")

	/// airplayaudio.circle
	static let airplayaudio_circle = UIImage(systemName: "airplayaudio.circle")

	/// airplayaudio.circle.fill
	static let airplayaudio_circle_fill = UIImage(systemName: "airplayaudio.circle.fill")

	/// airplayaudio.badge.exclamationmark
	static let airplayaudio_badge_exclamationmark = UIImage(systemName: "airplayaudio.badge.exclamationmark")

	/// dot.radiowaves.left.and.right
	static let dot_radiowaves_left_and_right = UIImage(systemName: "dot.radiowaves.left.and.right")

	/// dot.radiowaves.right
	static let dot_radiowaves_right = UIImage(systemName: "dot.radiowaves.right")

	/// dot.radiowaves.forward
	static let dot_radiowaves_forward = UIImage(systemName: "dot.radiowaves.forward")

	/// wave.3.left
	static let wave_3_left = UIImage(systemName: "wave.3.left")

	/// wave.3.left.circle
	static let wave_3_left_circle = UIImage(systemName: "wave.3.left.circle")

	/// wave.3.left.circle.fill
	static let wave_3_left_circle_fill = UIImage(systemName: "wave.3.left.circle.fill")

	/// wave.3.backward
	static let wave_3_backward = UIImage(systemName: "wave.3.backward")

	/// wave.3.backward.circle
	static let wave_3_backward_circle = UIImage(systemName: "wave.3.backward.circle")

	/// wave.3.backward.circle.fill
	static let wave_3_backward_circle_fill = UIImage(systemName: "wave.3.backward.circle.fill")

	/// wave.3.right
	static let wave_3_right = UIImage(systemName: "wave.3.right")

	/// wave.3.right.circle
	static let wave_3_right_circle = UIImage(systemName: "wave.3.right.circle")

	/// wave.3.right.circle.fill
	static let wave_3_right_circle_fill = UIImage(systemName: "wave.3.right.circle.fill")

	/// wave.3.forward
	static let wave_3_forward = UIImage(systemName: "wave.3.forward")

	/// wave.3.forward.circle
	static let wave_3_forward_circle = UIImage(systemName: "wave.3.forward.circle")

	/// wave.3.forward.circle.fill
	static let wave_3_forward_circle_fill = UIImage(systemName: "wave.3.forward.circle.fill")

	/// dot.radiowaves.up.forward
	static let dot_radiowaves_up_forward = UIImage(systemName: "dot.radiowaves.up.forward")

	/// antenna.radiowaves.left.and.right
	static let antenna_radiowaves_left_and_right = UIImage(systemName: "antenna.radiowaves.left.and.right")

	/// antenna.radiowaves.left.and.right.circle
	static let antenna_radiowaves_left_and_right_circle = UIImage(systemName: "antenna.radiowaves.left.and.right.circle")

	/// antenna.radiowaves.left.and.right.circle.fill
	static let antenna_radiowaves_left_and_right_circle_fill = UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill")

	/// pip
	static let pip = UIImage(systemName: "pip")

	/// pip.fill
	static let pip_fill = UIImage(systemName: "pip.fill")

	/// pip.exit
	static let pip_exit = UIImage(systemName: "pip.exit")

	/// pip.enter
	static let pip_enter = UIImage(systemName: "pip.enter")

	/// pip.swap
	static let pip_swap = UIImage(systemName: "pip.swap")

	/// pip.remove
	static let pip_remove = UIImage(systemName: "pip.remove")

	/// rectangle.arrowtriangle.2.outward
	static let rectangle_arrowtriangle_2_outward = UIImage(systemName: "rectangle.arrowtriangle.2.outward")

	/// rectangle.arrowtriangle.2.inward
	static let rectangle_arrowtriangle_2_inward = UIImage(systemName: "rectangle.arrowtriangle.2.inward")

	/// rectangle.portrait.arrowtriangle.2.outward
	static let rectangle_portrait_arrowtriangle_2_outward = UIImage(systemName: "rectangle.portrait.arrowtriangle.2.outward")

	/// rectangle.portrait.arrowtriangle.2.inward
	static let rectangle_portrait_arrowtriangle_2_inward = UIImage(systemName: "rectangle.portrait.arrowtriangle.2.inward")

	/// rectangle.2.swap
	static let rectangle_2_swap = UIImage(systemName: "rectangle.2.swap")

	/// guitars
	static let guitars = UIImage(systemName: "guitars")

	/// guitars.fill
	static let guitars_fill = UIImage(systemName: "guitars.fill")

	/// airplane
	static let airplane = UIImage(systemName: "airplane")

	/// airplane.circle
	static let airplane_circle = UIImage(systemName: "airplane.circle")

	/// airplane.circle.fill
	static let airplane_circle_fill = UIImage(systemName: "airplane.circle.fill")

	/// airplane.arrival
	static let airplane_arrival = UIImage(systemName: "airplane.arrival")

	/// airplane.departure
	static let airplane_departure = UIImage(systemName: "airplane.departure")

	/// car
	static let car = UIImage(systemName: "car")

	/// car.fill
	static let car_fill = UIImage(systemName: "car.fill")

	/// car.circle
	static let car_circle = UIImage(systemName: "car.circle")

	/// car.circle.fill
	static let car_circle_fill = UIImage(systemName: "car.circle.fill")

	/// bolt.car
	static let bolt_car = UIImage(systemName: "bolt.car")

	/// bolt.car.fill
	static let bolt_car_fill = UIImage(systemName: "bolt.car.fill")

	/// bolt.car.circle
	static let bolt_car_circle = UIImage(systemName: "bolt.car.circle")

	/// bolt.car.circle.fill
	static let bolt_car_circle_fill = UIImage(systemName: "bolt.car.circle.fill")

	/// car.2
	static let car_2 = UIImage(systemName: "car.2")

	/// car.2.fill
	static let car_2_fill = UIImage(systemName: "car.2.fill")

	/// bus
	static let bus = UIImage(systemName: "bus")

	/// bus.fill
	static let bus_fill = UIImage(systemName: "bus.fill")

	/// bus.doubledecker
	static let bus_doubledecker = UIImage(systemName: "bus.doubledecker")

	/// bus.doubledecker.fill
	static let bus_doubledecker_fill = UIImage(systemName: "bus.doubledecker.fill")

	/// tram
	static let tram = UIImage(systemName: "tram")

	/// tram.fill
	static let tram_fill = UIImage(systemName: "tram.fill")

	/// tram.circle
	static let tram_circle = UIImage(systemName: "tram.circle")

	/// tram.circle.fill
	static let tram_circle_fill = UIImage(systemName: "tram.circle.fill")

	/// tram.fill.tunnel
	static let tram_fill_tunnel = UIImage(systemName: "tram.fill.tunnel")

	/// cablecar
	static let cablecar = UIImage(systemName: "cablecar")

	/// cablecar.fill
	static let cablecar_fill = UIImage(systemName: "cablecar.fill")

	/// ferry
	static let ferry = UIImage(systemName: "ferry")

	/// ferry.fill
	static let ferry_fill = UIImage(systemName: "ferry.fill")

	/// car.ferry
	static let car_ferry = UIImage(systemName: "car.ferry")

	/// car.ferry.fill
	static let car_ferry_fill = UIImage(systemName: "car.ferry.fill")

	/// train.side.front.car
	static let train_side_front_car = UIImage(systemName: "train.side.front.car")

	/// train.side.middle.car
	static let train_side_middle_car = UIImage(systemName: "train.side.middle.car")

	/// train.side.rear.car
	static let train_side_rear_car = UIImage(systemName: "train.side.rear.car")

	/// bicycle
	static let bicycle = UIImage(systemName: "bicycle")

	/// bicycle.circle
	static let bicycle_circle = UIImage(systemName: "bicycle.circle")

	/// bicycle.circle.fill
	static let bicycle_circle_fill = UIImage(systemName: "bicycle.circle.fill")

	/// parkingsign
	static let parkingsign = UIImage(systemName: "parkingsign")

	/// parkingsign.circle
	static let parkingsign_circle = UIImage(systemName: "parkingsign.circle")

	/// parkingsign.circle.fill
	static let parkingsign_circle_fill = UIImage(systemName: "parkingsign.circle.fill")

	/// fuelpump
	static let fuelpump = UIImage(systemName: "fuelpump")

	/// fuelpump.fill
	static let fuelpump_fill = UIImage(systemName: "fuelpump.fill")

	/// fuelpump.circle
	static let fuelpump_circle = UIImage(systemName: "fuelpump.circle")

	/// fuelpump.circle.fill
	static let fuelpump_circle_fill = UIImage(systemName: "fuelpump.circle.fill")

	/// fanblades
	static let fanblades = UIImage(systemName: "fanblades")

	/// fanblades.fill
	static let fanblades_fill = UIImage(systemName: "fanblades.fill")

	/// bed.double
	static let bed_double = UIImage(systemName: "bed.double")

	/// bed.double.fill
	static let bed_double_fill = UIImage(systemName: "bed.double.fill")

	/// bed.double.circle
	static let bed_double_circle = UIImage(systemName: "bed.double.circle")

	/// bed.double.circle.fill
	static let bed_double_circle_fill = UIImage(systemName: "bed.double.circle.fill")

	/// lungs
	static let lungs = UIImage(systemName: "lungs")

	/// lungs.fill
	static let lungs_fill = UIImage(systemName: "lungs.fill")

	/// allergens
	static let allergens = UIImage(systemName: "allergens")

	/// pills
	static let pills = UIImage(systemName: "pills")

	/// pills.fill
	static let pills_fill = UIImage(systemName: "pills.fill")

	/// testtube.2
	static let testtube_2 = UIImage(systemName: "testtube.2")

	/// ivfluid.bag
	static let ivfluid_bag = UIImage(systemName: "ivfluid.bag")

	/// ivfluid.bag.fill
	static let ivfluid_bag_fill = UIImage(systemName: "ivfluid.bag.fill")

	/// cross.vial
	static let cross_vial = UIImage(systemName: "cross.vial")

	/// cross.vial.fill
	static let cross_vial_fill = UIImage(systemName: "cross.vial.fill")

	/// cross
	static let cross = UIImage(systemName: "cross")

	/// cross.fill
	static let cross_fill = UIImage(systemName: "cross.fill")

	/// cross.circle
	static let cross_circle = UIImage(systemName: "cross.circle")

	/// cross.circle.fill
	static let cross_circle_fill = UIImage(systemName: "cross.circle.fill")

	/// hare
	static let hare = UIImage(systemName: "hare")

	/// hare.fill
	static let hare_fill = UIImage(systemName: "hare.fill")

	/// tortoise
	static let tortoise = UIImage(systemName: "tortoise")

	/// tortoise.fill
	static let tortoise_fill = UIImage(systemName: "tortoise.fill")

	/// pawprint
	static let pawprint = UIImage(systemName: "pawprint")

	/// pawprint.fill
	static let pawprint_fill = UIImage(systemName: "pawprint.fill")

	/// pawprint.circle
	static let pawprint_circle = UIImage(systemName: "pawprint.circle")

	/// pawprint.circle.fill
	static let pawprint_circle_fill = UIImage(systemName: "pawprint.circle.fill")

	/// ant
	static let ant = UIImage(systemName: "ant")

	/// ant.fill
	static let ant_fill = UIImage(systemName: "ant.fill")

	/// ant.circle
	static let ant_circle = UIImage(systemName: "ant.circle")

	/// ant.circle.fill
	static let ant_circle_fill = UIImage(systemName: "ant.circle.fill")

	/// ladybug
	static let ladybug = UIImage(systemName: "ladybug")

	/// ladybug.fill
	static let ladybug_fill = UIImage(systemName: "ladybug.fill")

	/// leaf
	static let leaf = UIImage(systemName: "leaf")

	/// leaf.fill
	static let leaf_fill = UIImage(systemName: "leaf.fill")

	/// leaf.circle
	static let leaf_circle = UIImage(systemName: "leaf.circle")

	/// leaf.circle.fill
	static let leaf_circle_fill = UIImage(systemName: "leaf.circle.fill")

	/// leaf.arrow.triangle.circlepath
	static let leaf_arrow_triangle_circlepath = UIImage(systemName: "leaf.arrow.triangle.circlepath")

	/// film
	static let film = UIImage(systemName: "film")

	/// film.fill
	static let film_fill = UIImage(systemName: "film.fill")

	/// film.circle
	static let film_circle = UIImage(systemName: "film.circle")

	/// film.circle.fill
	static let film_circle_fill = UIImage(systemName: "film.circle.fill")

	/// sportscourt
	static let sportscourt = UIImage(systemName: "sportscourt")

	/// sportscourt.fill
	static let sportscourt_fill = UIImage(systemName: "sportscourt.fill")

	/// face.smiling
	static let face_smiling = UIImage(systemName: "face.smiling")

	/// face.smiling.fill
	static let face_smiling_fill = UIImage(systemName: "face.smiling.fill")

	/// face.dashed
	static let face_dashed = UIImage(systemName: "face.dashed")

	/// face.dashed.fill
	static let face_dashed_fill = UIImage(systemName: "face.dashed.fill")

	/// crown
	static let crown = UIImage(systemName: "crown")

	/// crown.fill
	static let crown_fill = UIImage(systemName: "crown.fill")

	/// comb
	static let comb = UIImage(systemName: "comb")

	/// comb.fill
	static let comb_fill = UIImage(systemName: "comb.fill")

	/// qrcode
	static let qrcode = UIImage(systemName: "qrcode")

	/// barcode
	static let barcode = UIImage(systemName: "barcode")

	/// viewfinder
	static let viewfinder = UIImage(systemName: "viewfinder")

	/// viewfinder.circle
	static let viewfinder_circle = UIImage(systemName: "viewfinder.circle")

	/// viewfinder.circle.fill
	static let viewfinder_circle_fill = UIImage(systemName: "viewfinder.circle.fill")

	/// barcode.viewfinder
	static let barcode_viewfinder = UIImage(systemName: "barcode.viewfinder")

	/// qrcode.viewfinder
	static let qrcode_viewfinder = UIImage(systemName: "qrcode.viewfinder")

	/// plus.viewfinder
	static let plus_viewfinder = UIImage(systemName: "plus.viewfinder")

	/// camera.viewfinder
	static let camera_viewfinder = UIImage(systemName: "camera.viewfinder")

	/// faceid
	static let faceid = UIImage(systemName: "faceid")

	/// doc.text.viewfinder
	static let doc_text_viewfinder = UIImage(systemName: "doc.text.viewfinder")

	/// doc.text.fill.viewfinder
	static let doc_text_fill_viewfinder = UIImage(systemName: "doc.text.fill.viewfinder")

	/// location.viewfinder
	static let location_viewfinder = UIImage(systemName: "location.viewfinder")

	/// location.fill.viewfinder
	static let location_fill_viewfinder = UIImage(systemName: "location.fill.viewfinder")

	/// person.fill.viewfinder
	static let person_fill_viewfinder = UIImage(systemName: "person.fill.viewfinder")

	/// text.viewfinder
	static let text_viewfinder = UIImage(systemName: "text.viewfinder")

	/// photo
	static let photo = UIImage(systemName: "photo")

	/// photo.fill
	static let photo_fill = UIImage(systemName: "photo.fill")

	/// photo.circle
	static let photo_circle = UIImage(systemName: "photo.circle")

	/// photo.circle.fill
	static let photo_circle_fill = UIImage(systemName: "photo.circle.fill")

	/// text.below.photo
	static let text_below_photo = UIImage(systemName: "text.below.photo")

	/// text.below.photo.fill
	static let text_below_photo_fill = UIImage(systemName: "text.below.photo.fill")

	/// checkerboard.rectangle
	static let checkerboard_rectangle = UIImage(systemName: "checkerboard.rectangle")

	/// camera.metering.center.weighted.average
	static let camera_metering_center_weighted_average = UIImage(systemName: "camera.metering.center.weighted.average")

	/// camera.metering.center.weighted
	static let camera_metering_center_weighted = UIImage(systemName: "camera.metering.center.weighted")

	/// camera.metering.matrix
	static let camera_metering_matrix = UIImage(systemName: "camera.metering.matrix")

	/// camera.metering.multispot
	static let camera_metering_multispot = UIImage(systemName: "camera.metering.multispot")

	/// camera.metering.none
	static let camera_metering_none = UIImage(systemName: "camera.metering.none")

	/// camera.metering.partial
	static let camera_metering_partial = UIImage(systemName: "camera.metering.partial")

	/// camera.metering.spot
	static let camera_metering_spot = UIImage(systemName: "camera.metering.spot")

	/// camera.metering.unknown
	static let camera_metering_unknown = UIImage(systemName: "camera.metering.unknown")

	/// camera.aperture
	static let camera_aperture = UIImage(systemName: "camera.aperture")

	/// rectangle.dashed
	static let rectangle_dashed = UIImage(systemName: "rectangle.dashed")

	/// rectangle.dashed.badge.record
	static let rectangle_dashed_badge_record = UIImage(systemName: "rectangle.dashed.badge.record")

	/// rectangle.badge.plus
	static let rectangle_badge_plus = UIImage(systemName: "rectangle.badge.plus")

	/// rectangle.fill.badge.plus
	static let rectangle_fill_badge_plus = UIImage(systemName: "rectangle.fill.badge.plus")

	/// rectangle.badge.minus
	static let rectangle_badge_minus = UIImage(systemName: "rectangle.badge.minus")

	/// rectangle.fill.badge.minus
	static let rectangle_fill_badge_minus = UIImage(systemName: "rectangle.fill.badge.minus")

	/// rectangle.badge.checkmark
	static let rectangle_badge_checkmark = UIImage(systemName: "rectangle.badge.checkmark")

	/// rectangle.fill.badge.checkmark
	static let rectangle_fill_badge_checkmark = UIImage(systemName: "rectangle.fill.badge.checkmark")

	/// rectangle.badge.xmark
	static let rectangle_badge_xmark = UIImage(systemName: "rectangle.badge.xmark")

	/// rectangle.fill.badge.xmark
	static let rectangle_fill_badge_xmark = UIImage(systemName: "rectangle.fill.badge.xmark")

	/// rectangle.badge.person.crop
	static let rectangle_badge_person_crop = UIImage(systemName: "rectangle.badge.person.crop")

	/// rectangle.fill.badge.person.crop
	static let rectangle_fill_badge_person_crop = UIImage(systemName: "rectangle.fill.badge.person.crop")

	/// photo.on.rectangle
	static let photo_on_rectangle = UIImage(systemName: "photo.on.rectangle")

	/// photo.fill.on.rectangle.fill
	static let photo_fill_on_rectangle_fill = UIImage(systemName: "photo.fill.on.rectangle.fill")

	/// rectangle.on.rectangle.angled
	static let rectangle_on_rectangle_angled = UIImage(systemName: "rectangle.on.rectangle.angled")

	/// rectangle.fill.on.rectangle.angled.fill
	static let rectangle_fill_on_rectangle_angled_fill = UIImage(systemName: "rectangle.fill.on.rectangle.angled.fill")

	/// photo.on.rectangle.angled
	static let photo_on_rectangle_angled = UIImage(systemName: "photo.on.rectangle.angled")

	/// rectangle.stack
	static let rectangle_stack = UIImage(systemName: "rectangle.stack")

	/// rectangle.stack.fill
	static let rectangle_stack_fill = UIImage(systemName: "rectangle.stack.fill")

	/// rectangle.stack.badge.plus
	static let rectangle_stack_badge_plus = UIImage(systemName: "rectangle.stack.badge.plus")

	/// rectangle.stack.fill.badge.plus
	static let rectangle_stack_fill_badge_plus = UIImage(systemName: "rectangle.stack.fill.badge.plus")

	/// rectangle.stack.badge.minus
	static let rectangle_stack_badge_minus = UIImage(systemName: "rectangle.stack.badge.minus")

	/// rectangle.stack.fill.badge.minus
	static let rectangle_stack_fill_badge_minus = UIImage(systemName: "rectangle.stack.fill.badge.minus")

	/// rectangle.stack.badge.person.crop
	static let rectangle_stack_badge_person_crop = UIImage(systemName: "rectangle.stack.badge.person.crop")

	/// rectangle.stack.fill.badge.person.crop
	static let rectangle_stack_fill_badge_person_crop = UIImage(systemName: "rectangle.stack.fill.badge.person.crop")

	/// rectangle.stack.badge.play.crop
	static let rectangle_stack_badge_play_crop = UIImage(systemName: "rectangle.stack.badge.play.crop")

	/// rectangle.stack.fill.badge.play.crop.fill
	static let rectangle_stack_fill_badge_play_crop_fill = UIImage(systemName: "rectangle.stack.fill.badge.play.crop.fill")

	/// sparkles.rectangle.stack
	static let sparkles_rectangle_stack = UIImage(systemName: "sparkles.rectangle.stack")

	/// sparkles.rectangle.stack.fill
	static let sparkles_rectangle_stack_fill = UIImage(systemName: "sparkles.rectangle.stack.fill")

	/// sidebar.left
	static let sidebar_left = UIImage(systemName: "sidebar.left")

	/// sidebar.right
	static let sidebar_right = UIImage(systemName: "sidebar.right")

	/// sidebar.leading
	static let sidebar_leading = UIImage(systemName: "sidebar.leading")

	/// sidebar.trailing
	static let sidebar_trailing = UIImage(systemName: "sidebar.trailing")

	/// sidebar.squares.left
	static let sidebar_squares_left = UIImage(systemName: "sidebar.squares.left")

	/// sidebar.squares.right
	static let sidebar_squares_right = UIImage(systemName: "sidebar.squares.right")

	/// sidebar.squares.leading
	static let sidebar_squares_leading = UIImage(systemName: "sidebar.squares.leading")

	/// sidebar.squares.trailing
	static let sidebar_squares_trailing = UIImage(systemName: "sidebar.squares.trailing")

	/// macwindow
	static let macwindow = UIImage(systemName: "macwindow")

	/// macwindow.badge.plus
	static let macwindow_badge_plus = UIImage(systemName: "macwindow.badge.plus")

	/// dock.rectangle
	static let dock_rectangle = UIImage(systemName: "dock.rectangle")

	/// dock.arrow.up.rectangle
	static let dock_arrow_up_rectangle = UIImage(systemName: "dock.arrow.up.rectangle")

	/// dock.arrow.down.rectangle
	static let dock_arrow_down_rectangle = UIImage(systemName: "dock.arrow.down.rectangle")

	/// menubar.rectangle
	static let menubar_rectangle = UIImage(systemName: "menubar.rectangle")

	/// menubar.dock.rectangle
	static let menubar_dock_rectangle = UIImage(systemName: "menubar.dock.rectangle")

	/// menubar.dock.rectangle.badge.record
	static let menubar_dock_rectangle_badge_record = UIImage(systemName: "menubar.dock.rectangle.badge.record")

	/// menubar.arrow.up.rectangle
	static let menubar_arrow_up_rectangle = UIImage(systemName: "menubar.arrow.up.rectangle")

	/// menubar.arrow.down.rectangle
	static let menubar_arrow_down_rectangle = UIImage(systemName: "menubar.arrow.down.rectangle")

	/// macwindow.on.rectangle
	static let macwindow_on_rectangle = UIImage(systemName: "macwindow.on.rectangle")

	/// text.and.command.macwindow
	static let text_and_command_macwindow = UIImage(systemName: "text.and.command.macwindow")

	/// keyboard.macwindow
	static let keyboard_macwindow = UIImage(systemName: "keyboard.macwindow")

	/// uiwindow.split.2x1
	static let uiwindow_split_2x1 = UIImage(systemName: "uiwindow.split.2x1")

	/// mosaic
	static let mosaic = UIImage(systemName: "mosaic")

	/// mosaic.fill
	static let mosaic_fill = UIImage(systemName: "mosaic.fill")

	/// squares.below.rectangle
	static let squares_below_rectangle = UIImage(systemName: "squares.below.rectangle")

	/// rectangle.split.3x3.fill
	static let rectangle_split_3x3_fill = UIImage(systemName: "rectangle.split.3x3.fill")

	/// square.on.square.squareshape.controlhandles
	static let square_on_square_squareshape_controlhandles = UIImage(systemName: "square.on.square.squareshape.controlhandles")

	/// squareshape.controlhandles.on.squareshape.controlhandles
	static let squareshape_controlhandles_on_squareshape_controlhandles = UIImage(systemName: "squareshape.controlhandles.on.squareshape.controlhandles")

	/// pano
	static let pano = UIImage(systemName: "pano")

	/// pano.fill
	static let pano_fill = UIImage(systemName: "pano.fill")

	/// circle.grid.2x1
	static let circle_grid_2x1 = UIImage(systemName: "circle.grid.2x1")

	/// circle.grid.2x1.fill
	static let circle_grid_2x1_fill = UIImage(systemName: "circle.grid.2x1.fill")

	/// circle.grid.2x1.left.filled
	static let circle_grid_2x1_left_filled = UIImage(systemName: "circle.grid.2x1.left.filled")

	/// circle.grid.2x1.right.filled
	static let circle_grid_2x1_right_filled = UIImage(systemName: "circle.grid.2x1.right.filled")

	/// square.and.line.vertical.and.square
	static let square_and_line_vertical_and_square = UIImage(systemName: "square.and.line.vertical.and.square")

	/// square.fill.and.line.vertical.and.square.fill
	static let square_fill_and_line_vertical_and_square_fill = UIImage(systemName: "square.fill.and.line.vertical.and.square.fill")

	/// square.fill.and.line.vertical.and.square
	static let square_fill_and_line_vertical_and_square = UIImage(systemName: "square.fill.and.line.vertical.and.square")

	/// square.and.line.vertical.and.square.fill
	static let square_and_line_vertical_and_square_fill = UIImage(systemName: "square.and.line.vertical.and.square.fill")

	/// flowchart
	static let flowchart = UIImage(systemName: "flowchart")

	/// flowchart.fill
	static let flowchart_fill = UIImage(systemName: "flowchart.fill")

	/// rectangle.connected.to.line.below
	static let rectangle_connected_to_line_below = UIImage(systemName: "rectangle.connected.to.line.below")

	/// shield
	static let shield = UIImage(systemName: "shield")

	/// shield.fill
	static let shield_fill = UIImage(systemName: "shield.fill")

	/// shield.lefthalf.filled
	static let shield_lefthalf_filled = UIImage(systemName: "shield.lefthalf.filled")

	/// shield.righthalf.filled
	static let shield_righthalf_filled = UIImage(systemName: "shield.righthalf.filled")

	/// shield.slash
	static let shield_slash = UIImage(systemName: "shield.slash")

	/// shield.slash.fill
	static let shield_slash_fill = UIImage(systemName: "shield.slash.fill")

	/// shield.lefthalf.filled.slash
	static let shield_lefthalf_filled_slash = UIImage(systemName: "shield.lefthalf.filled.slash")

	/// checkerboard.shield
	static let checkerboard_shield = UIImage(systemName: "checkerboard.shield")

	/// switch.2
	static let switch_2 = UIImage(systemName: "switch.2")

	/// point.topleft.down.curvedto.point.bottomright.up
	static let point_topleft_down_curvedto_point_bottomright_up = UIImage(systemName: "point.topleft.down.curvedto.point.bottomright.up")

	/// point.topleft.down.curvedto.point.bottomright.up.fill
	static let point_topleft_down_curvedto_point_bottomright_up_fill = UIImage(systemName: "point.topleft.down.curvedto.point.bottomright.up.fill")

	/// point.topleft.down.curvedto.point.filled.bottomright.up
	static let point_topleft_down_curvedto_point_filled_bottomright_up = UIImage(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")

	/// point.filled.topleft.down.curvedto.point.bottomright.up
	static let point_filled_topleft_down_curvedto_point_bottomright_up = UIImage(systemName: "point.filled.topleft.down.curvedto.point.bottomright.up")

	/// app.connected.to.app.below.fill
	static let app_connected_to_app_below_fill = UIImage(systemName: "app.connected.to.app.below.fill")

	/// slider.horizontal.3
	static let slider_horizontal_3 = UIImage(systemName: "slider.horizontal.3")

	/// slider.horizontal.below.rectangle
	static let slider_horizontal_below_rectangle = UIImage(systemName: "slider.horizontal.below.rectangle")

	/// slider.horizontal.below.square.fill.and.square
	static let slider_horizontal_below_square_fill_and_square = UIImage(systemName: "slider.horizontal.below.square.fill.and.square")

	/// slider.vertical.3
	static let slider_vertical_3 = UIImage(systemName: "slider.vertical.3")

	/// cube
	static let cube = UIImage(systemName: "cube")

	/// cube.fill
	static let cube_fill = UIImage(systemName: "cube.fill")

	/// cube.transparent
	static let cube_transparent = UIImage(systemName: "cube.transparent")

	/// cube.transparent.fill
	static let cube_transparent_fill = UIImage(systemName: "cube.transparent.fill")

	/// shippingbox
	static let shippingbox = UIImage(systemName: "shippingbox")

	/// shippingbox.fill
	static let shippingbox_fill = UIImage(systemName: "shippingbox.fill")

	/// arkit
	static let arkit = UIImage(systemName: "arkit")

	/// arkit.badge.xmark
	static let arkit_badge_xmark = UIImage(systemName: "arkit.badge.xmark")

	/// cone
	static let cone = UIImage(systemName: "cone")

	/// cone.fill
	static let cone_fill = UIImage(systemName: "cone.fill")

	/// pyramid
	static let pyramid = UIImage(systemName: "pyramid")

	/// pyramid.fill
	static let pyramid_fill = UIImage(systemName: "pyramid.fill")

	/// square.stack.3d.down.right
	static let square_stack_3d_down_right = UIImage(systemName: "square.stack.3d.down.right")

	/// square.stack.3d.down.right.fill
	static let square_stack_3d_down_right_fill = UIImage(systemName: "square.stack.3d.down.right.fill")

	/// square.stack.3d.down.forward
	static let square_stack_3d_down_forward = UIImage(systemName: "square.stack.3d.down.forward")

	/// square.stack.3d.down.forward.fill
	static let square_stack_3d_down_forward_fill = UIImage(systemName: "square.stack.3d.down.forward.fill")

	/// square.stack.3d.up
	static let square_stack_3d_up = UIImage(systemName: "square.stack.3d.up")

	/// square.stack.3d.up.fill
	static let square_stack_3d_up_fill = UIImage(systemName: "square.stack.3d.up.fill")

	/// square.stack.3d.up.slash
	static let square_stack_3d_up_slash = UIImage(systemName: "square.stack.3d.up.slash")

	/// square.stack.3d.up.slash.fill
	static let square_stack_3d_up_slash_fill = UIImage(systemName: "square.stack.3d.up.slash.fill")

	/// square.stack.3d.up.badge.a
	static let square_stack_3d_up_badge_a = UIImage(systemName: "square.stack.3d.up.badge.a")

	/// square.stack.3d.up.badge.a.fill
	static let square_stack_3d_up_badge_a_fill = UIImage(systemName: "square.stack.3d.up.badge.a.fill")

	/// square.stack.3d.forward.dottedline
	static let square_stack_3d_forward_dottedline = UIImage(systemName: "square.stack.3d.forward.dottedline")

	/// square.stack.3d.forward.dottedline.fill
	static let square_stack_3d_forward_dottedline_fill = UIImage(systemName: "square.stack.3d.forward.dottedline.fill")

	/// livephoto
	static let livephoto = UIImage(systemName: "livephoto")

	/// livephoto.slash
	static let livephoto_slash = UIImage(systemName: "livephoto.slash")

	/// livephoto.badge.a
	static let livephoto_badge_a = UIImage(systemName: "livephoto.badge.a")

	/// livephoto.play
	static let livephoto_play = UIImage(systemName: "livephoto.play")

	/// scope
	static let scope = UIImage(systemName: "scope")

	/// helm
	static let helm = UIImage(systemName: "helm")

	/// clock
	static let clock = UIImage(systemName: "clock")

	/// clock.fill
	static let clock_fill = UIImage(systemName: "clock.fill")

	/// clock.badge.checkmark
	static let clock_badge_checkmark = UIImage(systemName: "clock.badge.checkmark")

	/// clock.badge.checkmark.fill
	static let clock_badge_checkmark_fill = UIImage(systemName: "clock.badge.checkmark.fill")

	/// clock.badge.exclamationmark
	static let clock_badge_exclamationmark = UIImage(systemName: "clock.badge.exclamationmark")

	/// clock.badge.exclamationmark.fill
	static let clock_badge_exclamationmark_fill = UIImage(systemName: "clock.badge.exclamationmark.fill")

	/// deskclock
	static let deskclock = UIImage(systemName: "deskclock")

	/// deskclock.fill
	static let deskclock_fill = UIImage(systemName: "deskclock.fill")

	/// alarm
	static let alarm = UIImage(systemName: "alarm")

	/// alarm.fill
	static let alarm_fill = UIImage(systemName: "alarm.fill")

	/// stopwatch
	static let stopwatch = UIImage(systemName: "stopwatch")

	/// stopwatch.fill
	static let stopwatch_fill = UIImage(systemName: "stopwatch.fill")

	/// chart.xyaxis.line
	static let chart_xyaxis_line = UIImage(systemName: "chart.xyaxis.line")

	/// timer
	static let timer = UIImage(systemName: "timer")

	/// timer.square
	static let timer_square = UIImage(systemName: "timer.square")

	/// clock.arrow.circlepath
	static let clock_arrow_circlepath = UIImage(systemName: "clock.arrow.circlepath")

	/// exclamationmark.arrow.circlepath
	static let exclamationmark_arrow_circlepath = UIImage(systemName: "exclamationmark.arrow.circlepath")

	/// clock.arrow.2.circlepath
	static let clock_arrow_2_circlepath = UIImage(systemName: "clock.arrow.2.circlepath")

	/// gamecontroller
	static let gamecontroller = UIImage(systemName: "gamecontroller")

	/// gamecontroller.fill
	static let gamecontroller_fill = UIImage(systemName: "gamecontroller.fill")

	/// l.joystick
	static let l_joystick = UIImage(systemName: "l.joystick")

	/// l.joystick.fill
	static let l_joystick_fill = UIImage(systemName: "l.joystick.fill")

	/// r.joystick
	static let r_joystick = UIImage(systemName: "r.joystick")

	/// r.joystick.fill
	static let r_joystick_fill = UIImage(systemName: "r.joystick.fill")

	/// l.joystick.press.down
	static let l_joystick_press_down = UIImage(systemName: "l.joystick.press.down")

	/// l.joystick.press.down.fill
	static let l_joystick_press_down_fill = UIImage(systemName: "l.joystick.press.down.fill")

	/// r.joystick.press.down
	static let r_joystick_press_down = UIImage(systemName: "r.joystick.press.down")

	/// r.joystick.press.down.fill
	static let r_joystick_press_down_fill = UIImage(systemName: "r.joystick.press.down.fill")

	/// l.joystick.tilt.left
	static let l_joystick_tilt_left = UIImage(systemName: "l.joystick.tilt.left")

	/// l.joystick.tilt.left.fill
	static let l_joystick_tilt_left_fill = UIImage(systemName: "l.joystick.tilt.left.fill")

	/// l.joystick.tilt.right
	static let l_joystick_tilt_right = UIImage(systemName: "l.joystick.tilt.right")

	/// l.joystick.tilt.right.fill
	static let l_joystick_tilt_right_fill = UIImage(systemName: "l.joystick.tilt.right.fill")

	/// l.joystick.tilt.up
	static let l_joystick_tilt_up = UIImage(systemName: "l.joystick.tilt.up")

	/// l.joystick.tilt.up.fill
	static let l_joystick_tilt_up_fill = UIImage(systemName: "l.joystick.tilt.up.fill")

	/// l.joystick.tilt.down
	static let l_joystick_tilt_down = UIImage(systemName: "l.joystick.tilt.down")

	/// l.joystick.tilt.down.fill
	static let l_joystick_tilt_down_fill = UIImage(systemName: "l.joystick.tilt.down.fill")

	/// r.joystick.tilt.left
	static let r_joystick_tilt_left = UIImage(systemName: "r.joystick.tilt.left")

	/// r.joystick.tilt.left.fill
	static let r_joystick_tilt_left_fill = UIImage(systemName: "r.joystick.tilt.left.fill")

	/// r.joystick.tilt.right
	static let r_joystick_tilt_right = UIImage(systemName: "r.joystick.tilt.right")

	/// r.joystick.tilt.right.fill
	static let r_joystick_tilt_right_fill = UIImage(systemName: "r.joystick.tilt.right.fill")

	/// r.joystick.tilt.up
	static let r_joystick_tilt_up = UIImage(systemName: "r.joystick.tilt.up")

	/// r.joystick.tilt.up.fill
	static let r_joystick_tilt_up_fill = UIImage(systemName: "r.joystick.tilt.up.fill")

	/// r.joystick.tilt.down
	static let r_joystick_tilt_down = UIImage(systemName: "r.joystick.tilt.down")

	/// r.joystick.tilt.down.fill
	static let r_joystick_tilt_down_fill = UIImage(systemName: "r.joystick.tilt.down.fill")

	/// dpad
	static let dpad = UIImage(systemName: "dpad")

	/// dpad.fill
	static let dpad_fill = UIImage(systemName: "dpad.fill")

	/// dpad.left.fill
	static let dpad_left_fill = UIImage(systemName: "dpad.left.fill")

	/// dpad.up.fill
	static let dpad_up_fill = UIImage(systemName: "dpad.up.fill")

	/// dpad.right.fill
	static let dpad_right_fill = UIImage(systemName: "dpad.right.fill")

	/// dpad.down.fill
	static let dpad_down_fill = UIImage(systemName: "dpad.down.fill")

	/// circle.circle
	static let circle_circle = UIImage(systemName: "circle.circle")

	/// circle.circle.fill
	static let circle_circle_fill = UIImage(systemName: "circle.circle.fill")

	/// square.circle
	static let square_circle = UIImage(systemName: "square.circle")

	/// square.circle.fill
	static let square_circle_fill = UIImage(systemName: "square.circle.fill")

	/// triangle.circle
	static let triangle_circle = UIImage(systemName: "triangle.circle")

	/// triangle.circle.fill
	static let triangle_circle_fill = UIImage(systemName: "triangle.circle.fill")

	/// rectangle.roundedtop
	static let rectangle_roundedtop = UIImage(systemName: "rectangle.roundedtop")

	/// rectangle.roundedtop.fill
	static let rectangle_roundedtop_fill = UIImage(systemName: "rectangle.roundedtop.fill")

	/// rectangle.roundedbottom
	static let rectangle_roundedbottom = UIImage(systemName: "rectangle.roundedbottom")

	/// rectangle.roundedbottom.fill
	static let rectangle_roundedbottom_fill = UIImage(systemName: "rectangle.roundedbottom.fill")

	/// l.rectangle.roundedbottom
	static let l_rectangle_roundedbottom = UIImage(systemName: "l.rectangle.roundedbottom")

	/// l.rectangle.roundedbottom.fill
	static let l_rectangle_roundedbottom_fill = UIImage(systemName: "l.rectangle.roundedbottom.fill")

	/// l1.rectangle.roundedbottom
	static let l1_rectangle_roundedbottom = UIImage(systemName: "l1.rectangle.roundedbottom")

	/// l1.rectangle.roundedbottom.fill
	static let l1_rectangle_roundedbottom_fill = UIImage(systemName: "l1.rectangle.roundedbottom.fill")

	/// l2.rectangle.roundedtop
	static let l2_rectangle_roundedtop = UIImage(systemName: "l2.rectangle.roundedtop")

	/// l2.rectangle.roundedtop.fill
	static let l2_rectangle_roundedtop_fill = UIImage(systemName: "l2.rectangle.roundedtop.fill")

	/// r.rectangle.roundedbottom
	static let r_rectangle_roundedbottom = UIImage(systemName: "r.rectangle.roundedbottom")

	/// r.rectangle.roundedbottom.fill
	static let r_rectangle_roundedbottom_fill = UIImage(systemName: "r.rectangle.roundedbottom.fill")

	/// r1.rectangle.roundedbottom
	static let r1_rectangle_roundedbottom = UIImage(systemName: "r1.rectangle.roundedbottom")

	/// r1.rectangle.roundedbottom.fill
	static let r1_rectangle_roundedbottom_fill = UIImage(systemName: "r1.rectangle.roundedbottom.fill")

	/// r2.rectangle.roundedtop
	static let r2_rectangle_roundedtop = UIImage(systemName: "r2.rectangle.roundedtop")

	/// r2.rectangle.roundedtop.fill
	static let r2_rectangle_roundedtop_fill = UIImage(systemName: "r2.rectangle.roundedtop.fill")

	/// lb.rectangle.roundedbottom
	static let lb_rectangle_roundedbottom = UIImage(systemName: "lb.rectangle.roundedbottom")

	/// lb.rectangle.roundedbottom.fill
	static let lb_rectangle_roundedbottom_fill = UIImage(systemName: "lb.rectangle.roundedbottom.fill")

	/// rb.rectangle.roundedbottom
	static let rb_rectangle_roundedbottom = UIImage(systemName: "rb.rectangle.roundedbottom")

	/// rb.rectangle.roundedbottom.fill
	static let rb_rectangle_roundedbottom_fill = UIImage(systemName: "rb.rectangle.roundedbottom.fill")

	/// lt.rectangle.roundedtop
	static let lt_rectangle_roundedtop = UIImage(systemName: "lt.rectangle.roundedtop")

	/// lt.rectangle.roundedtop.fill
	static let lt_rectangle_roundedtop_fill = UIImage(systemName: "lt.rectangle.roundedtop.fill")

	/// rt.rectangle.roundedtop
	static let rt_rectangle_roundedtop = UIImage(systemName: "rt.rectangle.roundedtop")

	/// rt.rectangle.roundedtop.fill
	static let rt_rectangle_roundedtop_fill = UIImage(systemName: "rt.rectangle.roundedtop.fill")

	/// zl.rectangle.roundedtop
	static let zl_rectangle_roundedtop = UIImage(systemName: "zl.rectangle.roundedtop")

	/// zl.rectangle.roundedtop.fill
	static let zl_rectangle_roundedtop_fill = UIImage(systemName: "zl.rectangle.roundedtop.fill")

	/// zr.rectangle.roundedtop
	static let zr_rectangle_roundedtop = UIImage(systemName: "zr.rectangle.roundedtop")

	/// zr.rectangle.roundedtop.fill
	static let zr_rectangle_roundedtop_fill = UIImage(systemName: "zr.rectangle.roundedtop.fill")

	/// logo.playstation
	static let logo_playstation = UIImage(systemName: "logo.playstation")

	/// logo.xbox
	static let logo_xbox = UIImage(systemName: "logo.xbox")

	/// paintpalette
	static let paintpalette = UIImage(systemName: "paintpalette")

	/// paintpalette.fill
	static let paintpalette_fill = UIImage(systemName: "paintpalette.fill")

	/// takeoutbag.and.cup.and.straw
	static let takeoutbag_and_cup_and_straw = UIImage(systemName: "takeoutbag.and.cup.and.straw")

	/// takeoutbag.and.cup.and.straw.fill
	static let takeoutbag_and_cup_and_straw_fill = UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")

	/// fork.knife
	static let fork_knife = UIImage(systemName: "fork.knife")

	/// fork.knife.circle
	static let fork_knife_circle = UIImage(systemName: "fork.knife.circle")

	/// fork.knife.circle.fill
	static let fork_knife_circle_fill = UIImage(systemName: "fork.knife.circle.fill")

	/// figure.walk
	static let figure_walk = UIImage(systemName: "figure.walk")

	/// figure.walk.circle
	static let figure_walk_circle = UIImage(systemName: "figure.walk.circle")

	/// figure.walk.circle.fill
	static let figure_walk_circle_fill = UIImage(systemName: "figure.walk.circle.fill")

	/// figure.walk.diamond
	static let figure_walk_diamond = UIImage(systemName: "figure.walk.diamond")

	/// figure.walk.diamond.fill
	static let figure_walk_diamond_fill = UIImage(systemName: "figure.walk.diamond.fill")

	/// figure.stand
	static let figure_stand = UIImage(systemName: "figure.stand")

	/// figure.stand.line.dotted.figure.stand
	static let figure_stand_line_dotted_figure_stand = UIImage(systemName: "figure.stand.line.dotted.figure.stand")

	/// figure.wave
	static let figure_wave = UIImage(systemName: "figure.wave")

	/// figure.wave.circle
	static let figure_wave_circle = UIImage(systemName: "figure.wave.circle")

	/// figure.wave.circle.fill
	static let figure_wave_circle_fill = UIImage(systemName: "figure.wave.circle.fill")

	/// ear
	static let ear = UIImage(systemName: "ear")

	/// ear.badge.checkmark
	static let ear_badge_checkmark = UIImage(systemName: "ear.badge.checkmark")

	/// ear.trianglebadge.exclamationmark
	static let ear_trianglebadge_exclamationmark = UIImage(systemName: "ear.trianglebadge.exclamationmark")

	/// ear.fill
	static let ear_fill = UIImage(systemName: "ear.fill")

	/// hearingdevice.ear
	static let hearingdevice_ear = UIImage(systemName: "hearingdevice.ear")

	/// hand.raised
	static let hand_raised = UIImage(systemName: "hand.raised")

	/// hand.raised.fill
	static let hand_raised_fill = UIImage(systemName: "hand.raised.fill")

	/// hand.raised.circle
	static let hand_raised_circle = UIImage(systemName: "hand.raised.circle")

	/// hand.raised.circle.fill
	static let hand_raised_circle_fill = UIImage(systemName: "hand.raised.circle.fill")

	/// hand.raised.square
	static let hand_raised_square = UIImage(systemName: "hand.raised.square")

	/// hand.raised.square.fill
	static let hand_raised_square_fill = UIImage(systemName: "hand.raised.square.fill")

	/// hand.raised.slash
	static let hand_raised_slash = UIImage(systemName: "hand.raised.slash")

	/// hand.raised.slash.fill
	static let hand_raised_slash_fill = UIImage(systemName: "hand.raised.slash.fill")

	/// hand.thumbsup
	static let hand_thumbsup = UIImage(systemName: "hand.thumbsup")

	/// hand.thumbsup.fill
	static let hand_thumbsup_fill = UIImage(systemName: "hand.thumbsup.fill")

	/// hand.thumbsup.circle
	static let hand_thumbsup_circle = UIImage(systemName: "hand.thumbsup.circle")

	/// hand.thumbsup.circle.fill
	static let hand_thumbsup_circle_fill = UIImage(systemName: "hand.thumbsup.circle.fill")

	/// hand.thumbsdown
	static let hand_thumbsdown = UIImage(systemName: "hand.thumbsdown")

	/// hand.thumbsdown.fill
	static let hand_thumbsdown_fill = UIImage(systemName: "hand.thumbsdown.fill")

	/// hand.thumbsdown.circle
	static let hand_thumbsdown_circle = UIImage(systemName: "hand.thumbsdown.circle")

	/// hand.thumbsdown.circle.fill
	static let hand_thumbsdown_circle_fill = UIImage(systemName: "hand.thumbsdown.circle.fill")

	/// hand.point.up.left
	static let hand_point_up_left = UIImage(systemName: "hand.point.up.left")

	/// hand.point.up.left.fill
	static let hand_point_up_left_fill = UIImage(systemName: "hand.point.up.left.fill")

	/// hand.draw
	static let hand_draw = UIImage(systemName: "hand.draw")

	/// hand.draw.fill
	static let hand_draw_fill = UIImage(systemName: "hand.draw.fill")

	/// hand.tap
	static let hand_tap = UIImage(systemName: "hand.tap")

	/// hand.tap.fill
	static let hand_tap_fill = UIImage(systemName: "hand.tap.fill")

	/// rectangle.and.hand.point.up.left
	static let rectangle_and_hand_point_up_left = UIImage(systemName: "rectangle.and.hand.point.up.left")

	/// rectangle.and.hand.point.up.left.fill
	static let rectangle_and_hand_point_up_left_fill = UIImage(systemName: "rectangle.and.hand.point.up.left.fill")

	/// rectangle.filled.and.hand.point.up.left
	static let rectangle_filled_and_hand_point_up_left = UIImage(systemName: "rectangle.filled.and.hand.point.up.left")

	/// rectangle.and.hand.point.up.left.filled
	static let rectangle_and_hand_point_up_left_filled = UIImage(systemName: "rectangle.and.hand.point.up.left.filled")

	/// hand.point.left
	static let hand_point_left = UIImage(systemName: "hand.point.left")

	/// hand.point.left.fill
	static let hand_point_left_fill = UIImage(systemName: "hand.point.left.fill")

	/// hand.point.right
	static let hand_point_right = UIImage(systemName: "hand.point.right")

	/// hand.point.right.fill
	static let hand_point_right_fill = UIImage(systemName: "hand.point.right.fill")

	/// hand.point.up
	static let hand_point_up = UIImage(systemName: "hand.point.up")

	/// hand.point.up.fill
	static let hand_point_up_fill = UIImage(systemName: "hand.point.up.fill")

	/// hand.point.up.braille
	static let hand_point_up_braille = UIImage(systemName: "hand.point.up.braille")

	/// hand.point.up.braille.fill
	static let hand_point_up_braille_fill = UIImage(systemName: "hand.point.up.braille.fill")

	/// hand.point.down
	static let hand_point_down = UIImage(systemName: "hand.point.down")

	/// hand.point.down.fill
	static let hand_point_down_fill = UIImage(systemName: "hand.point.down.fill")

	/// hand.wave
	static let hand_wave = UIImage(systemName: "hand.wave")

	/// hand.wave.fill
	static let hand_wave_fill = UIImage(systemName: "hand.wave.fill")

	/// hands.clap
	static let hands_clap = UIImage(systemName: "hands.clap")

	/// hands.clap.fill
	static let hands_clap_fill = UIImage(systemName: "hands.clap.fill")

	/// hands.sparkles
	static let hands_sparkles = UIImage(systemName: "hands.sparkles")

	/// hands.sparkles.fill
	static let hands_sparkles_fill = UIImage(systemName: "hands.sparkles.fill")

	/// rectangle.compress.vertical
	static let rectangle_compress_vertical = UIImage(systemName: "rectangle.compress.vertical")

	/// rectangle.expand.vertical
	static let rectangle_expand_vertical = UIImage(systemName: "rectangle.expand.vertical")

	/// rectangle.and.arrow.up.right.and.arrow.down.left
	static let rectangle_and_arrow_up_right_and_arrow_down_left = UIImage(systemName: "rectangle.and.arrow.up.right.and.arrow.down.left")

	/// rectangle.and.arrow.up.right.and.arrow.down.left.slash
	static let rectangle_and_arrow_up_right_and_arrow_down_left_slash = UIImage(systemName: "rectangle.and.arrow.up.right.and.arrow.down.left.slash")

	/// square.2.stack.3d
	static let square_2_stack_3d = UIImage(systemName: "square.2.stack.3d")

	/// square.2.stack.3d.top.fill
	static let square_2_stack_3d_top_fill = UIImage(systemName: "square.2.stack.3d.top.fill")

	/// square.2.stack.3d.bottom.fill
	static let square_2_stack_3d_bottom_fill = UIImage(systemName: "square.2.stack.3d.bottom.fill")

	/// square.3.stack.3d
	static let square_3_stack_3d = UIImage(systemName: "square.3.stack.3d")

	/// square.3.stack.3d.top.fill
	static let square_3_stack_3d_top_fill = UIImage(systemName: "square.3.stack.3d.top.fill")

	/// square.3.stack.3d.middle.fill
	static let square_3_stack_3d_middle_fill = UIImage(systemName: "square.3.stack.3d.middle.fill")

	/// square.3.stack.3d.bottom.fill
	static let square_3_stack_3d_bottom_fill = UIImage(systemName: "square.3.stack.3d.bottom.fill")

	/// cylinder
	static let cylinder = UIImage(systemName: "cylinder")

	/// cylinder.fill
	static let cylinder_fill = UIImage(systemName: "cylinder.fill")

	/// cylinder.split.1x2
	static let cylinder_split_1x2 = UIImage(systemName: "cylinder.split.1x2")

	/// cylinder.split.1x2.fill
	static let cylinder_split_1x2_fill = UIImage(systemName: "cylinder.split.1x2.fill")

	/// chart.bar
	static let chart_bar = UIImage(systemName: "chart.bar")

	/// chart.bar.fill
	static let chart_bar_fill = UIImage(systemName: "chart.bar.fill")

	/// chart.pie
	static let chart_pie = UIImage(systemName: "chart.pie")

	/// chart.pie.fill
	static let chart_pie_fill = UIImage(systemName: "chart.pie.fill")

	/// chart.bar.xaxis
	static let chart_bar_xaxis = UIImage(systemName: "chart.bar.xaxis")

	/// chart.line.uptrend.xyaxis
	static let chart_line_uptrend_xyaxis = UIImage(systemName: "chart.line.uptrend.xyaxis")

	/// dot.squareshape.split.2x2
	static let dot_squareshape_split_2x2 = UIImage(systemName: "dot.squareshape.split.2x2")

	/// squareshape.split.2x2.dotted
	static let squareshape_split_2x2_dotted = UIImage(systemName: "squareshape.split.2x2.dotted")

	/// squareshape.split.2x2
	static let squareshape_split_2x2 = UIImage(systemName: "squareshape.split.2x2")

	/// squareshape.split.3x3
	static let squareshape_split_3x3 = UIImage(systemName: "squareshape.split.3x3")

	/// burst
	static let burst = UIImage(systemName: "burst")

	/// burst.fill
	static let burst_fill = UIImage(systemName: "burst.fill")

	/// waveform.path.ecg
	static let waveform_path_ecg = UIImage(systemName: "waveform.path.ecg")

	/// waveform.path.ecg.rectangle
	static let waveform_path_ecg_rectangle = UIImage(systemName: "waveform.path.ecg.rectangle")

	/// waveform.path.ecg.rectangle.fill
	static let waveform_path_ecg_rectangle_fill = UIImage(systemName: "waveform.path.ecg.rectangle.fill")

	/// waveform.path
	static let waveform_path = UIImage(systemName: "waveform.path")

	/// waveform.path.badge.plus
	static let waveform_path_badge_plus = UIImage(systemName: "waveform.path.badge.plus")

	/// waveform.path.badge.minus
	static let waveform_path_badge_minus = UIImage(systemName: "waveform.path.badge.minus")

	/// waveform
	static let waveform = UIImage(systemName: "waveform")

	/// waveform.circle
	static let waveform_circle = UIImage(systemName: "waveform.circle")

	/// waveform.circle.fill
	static let waveform_circle_fill = UIImage(systemName: "waveform.circle.fill")

	/// waveform.badge.plus
	static let waveform_badge_plus = UIImage(systemName: "waveform.badge.plus")

	/// waveform.badge.minus
	static let waveform_badge_minus = UIImage(systemName: "waveform.badge.minus")

	/// waveform.badge.exclamationmark
	static let waveform_badge_exclamationmark = UIImage(systemName: "waveform.badge.exclamationmark")

	/// waveform.and.magnifyingglass
	static let waveform_and_magnifyingglass = UIImage(systemName: "waveform.and.magnifyingglass")

	/// waveform.and.mic
	static let waveform_and_mic = UIImage(systemName: "waveform.and.mic")

	/// staroflife
	static let staroflife = UIImage(systemName: "staroflife")

	/// staroflife.fill
	static let staroflife_fill = UIImage(systemName: "staroflife.fill")

	/// staroflife.circle
	static let staroflife_circle = UIImage(systemName: "staroflife.circle")

	/// staroflife.circle.fill
	static let staroflife_circle_fill = UIImage(systemName: "staroflife.circle.fill")

	/// simcard
	static let simcard = UIImage(systemName: "simcard")

	/// simcard.fill
	static let simcard_fill = UIImage(systemName: "simcard.fill")

	/// simcard.2
	static let simcard_2 = UIImage(systemName: "simcard.2")

	/// simcard.2.fill
	static let simcard_2_fill = UIImage(systemName: "simcard.2.fill")

	/// sdcard
	static let sdcard = UIImage(systemName: "sdcard")

	/// sdcard.fill
	static let sdcard_fill = UIImage(systemName: "sdcard.fill")

	/// esim
	static let esim = UIImage(systemName: "esim")

	/// esim.fill
	static let esim_fill = UIImage(systemName: "esim.fill")

	/// touchid
	static let touchid = UIImage(systemName: "touchid")

	/// bonjour
	static let bonjour = UIImage(systemName: "bonjour")

	/// atom
	static let atom = UIImage(systemName: "atom")

	/// scalemass
	static let scalemass = UIImage(systemName: "scalemass")

	/// scalemass.fill
	static let scalemass_fill = UIImage(systemName: "scalemass.fill")

	/// gift
	static let gift = UIImage(systemName: "gift")

	/// gift.fill
	static let gift_fill = UIImage(systemName: "gift.fill")

	/// gift.circle
	static let gift_circle = UIImage(systemName: "gift.circle")

	/// gift.circle.fill
	static let gift_circle_fill = UIImage(systemName: "gift.circle.fill")

	/// plus.app
	static let plus_app = UIImage(systemName: "plus.app")

	/// plus.app.fill
	static let plus_app_fill = UIImage(systemName: "plus.app.fill")

	/// arrow.down.app
	static let arrow_down_app = UIImage(systemName: "arrow.down.app")

	/// arrow.down.app.fill
	static let arrow_down_app_fill = UIImage(systemName: "arrow.down.app.fill")

	/// arrow.up.forward.app
	static let arrow_up_forward_app = UIImage(systemName: "arrow.up.forward.app")

	/// arrow.up.forward.app.fill
	static let arrow_up_forward_app_fill = UIImage(systemName: "arrow.up.forward.app.fill")

	/// xmark.app
	static let xmark_app = UIImage(systemName: "xmark.app")

	/// xmark.app.fill
	static let xmark_app_fill = UIImage(systemName: "xmark.app.fill")

	/// questionmark.app
	static let questionmark_app = UIImage(systemName: "questionmark.app")

	/// questionmark.app.fill
	static let questionmark_app_fill = UIImage(systemName: "questionmark.app.fill")

	/// app.badge
	static let app_badge = UIImage(systemName: "app.badge")

	/// app.badge.fill
	static let app_badge_fill = UIImage(systemName: "app.badge.fill")

	/// app.badge.checkmark
	static let app_badge_checkmark = UIImage(systemName: "app.badge.checkmark")

	/// app.badge.checkmark.fill
	static let app_badge_checkmark_fill = UIImage(systemName: "app.badge.checkmark.fill")

	/// app.dashed
	static let app_dashed = UIImage(systemName: "app.dashed")

	/// questionmark.app.dashed
	static let questionmark_app_dashed = UIImage(systemName: "questionmark.app.dashed")

	/// appclip
	static let appclip = UIImage(systemName: "appclip")

	/// app.gift
	static let app_gift = UIImage(systemName: "app.gift")

	/// app.gift.fill
	static let app_gift_fill = UIImage(systemName: "app.gift.fill")

	/// studentdesk
	static let studentdesk = UIImage(systemName: "studentdesk")

	/// hourglass
	static let hourglass = UIImage(systemName: "hourglass")

	/// hourglass.badge.plus
	static let hourglass_badge_plus = UIImage(systemName: "hourglass.badge.plus")

	/// hourglass.bottomhalf.filled
	static let hourglass_bottomhalf_filled = UIImage(systemName: "hourglass.bottomhalf.filled")

	/// hourglass.tophalf.filled
	static let hourglass_tophalf_filled = UIImage(systemName: "hourglass.tophalf.filled")

	/// banknote
	static let banknote = UIImage(systemName: "banknote")

	/// banknote.fill
	static let banknote_fill = UIImage(systemName: "banknote.fill")

	/// paragraphsign
	static let paragraphsign = UIImage(systemName: "paragraphsign")

	/// purchased
	static let purchased = UIImage(systemName: "purchased")

	/// purchased.circle
	static let purchased_circle = UIImage(systemName: "purchased.circle")

	/// purchased.circle.fill
	static let purchased_circle_fill = UIImage(systemName: "purchased.circle.fill")

	/// perspective
	static let perspective = UIImage(systemName: "perspective")

	/// circle.and.line.horizontal
	static let circle_and_line_horizontal = UIImage(systemName: "circle.and.line.horizontal")

	/// circle.and.line.horizontal.fill
	static let circle_and_line_horizontal_fill = UIImage(systemName: "circle.and.line.horizontal.fill")

	/// trapezoid.and.line.vertical
	static let trapezoid_and_line_vertical = UIImage(systemName: "trapezoid.and.line.vertical")

	/// trapezoid.and.line.vertical.fill
	static let trapezoid_and_line_vertical_fill = UIImage(systemName: "trapezoid.and.line.vertical.fill")

	/// trapezoid.and.line.horizontal
	static let trapezoid_and_line_horizontal = UIImage(systemName: "trapezoid.and.line.horizontal")

	/// trapezoid.and.line.horizontal.fill
	static let trapezoid_and_line_horizontal_fill = UIImage(systemName: "trapezoid.and.line.horizontal.fill")

	/// aspectratio
	static let aspectratio = UIImage(systemName: "aspectratio")

	/// aspectratio.fill
	static let aspectratio_fill = UIImage(systemName: "aspectratio.fill")

	/// camera.filters
	static let camera_filters = UIImage(systemName: "camera.filters")

	/// skew
	static let skew = UIImage(systemName: "skew")

	/// arrow.left.and.right.righttriangle.left.righttriangle.right
	static let arrow_left_and_right_righttriangle_left_righttriangle_right = UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right")

	/// arrow.left.and.right.righttriangle.left.righttriangle.right.fill
	static let arrow_left_and_right_righttriangle_left_righttriangle_right_fill = UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")

	/// arrow.up.and.down.righttriangle.up.righttriangle.down
	static let arrow_up_and_down_righttriangle_up_righttriangle_down = UIImage(systemName: "arrow.up.and.down.righttriangle.up.righttriangle.down")

	/// arrow.up.and.down.righttriangle.up.fill.righttriangle.down.fill
	static let arrow_up_and_down_righttriangle_up_fill_righttriangle_down_fill = UIImage(systemName: "arrow.up.and.down.righttriangle.up.fill.righttriangle.down.fill")

	/// arrowtriangle.left.and.line.vertical.and.arrowtriangle.right
	static let arrowtriangle_left_and_line_vertical_and_arrowtriangle_right = UIImage(systemName: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right")

	/// arrowtriangle.left.fill.and.line.vertical.and.arrowtriangle.right.fill
	static let arrowtriangle_left_fill_and_line_vertical_and_arrowtriangle_right_fill = UIImage(systemName: "arrowtriangle.left.fill.and.line.vertical.and.arrowtriangle.right.fill")

	/// arrowtriangle.right.and.line.vertical.and.arrowtriangle.left
	static let arrowtriangle_right_and_line_vertical_and_arrowtriangle_left = UIImage(systemName: "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left")

	/// arrowtriangle.right.fill.and.line.vertical.and.arrowtriangle.left.fill
	static let arrowtriangle_right_fill_and_line_vertical_and_arrowtriangle_left_fill = UIImage(systemName: "arrowtriangle.right.fill.and.line.vertical.and.arrowtriangle.left.fill")

	/// grid
	static let grid = UIImage(systemName: "grid")

	/// grid.circle
	static let grid_circle = UIImage(systemName: "grid.circle")

	/// grid.circle.fill
	static let grid_circle_fill = UIImage(systemName: "grid.circle.fill")

	/// burn
	static let burn = UIImage(systemName: "burn")

	/// lifepreserver
	static let lifepreserver = UIImage(systemName: "lifepreserver")

	/// lifepreserver.fill
	static let lifepreserver_fill = UIImage(systemName: "lifepreserver.fill")

	/// recordingtape
	static let recordingtape = UIImage(systemName: "recordingtape")

	/// binoculars
	static let binoculars = UIImage(systemName: "binoculars")

	/// binoculars.fill
	static let binoculars_fill = UIImage(systemName: "binoculars.fill")

	/// battery.100
	static let battery_100 = UIImage(systemName: "battery.100")

	/// battery.75
	static let battery_75 = UIImage(systemName: "battery.75")

	/// battery.50
	static let battery_50 = UIImage(systemName: "battery.50")

	/// battery.25
	static let battery_25 = UIImage(systemName: "battery.25")

	/// battery.0
	static let battery_0 = UIImage(systemName: "battery.0")

	/// battery.100.bolt
	static let battery_100_bolt = UIImage(systemName: "battery.100.bolt")

	/// minus.plus.batteryblock
	static let minus_plus_batteryblock = UIImage(systemName: "minus.plus.batteryblock")

	/// minus.plus.batteryblock.fill
	static let minus_plus_batteryblock_fill = UIImage(systemName: "minus.plus.batteryblock.fill")

	/// bolt.batteryblock
	static let bolt_batteryblock = UIImage(systemName: "bolt.batteryblock")

	/// bolt.batteryblock.fill
	static let bolt_batteryblock_fill = UIImage(systemName: "bolt.batteryblock.fill")

	/// lightbulb
	static let lightbulb = UIImage(systemName: "lightbulb")

	/// lightbulb.fill
	static let lightbulb_fill = UIImage(systemName: "lightbulb.fill")

	/// lightbulb.slash
	static let lightbulb_slash = UIImage(systemName: "lightbulb.slash")

	/// lightbulb.slash.fill
	static let lightbulb_slash_fill = UIImage(systemName: "lightbulb.slash.fill")

	/// fibrechannel
	static let fibrechannel = UIImage(systemName: "fibrechannel")

	/// checklist
	static let checklist = UIImage(systemName: "checklist")

	/// square.fill.text.grid.1x2
	static let square_fill_text_grid_1x2 = UIImage(systemName: "square.fill.text.grid.1x2")

	/// list.dash
	static let list_dash = UIImage(systemName: "list.dash")

	/// list.bullet
	static let list_bullet = UIImage(systemName: "list.bullet")

	/// list.bullet.circle
	static let list_bullet_circle = UIImage(systemName: "list.bullet.circle")

	/// list.bullet.circle.fill
	static let list_bullet_circle_fill = UIImage(systemName: "list.bullet.circle.fill")

	/// list.triangle
	static let list_triangle = UIImage(systemName: "list.triangle")

	/// list.bullet.indent
	static let list_bullet_indent = UIImage(systemName: "list.bullet.indent")

	/// list.number
	static let list_number = UIImage(systemName: "list.number")

	/// list.star
	static let list_star = UIImage(systemName: "list.star")

	/// increase.indent
	static let increase_indent = UIImage(systemName: "increase.indent")

	/// decrease.indent
	static let decrease_indent = UIImage(systemName: "decrease.indent")

	/// decrease.quotelevel
	static let decrease_quotelevel = UIImage(systemName: "decrease.quotelevel")

	/// increase.quotelevel
	static let increase_quotelevel = UIImage(systemName: "increase.quotelevel")

	/// list.bullet.below.rectangle
	static let list_bullet_below_rectangle = UIImage(systemName: "list.bullet.below.rectangle")

	/// text.badge.plus
	static let text_badge_plus = UIImage(systemName: "text.badge.plus")

	/// text.badge.minus
	static let text_badge_minus = UIImage(systemName: "text.badge.minus")

	/// text.badge.checkmark
	static let text_badge_checkmark = UIImage(systemName: "text.badge.checkmark")

	/// text.badge.xmark
	static let text_badge_xmark = UIImage(systemName: "text.badge.xmark")

	/// text.badge.star
	static let text_badge_star = UIImage(systemName: "text.badge.star")

	/// text.insert
	static let text_insert = UIImage(systemName: "text.insert")

	/// text.append
	static let text_append = UIImage(systemName: "text.append")

	/// text.quote
	static let text_quote = UIImage(systemName: "text.quote")

	/// text.alignleft
	static let text_alignleft = UIImage(systemName: "text.alignleft")

	/// text.aligncenter
	static let text_aligncenter = UIImage(systemName: "text.aligncenter")

	/// text.alignright
	static let text_alignright = UIImage(systemName: "text.alignright")

	/// text.justify
	static let text_justify = UIImage(systemName: "text.justify")

	/// text.justifyleft
	static let text_justifyleft = UIImage(systemName: "text.justifyleft")

	/// text.justifyright
	static let text_justifyright = UIImage(systemName: "text.justifyright")

	/// text.redaction
	static let text_redaction = UIImage(systemName: "text.redaction")

	/// list.and.film
	static let list_and_film = UIImage(systemName: "list.and.film")

	/// line.3.horizontal
	static let line_3_horizontal = UIImage(systemName: "line.3.horizontal")

	/// line.3.horizontal.decrease
	static let line_3_horizontal_decrease = UIImage(systemName: "line.3.horizontal.decrease")

	/// line.3.horizontal.decrease.circle
	static let line_3_horizontal_decrease_circle = UIImage(systemName: "line.3.horizontal.decrease.circle")

	/// line.3.horizontal.decrease.circle.fill
	static let line_3_horizontal_decrease_circle_fill = UIImage(systemName: "line.3.horizontal.decrease.circle.fill")

	/// line.3.horizontal.circle
	static let line_3_horizontal_circle = UIImage(systemName: "line.3.horizontal.circle")

	/// line.3.horizontal.circle.fill
	static let line_3_horizontal_circle_fill = UIImage(systemName: "line.3.horizontal.circle.fill")

	/// line.2.horizontal.decrease.circle
	static let line_2_horizontal_decrease_circle = UIImage(systemName: "line.2.horizontal.decrease.circle")

	/// line.2.horizontal.decrease.circle.fill
	static let line_2_horizontal_decrease_circle_fill = UIImage(systemName: "line.2.horizontal.decrease.circle.fill")

	/// character
	static let character = UIImage(systemName: "character")

	/// textformat.size.smaller
	static let textformat_size_smaller = UIImage(systemName: "textformat.size.smaller")

	/// textformat.size.larger
	static let textformat_size_larger = UIImage(systemName: "textformat.size.larger")

	/// textformat.size
	static let textformat_size = UIImage(systemName: "textformat.size")

	/// textformat
	static let textformat = UIImage(systemName: "textformat")

	/// textformat.alt
	static let textformat_alt = UIImage(systemName: "textformat.alt")

	/// textformat.superscript
	static let textformat_superscript = UIImage(systemName: "textformat.superscript")

	/// textformat.subscript
	static let textformat_subscript = UIImage(systemName: "textformat.subscript")

	/// abc
	static let abc = UIImage(systemName: "abc")

	/// textformat.abc
	static let textformat_abc = UIImage(systemName: "textformat.abc")

	/// textformat.abc.dottedunderline
	static let textformat_abc_dottedunderline = UIImage(systemName: "textformat.abc.dottedunderline")

	/// bold
	static let bold = UIImage(systemName: "bold")

	/// italic
	static let italic = UIImage(systemName: "italic")

	/// underline
	static let underline = UIImage(systemName: "underline")

	/// strikethrough
	static let strikethrough = UIImage(systemName: "strikethrough")

	/// shadow
	static let shadow = UIImage(systemName: "shadow")

	/// bold.italic.underline
	static let bold_italic_underline = UIImage(systemName: "bold.italic.underline")

	/// bold.underline
	static let bold_underline = UIImage(systemName: "bold.underline")

	/// view.2d
	static let view_2d = UIImage(systemName: "view.2d")

	/// view.3d
	static let view_3d = UIImage(systemName: "view.3d")

	/// character.cursor.ibeam
	static let character_cursor_ibeam = UIImage(systemName: "character.cursor.ibeam")

	/// fx
	static let fx = UIImage(systemName: "fx")

	/// f.cursive
	static let f_cursive = UIImage(systemName: "f.cursive")

	/// f.cursive.circle
	static let f_cursive_circle = UIImage(systemName: "f.cursive.circle")

	/// f.cursive.circle.fill
	static let f_cursive_circle_fill = UIImage(systemName: "f.cursive.circle.fill")

	/// k
	static let k = UIImage(systemName: "k")

	/// sum
	static let sum = UIImage(systemName: "sum")

	/// percent
	static let percent = UIImage(systemName: "percent")

	/// function
	static let function = UIImage(systemName: "function")

	/// fn
	static let fn = UIImage(systemName: "fn")

	/// textformat.123
	static let textformat_123 = UIImage(systemName: "textformat.123")

	/// 123.rectangle
	static let rectangle_123 = UIImage(systemName: "123.rectangle")

	/// 123.rectangle.fill
	static let rectangle_fill_123 = UIImage(systemName: "123.rectangle.fill")

	/// character.textbox
	static let character_textbox = UIImage(systemName: "character.textbox")

	/// a.magnify
	static let a_magnify = UIImage(systemName: "a.magnify")

	/// info
	static let info = UIImage(systemName: "info")

	/// info.circle
	static let info_circle = UIImage(systemName: "info.circle")

	/// info.circle.fill
	static let info_circle_fill = UIImage(systemName: "info.circle.fill")

	/// at
	static let at = UIImage(systemName: "at")

	/// at.circle
	static let at_circle = UIImage(systemName: "at.circle")

	/// at.circle.fill
	static let at_circle_fill = UIImage(systemName: "at.circle.fill")

	/// at.badge.plus
	static let at_badge_plus = UIImage(systemName: "at.badge.plus")

	/// at.badge.minus
	static let at_badge_minus = UIImage(systemName: "at.badge.minus")

	/// questionmark
	static let questionmark = UIImage(systemName: "questionmark")

	/// questionmark.circle
	static let questionmark_circle = UIImage(systemName: "questionmark.circle")

	/// questionmark.circle.fill
	static let questionmark_circle_fill = UIImage(systemName: "questionmark.circle.fill")

	/// questionmark.square
	static let questionmark_square = UIImage(systemName: "questionmark.square")

	/// questionmark.square.fill
	static let questionmark_square_fill = UIImage(systemName: "questionmark.square.fill")

	/// questionmark.diamond
	static let questionmark_diamond = UIImage(systemName: "questionmark.diamond")

	/// questionmark.diamond.fill
	static let questionmark_diamond_fill = UIImage(systemName: "questionmark.diamond.fill")

	/// exclamationmark
	static let exclamationmark = UIImage(systemName: "exclamationmark")

	/// exclamationmark.2
	static let exclamationmark_2 = UIImage(systemName: "exclamationmark.2")

	/// exclamationmark.3
	static let exclamationmark_3 = UIImage(systemName: "exclamationmark.3")

	/// exclamationmark.circle
	static let exclamationmark_circle = UIImage(systemName: "exclamationmark.circle")

	/// exclamationmark.circle.fill
	static let exclamationmark_circle_fill = UIImage(systemName: "exclamationmark.circle.fill")

	/// exclamationmark.square
	static let exclamationmark_square = UIImage(systemName: "exclamationmark.square")

	/// exclamationmark.square.fill
	static let exclamationmark_square_fill = UIImage(systemName: "exclamationmark.square.fill")

	/// exclamationmark.octagon
	static let exclamationmark_octagon = UIImage(systemName: "exclamationmark.octagon")

	/// exclamationmark.octagon.fill
	static let exclamationmark_octagon_fill = UIImage(systemName: "exclamationmark.octagon.fill")

	/// exclamationmark.shield
	static let exclamationmark_shield = UIImage(systemName: "exclamationmark.shield")

	/// exclamationmark.shield.fill
	static let exclamationmark_shield_fill = UIImage(systemName: "exclamationmark.shield.fill")

	/// plus
	static let plus = UIImage(systemName: "plus")

	/// plus.circle
	static let plus_circle = UIImage(systemName: "plus.circle")

	/// plus.circle.fill
	static let plus_circle_fill = UIImage(systemName: "plus.circle.fill")

	/// plus.square
	static let plus_square = UIImage(systemName: "plus.square")

	/// plus.square.fill
	static let plus_square_fill = UIImage(systemName: "plus.square.fill")

	/// plus.rectangle
	static let plus_rectangle = UIImage(systemName: "plus.rectangle")

	/// plus.rectangle.fill
	static let plus_rectangle_fill = UIImage(systemName: "plus.rectangle.fill")

	/// plus.rectangle.portrait
	static let plus_rectangle_portrait = UIImage(systemName: "plus.rectangle.portrait")

	/// plus.rectangle.portrait.fill
	static let plus_rectangle_portrait_fill = UIImage(systemName: "plus.rectangle.portrait.fill")

	/// plus.diamond
	static let plus_diamond = UIImage(systemName: "plus.diamond")

	/// plus.diamond.fill
	static let plus_diamond_fill = UIImage(systemName: "plus.diamond.fill")

	/// minus
	static let minus = UIImage(systemName: "minus")

	/// minus.circle
	static let minus_circle = UIImage(systemName: "minus.circle")

	/// minus.circle.fill
	static let minus_circle_fill = UIImage(systemName: "minus.circle.fill")

	/// minus.square
	static let minus_square = UIImage(systemName: "minus.square")

	/// minus.square.fill
	static let minus_square_fill = UIImage(systemName: "minus.square.fill")

	/// minus.rectangle
	static let minus_rectangle = UIImage(systemName: "minus.rectangle")

	/// minus.rectangle.fill
	static let minus_rectangle_fill = UIImage(systemName: "minus.rectangle.fill")

	/// minus.rectangle.portrait
	static let minus_rectangle_portrait = UIImage(systemName: "minus.rectangle.portrait")

	/// minus.rectangle.portrait.fill
	static let minus_rectangle_portrait_fill = UIImage(systemName: "minus.rectangle.portrait.fill")

	/// minus.diamond
	static let minus_diamond = UIImage(systemName: "minus.diamond")

	/// minus.diamond.fill
	static let minus_diamond_fill = UIImage(systemName: "minus.diamond.fill")

	/// plusminus
	static let plusminus = UIImage(systemName: "plusminus")

	/// plusminus.circle
	static let plusminus_circle = UIImage(systemName: "plusminus.circle")

	/// plusminus.circle.fill
	static let plusminus_circle_fill = UIImage(systemName: "plusminus.circle.fill")

	/// plus.forwardslash.minus
	static let plus_forwardslash_minus = UIImage(systemName: "plus.forwardslash.minus")

	/// minus.forwardslash.plus
	static let minus_forwardslash_plus = UIImage(systemName: "minus.forwardslash.plus")

	/// multiply
	static let multiply = UIImage(systemName: "multiply")

	/// multiply.circle
	static let multiply_circle = UIImage(systemName: "multiply.circle")

	/// multiply.circle.fill
	static let multiply_circle_fill = UIImage(systemName: "multiply.circle.fill")

	/// multiply.square
	static let multiply_square = UIImage(systemName: "multiply.square")

	/// multiply.square.fill
	static let multiply_square_fill = UIImage(systemName: "multiply.square.fill")

	/// xmark.rectangle
	static let xmark_rectangle = UIImage(systemName: "xmark.rectangle")

	/// xmark.rectangle.fill
	static let xmark_rectangle_fill = UIImage(systemName: "xmark.rectangle.fill")

	/// xmark.rectangle.portrait
	static let xmark_rectangle_portrait = UIImage(systemName: "xmark.rectangle.portrait")

	/// xmark.rectangle.portrait.fill
	static let xmark_rectangle_portrait_fill = UIImage(systemName: "xmark.rectangle.portrait.fill")

	/// xmark.diamond
	static let xmark_diamond = UIImage(systemName: "xmark.diamond")

	/// xmark.diamond.fill
	static let xmark_diamond_fill = UIImage(systemName: "xmark.diamond.fill")

	/// xmark.shield
	static let xmark_shield = UIImage(systemName: "xmark.shield")

	/// xmark.shield.fill
	static let xmark_shield_fill = UIImage(systemName: "xmark.shield.fill")

	/// xmark.octagon
	static let xmark_octagon = UIImage(systemName: "xmark.octagon")

	/// xmark.octagon.fill
	static let xmark_octagon_fill = UIImage(systemName: "xmark.octagon.fill")

	/// divide
	static let divide = UIImage(systemName: "divide")

	/// divide.circle
	static let divide_circle = UIImage(systemName: "divide.circle")

	/// divide.circle.fill
	static let divide_circle_fill = UIImage(systemName: "divide.circle.fill")

	/// divide.square
	static let divide_square = UIImage(systemName: "divide.square")

	/// divide.square.fill
	static let divide_square_fill = UIImage(systemName: "divide.square.fill")

	/// equal
	static let equal = UIImage(systemName: "equal")

	/// equal.circle
	static let equal_circle = UIImage(systemName: "equal.circle")

	/// equal.circle.fill
	static let equal_circle_fill = UIImage(systemName: "equal.circle.fill")

	/// equal.square
	static let equal_square = UIImage(systemName: "equal.square")

	/// equal.square.fill
	static let equal_square_fill = UIImage(systemName: "equal.square.fill")

	/// lessthan
	static let lessthan = UIImage(systemName: "lessthan")

	/// lessthan.circle
	static let lessthan_circle = UIImage(systemName: "lessthan.circle")

	/// lessthan.circle.fill
	static let lessthan_circle_fill = UIImage(systemName: "lessthan.circle.fill")

	/// lessthan.square
	static let lessthan_square = UIImage(systemName: "lessthan.square")

	/// lessthan.square.fill
	static let lessthan_square_fill = UIImage(systemName: "lessthan.square.fill")

	/// greaterthan
	static let greaterthan = UIImage(systemName: "greaterthan")

	/// greaterthan.circle
	static let greaterthan_circle = UIImage(systemName: "greaterthan.circle")

	/// greaterthan.circle.fill
	static let greaterthan_circle_fill = UIImage(systemName: "greaterthan.circle.fill")

	/// greaterthan.square
	static let greaterthan_square = UIImage(systemName: "greaterthan.square")

	/// greaterthan.square.fill
	static let greaterthan_square_fill = UIImage(systemName: "greaterthan.square.fill")

	/// chevron.left.forwardslash.chevron.right
	static let chevron_left_forwardslash_chevron_right = UIImage(systemName: "chevron.left.forwardslash.chevron.right")

	/// parentheses
	static let parentheses = UIImage(systemName: "parentheses")

	/// curlybraces
	static let curlybraces = UIImage(systemName: "curlybraces")

	/// curlybraces.square
	static let curlybraces_square = UIImage(systemName: "curlybraces.square")

	/// curlybraces.square.fill
	static let curlybraces_square_fill = UIImage(systemName: "curlybraces.square.fill")

	/// number
	static let number = UIImage(systemName: "number")

	/// number.circle
	static let number_circle = UIImage(systemName: "number.circle")

	/// number.circle.fill
	static let number_circle_fill = UIImage(systemName: "number.circle.fill")

	/// number.square
	static let number_square = UIImage(systemName: "number.square")

	/// number.square.fill
	static let number_square_fill = UIImage(systemName: "number.square.fill")

	/// x.squareroot
	static let x_squareroot = UIImage(systemName: "x.squareroot")

	/// xmark
	static let xmark = UIImage(systemName: "xmark")

	/// xmark.circle
	static let xmark_circle = UIImage(systemName: "xmark.circle")

	/// xmark.circle.fill
	static let xmark_circle_fill = UIImage(systemName: "xmark.circle.fill")

	/// xmark.square
	static let xmark_square = UIImage(systemName: "xmark.square")

	/// xmark.square.fill
	static let xmark_square_fill = UIImage(systemName: "xmark.square.fill")

	/// checkmark
	static let checkmark = UIImage(systemName: "checkmark")

	/// checkmark.circle
	static let checkmark_circle = UIImage(systemName: "checkmark.circle")

	/// checkmark.circle.fill
	static let checkmark_circle_fill = UIImage(systemName: "checkmark.circle.fill")

	/// checkmark.circle.trianglebadge.exclamationmark
	static let checkmark_circle_trianglebadge_exclamationmark = UIImage(systemName: "checkmark.circle.trianglebadge.exclamationmark")

	/// checkmark.square
	static let checkmark_square = UIImage(systemName: "checkmark.square")

	/// checkmark.square.fill
	static let checkmark_square_fill = UIImage(systemName: "checkmark.square.fill")

	/// checkmark.rectangle
	static let checkmark_rectangle = UIImage(systemName: "checkmark.rectangle")

	/// checkmark.rectangle.fill
	static let checkmark_rectangle_fill = UIImage(systemName: "checkmark.rectangle.fill")

	/// checkmark.rectangle.portrait
	static let checkmark_rectangle_portrait = UIImage(systemName: "checkmark.rectangle.portrait")

	/// checkmark.rectangle.portrait.fill
	static let checkmark_rectangle_portrait_fill = UIImage(systemName: "checkmark.rectangle.portrait.fill")

	/// checkmark.diamond
	static let checkmark_diamond = UIImage(systemName: "checkmark.diamond")

	/// checkmark.diamond.fill
	static let checkmark_diamond_fill = UIImage(systemName: "checkmark.diamond.fill")

	/// checkmark.shield
	static let checkmark_shield = UIImage(systemName: "checkmark.shield")

	/// checkmark.shield.fill
	static let checkmark_shield_fill = UIImage(systemName: "checkmark.shield.fill")

	/// chevron.left
	static let chevron_left = UIImage(systemName: "chevron.left")

	/// chevron.left.circle
	static let chevron_left_circle = UIImage(systemName: "chevron.left.circle")

	/// chevron.left.circle.fill
	static let chevron_left_circle_fill = UIImage(systemName: "chevron.left.circle.fill")

	/// chevron.left.square
	static let chevron_left_square = UIImage(systemName: "chevron.left.square")

	/// chevron.left.square.fill
	static let chevron_left_square_fill = UIImage(systemName: "chevron.left.square.fill")

	/// chevron.backward
	static let chevron_backward = UIImage(systemName: "chevron.backward")

	/// chevron.backward.circle
	static let chevron_backward_circle = UIImage(systemName: "chevron.backward.circle")

	/// chevron.backward.circle.fill
	static let chevron_backward_circle_fill = UIImage(systemName: "chevron.backward.circle.fill")

	/// chevron.backward.square
	static let chevron_backward_square = UIImage(systemName: "chevron.backward.square")

	/// chevron.backward.square.fill
	static let chevron_backward_square_fill = UIImage(systemName: "chevron.backward.square.fill")

	/// chevron.right
	static let chevron_right = UIImage(systemName: "chevron.right")

	/// chevron.right.circle
	static let chevron_right_circle = UIImage(systemName: "chevron.right.circle")

	/// chevron.right.circle.fill
	static let chevron_right_circle_fill = UIImage(systemName: "chevron.right.circle.fill")

	/// chevron.right.square
	static let chevron_right_square = UIImage(systemName: "chevron.right.square")

	/// chevron.right.square.fill
	static let chevron_right_square_fill = UIImage(systemName: "chevron.right.square.fill")

	/// chevron.forward
	static let chevron_forward = UIImage(systemName: "chevron.forward")

	/// chevron.forward.circle
	static let chevron_forward_circle = UIImage(systemName: "chevron.forward.circle")

	/// chevron.forward.circle.fill
	static let chevron_forward_circle_fill = UIImage(systemName: "chevron.forward.circle.fill")

	/// chevron.forward.square
	static let chevron_forward_square = UIImage(systemName: "chevron.forward.square")

	/// chevron.forward.square.fill
	static let chevron_forward_square_fill = UIImage(systemName: "chevron.forward.square.fill")

	/// chevron.left.2
	static let chevron_left_2 = UIImage(systemName: "chevron.left.2")

	/// chevron.backward.2
	static let chevron_backward_2 = UIImage(systemName: "chevron.backward.2")

	/// chevron.right.2
	static let chevron_right_2 = UIImage(systemName: "chevron.right.2")

	/// chevron.forward.2
	static let chevron_forward_2 = UIImage(systemName: "chevron.forward.2")

	/// chevron.up
	static let chevron_up = UIImage(systemName: "chevron.up")

	/// chevron.up.circle
	static let chevron_up_circle = UIImage(systemName: "chevron.up.circle")

	/// chevron.up.circle.fill
	static let chevron_up_circle_fill = UIImage(systemName: "chevron.up.circle.fill")

	/// chevron.up.square
	static let chevron_up_square = UIImage(systemName: "chevron.up.square")

	/// chevron.up.square.fill
	static let chevron_up_square_fill = UIImage(systemName: "chevron.up.square.fill")

	/// chevron.down
	static let chevron_down = UIImage(systemName: "chevron.down")

	/// chevron.down.circle
	static let chevron_down_circle = UIImage(systemName: "chevron.down.circle")

	/// chevron.down.circle.fill
	static let chevron_down_circle_fill = UIImage(systemName: "chevron.down.circle.fill")

	/// chevron.down.square
	static let chevron_down_square = UIImage(systemName: "chevron.down.square")

	/// chevron.down.square.fill
	static let chevron_down_square_fill = UIImage(systemName: "chevron.down.square.fill")

	/// control
	static let control = UIImage(systemName: "control")

	/// projective
	static let projective = UIImage(systemName: "projective")

	/// chevron.up.chevron.down
	static let chevron_up_chevron_down = UIImage(systemName: "chevron.up.chevron.down")

	/// chevron.compact.up
	static let chevron_compact_up = UIImage(systemName: "chevron.compact.up")

	/// chevron.compact.down
	static let chevron_compact_down = UIImage(systemName: "chevron.compact.down")

	/// chevron.compact.left
	static let chevron_compact_left = UIImage(systemName: "chevron.compact.left")

	/// chevron.compact.right
	static let chevron_compact_right = UIImage(systemName: "chevron.compact.right")

	/// arrow.left
	static let arrow_left = UIImage(systemName: "arrow.left")

	/// arrow.left.circle
	static let arrow_left_circle = UIImage(systemName: "arrow.left.circle")

	/// arrow.left.circle.fill
	static let arrow_left_circle_fill = UIImage(systemName: "arrow.left.circle.fill")

	/// arrow.left.square
	static let arrow_left_square = UIImage(systemName: "arrow.left.square")

	/// arrow.left.square.fill
	static let arrow_left_square_fill = UIImage(systemName: "arrow.left.square.fill")

	/// arrow.backward
	static let arrow_backward = UIImage(systemName: "arrow.backward")

	/// arrow.backward.circle
	static let arrow_backward_circle = UIImage(systemName: "arrow.backward.circle")

	/// arrow.backward.circle.fill
	static let arrow_backward_circle_fill = UIImage(systemName: "arrow.backward.circle.fill")

	/// arrow.backward.square
	static let arrow_backward_square = UIImage(systemName: "arrow.backward.square")

	/// arrow.backward.square.fill
	static let arrow_backward_square_fill = UIImage(systemName: "arrow.backward.square.fill")

	/// arrow.right
	static let arrow_right = UIImage(systemName: "arrow.right")

	/// arrow.right.circle
	static let arrow_right_circle = UIImage(systemName: "arrow.right.circle")

	/// arrow.right.circle.fill
	static let arrow_right_circle_fill = UIImage(systemName: "arrow.right.circle.fill")

	/// arrow.right.square
	static let arrow_right_square = UIImage(systemName: "arrow.right.square")

	/// arrow.right.square.fill
	static let arrow_right_square_fill = UIImage(systemName: "arrow.right.square.fill")

	/// arrow.forward
	static let arrow_forward = UIImage(systemName: "arrow.forward")

	/// arrow.forward.circle
	static let arrow_forward_circle = UIImage(systemName: "arrow.forward.circle")

	/// arrow.forward.circle.fill
	static let arrow_forward_circle_fill = UIImage(systemName: "arrow.forward.circle.fill")

	/// arrow.forward.square
	static let arrow_forward_square = UIImage(systemName: "arrow.forward.square")

	/// arrow.forward.square.fill
	static let arrow_forward_square_fill = UIImage(systemName: "arrow.forward.square.fill")

	/// arrow.up
	static let arrow_up = UIImage(systemName: "arrow.up")

	/// arrow.up.circle
	static let arrow_up_circle = UIImage(systemName: "arrow.up.circle")

	/// arrow.up.circle.fill
	static let arrow_up_circle_fill = UIImage(systemName: "arrow.up.circle.fill")

	/// arrow.up.square
	static let arrow_up_square = UIImage(systemName: "arrow.up.square")

	/// arrow.up.square.fill
	static let arrow_up_square_fill = UIImage(systemName: "arrow.up.square.fill")

	/// arrow.down
	static let arrow_down = UIImage(systemName: "arrow.down")

	/// arrow.down.circle
	static let arrow_down_circle = UIImage(systemName: "arrow.down.circle")

	/// arrow.down.circle.fill
	static let arrow_down_circle_fill = UIImage(systemName: "arrow.down.circle.fill")

	/// arrow.down.square
	static let arrow_down_square = UIImage(systemName: "arrow.down.square")

	/// arrow.down.square.fill
	static let arrow_down_square_fill = UIImage(systemName: "arrow.down.square.fill")

	/// arrow.up.left
	static let arrow_up_left = UIImage(systemName: "arrow.up.left")

	/// arrow.up.left.circle
	static let arrow_up_left_circle = UIImage(systemName: "arrow.up.left.circle")

	/// arrow.up.left.circle.fill
	static let arrow_up_left_circle_fill = UIImage(systemName: "arrow.up.left.circle.fill")

	/// arrow.up.left.square
	static let arrow_up_left_square = UIImage(systemName: "arrow.up.left.square")

	/// arrow.up.left.square.fill
	static let arrow_up_left_square_fill = UIImage(systemName: "arrow.up.left.square.fill")

	/// arrow.up.backward
	static let arrow_up_backward = UIImage(systemName: "arrow.up.backward")

	/// arrow.up.backward.circle
	static let arrow_up_backward_circle = UIImage(systemName: "arrow.up.backward.circle")

	/// arrow.up.backward.circle.fill
	static let arrow_up_backward_circle_fill = UIImage(systemName: "arrow.up.backward.circle.fill")

	/// arrow.up.backward.square
	static let arrow_up_backward_square = UIImage(systemName: "arrow.up.backward.square")

	/// arrow.up.backward.square.fill
	static let arrow_up_backward_square_fill = UIImage(systemName: "arrow.up.backward.square.fill")

	/// arrow.up.right
	static let arrow_up_right = UIImage(systemName: "arrow.up.right")

	/// arrow.up.right.circle
	static let arrow_up_right_circle = UIImage(systemName: "arrow.up.right.circle")

	/// arrow.up.right.circle.fill
	static let arrow_up_right_circle_fill = UIImage(systemName: "arrow.up.right.circle.fill")

	/// arrow.up.right.square
	static let arrow_up_right_square = UIImage(systemName: "arrow.up.right.square")

	/// arrow.up.right.square.fill
	static let arrow_up_right_square_fill = UIImage(systemName: "arrow.up.right.square.fill")

	/// arrow.up.forward
	static let arrow_up_forward = UIImage(systemName: "arrow.up.forward")

	/// arrow.up.forward.circle
	static let arrow_up_forward_circle = UIImage(systemName: "arrow.up.forward.circle")

	/// arrow.up.forward.circle.fill
	static let arrow_up_forward_circle_fill = UIImage(systemName: "arrow.up.forward.circle.fill")

	/// arrow.up.forward.square
	static let arrow_up_forward_square = UIImage(systemName: "arrow.up.forward.square")

	/// arrow.up.forward.square.fill
	static let arrow_up_forward_square_fill = UIImage(systemName: "arrow.up.forward.square.fill")

	/// arrow.down.left
	static let arrow_down_left = UIImage(systemName: "arrow.down.left")

	/// arrow.down.left.circle
	static let arrow_down_left_circle = UIImage(systemName: "arrow.down.left.circle")

	/// arrow.down.left.circle.fill
	static let arrow_down_left_circle_fill = UIImage(systemName: "arrow.down.left.circle.fill")

	/// arrow.down.left.square
	static let arrow_down_left_square = UIImage(systemName: "arrow.down.left.square")

	/// arrow.down.left.square.fill
	static let arrow_down_left_square_fill = UIImage(systemName: "arrow.down.left.square.fill")

	/// arrow.down.backward
	static let arrow_down_backward = UIImage(systemName: "arrow.down.backward")

	/// arrow.down.backward.circle
	static let arrow_down_backward_circle = UIImage(systemName: "arrow.down.backward.circle")

	/// arrow.down.backward.circle.fill
	static let arrow_down_backward_circle_fill = UIImage(systemName: "arrow.down.backward.circle.fill")

	/// arrow.down.backward.square
	static let arrow_down_backward_square = UIImage(systemName: "arrow.down.backward.square")

	/// arrow.down.backward.square.fill
	static let arrow_down_backward_square_fill = UIImage(systemName: "arrow.down.backward.square.fill")

	/// arrow.down.right
	static let arrow_down_right = UIImage(systemName: "arrow.down.right")

	/// arrow.down.right.circle
	static let arrow_down_right_circle = UIImage(systemName: "arrow.down.right.circle")

	/// arrow.down.right.circle.fill
	static let arrow_down_right_circle_fill = UIImage(systemName: "arrow.down.right.circle.fill")

	/// arrow.down.right.square
	static let arrow_down_right_square = UIImage(systemName: "arrow.down.right.square")

	/// arrow.down.right.square.fill
	static let arrow_down_right_square_fill = UIImage(systemName: "arrow.down.right.square.fill")

	/// arrow.down.forward
	static let arrow_down_forward = UIImage(systemName: "arrow.down.forward")

	/// arrow.down.forward.circle
	static let arrow_down_forward_circle = UIImage(systemName: "arrow.down.forward.circle")

	/// arrow.down.forward.circle.fill
	static let arrow_down_forward_circle_fill = UIImage(systemName: "arrow.down.forward.circle.fill")

	/// arrow.down.forward.square
	static let arrow_down_forward_square = UIImage(systemName: "arrow.down.forward.square")

	/// arrow.down.forward.square.fill
	static let arrow_down_forward_square_fill = UIImage(systemName: "arrow.down.forward.square.fill")

	/// arrow.left.arrow.right
	static let arrow_left_arrow_right = UIImage(systemName: "arrow.left.arrow.right")

	/// arrow.left.arrow.right.circle
	static let arrow_left_arrow_right_circle = UIImage(systemName: "arrow.left.arrow.right.circle")

	/// arrow.left.arrow.right.circle.fill
	static let arrow_left_arrow_right_circle_fill = UIImage(systemName: "arrow.left.arrow.right.circle.fill")

	/// arrow.left.arrow.right.square
	static let arrow_left_arrow_right_square = UIImage(systemName: "arrow.left.arrow.right.square")

	/// arrow.left.arrow.right.square.fill
	static let arrow_left_arrow_right_square_fill = UIImage(systemName: "arrow.left.arrow.right.square.fill")

	/// arrow.up.arrow.down
	static let arrow_up_arrow_down = UIImage(systemName: "arrow.up.arrow.down")

	/// arrow.up.arrow.down.circle
	static let arrow_up_arrow_down_circle = UIImage(systemName: "arrow.up.arrow.down.circle")

	/// arrow.up.arrow.down.circle.fill
	static let arrow_up_arrow_down_circle_fill = UIImage(systemName: "arrow.up.arrow.down.circle.fill")

	/// arrow.up.arrow.down.square
	static let arrow_up_arrow_down_square = UIImage(systemName: "arrow.up.arrow.down.square")

	/// arrow.up.arrow.down.square.fill
	static let arrow_up_arrow_down_square_fill = UIImage(systemName: "arrow.up.arrow.down.square.fill")

	/// arrow.turn.down.left
	static let arrow_turn_down_left = UIImage(systemName: "arrow.turn.down.left")

	/// arrow.turn.up.left
	static let arrow_turn_up_left = UIImage(systemName: "arrow.turn.up.left")

	/// arrow.turn.down.right
	static let arrow_turn_down_right = UIImage(systemName: "arrow.turn.down.right")

	/// arrow.turn.up.right
	static let arrow_turn_up_right = UIImage(systemName: "arrow.turn.up.right")

	/// arrow.turn.right.up
	static let arrow_turn_right_up = UIImage(systemName: "arrow.turn.right.up")

	/// arrow.turn.left.up
	static let arrow_turn_left_up = UIImage(systemName: "arrow.turn.left.up")

	/// arrow.turn.right.down
	static let arrow_turn_right_down = UIImage(systemName: "arrow.turn.right.down")

	/// arrow.turn.left.down
	static let arrow_turn_left_down = UIImage(systemName: "arrow.turn.left.down")

	/// arrow.uturn.left
	static let arrow_uturn_left = UIImage(systemName: "arrow.uturn.left")

	/// arrow.uturn.left.circle
	static let arrow_uturn_left_circle = UIImage(systemName: "arrow.uturn.left.circle")

	/// arrow.uturn.left.circle.fill
	static let arrow_uturn_left_circle_fill = UIImage(systemName: "arrow.uturn.left.circle.fill")

	/// arrow.uturn.left.circle.badge.ellipsis
	static let arrow_uturn_left_circle_badge_ellipsis = UIImage(systemName: "arrow.uturn.left.circle.badge.ellipsis")

	/// arrow.uturn.left.square
	static let arrow_uturn_left_square = UIImage(systemName: "arrow.uturn.left.square")

	/// arrow.uturn.left.square.fill
	static let arrow_uturn_left_square_fill = UIImage(systemName: "arrow.uturn.left.square.fill")

	/// arrow.uturn.backward
	static let arrow_uturn_backward = UIImage(systemName: "arrow.uturn.backward")

	/// arrow.uturn.backward.circle
	static let arrow_uturn_backward_circle = UIImage(systemName: "arrow.uturn.backward.circle")

	/// arrow.uturn.backward.circle.fill
	static let arrow_uturn_backward_circle_fill = UIImage(systemName: "arrow.uturn.backward.circle.fill")

	/// arrow.uturn.backward.circle.badge.ellipsis
	static let arrow_uturn_backward_circle_badge_ellipsis = UIImage(systemName: "arrow.uturn.backward.circle.badge.ellipsis")

	/// arrow.uturn.backward.square
	static let arrow_uturn_backward_square = UIImage(systemName: "arrow.uturn.backward.square")

	/// arrow.uturn.backward.square.fill
	static let arrow_uturn_backward_square_fill = UIImage(systemName: "arrow.uturn.backward.square.fill")

	/// arrow.uturn.right
	static let arrow_uturn_right = UIImage(systemName: "arrow.uturn.right")

	/// arrow.uturn.right.circle
	static let arrow_uturn_right_circle = UIImage(systemName: "arrow.uturn.right.circle")

	/// arrow.uturn.right.circle.fill
	static let arrow_uturn_right_circle_fill = UIImage(systemName: "arrow.uturn.right.circle.fill")

	/// arrow.uturn.right.square
	static let arrow_uturn_right_square = UIImage(systemName: "arrow.uturn.right.square")

	/// arrow.uturn.right.square.fill
	static let arrow_uturn_right_square_fill = UIImage(systemName: "arrow.uturn.right.square.fill")

	/// arrow.uturn.forward
	static let arrow_uturn_forward = UIImage(systemName: "arrow.uturn.forward")

	/// arrow.uturn.forward.circle
	static let arrow_uturn_forward_circle = UIImage(systemName: "arrow.uturn.forward.circle")

	/// arrow.uturn.forward.circle.fill
	static let arrow_uturn_forward_circle_fill = UIImage(systemName: "arrow.uturn.forward.circle.fill")

	/// arrow.uturn.forward.square
	static let arrow_uturn_forward_square = UIImage(systemName: "arrow.uturn.forward.square")

	/// arrow.uturn.forward.square.fill
	static let arrow_uturn_forward_square_fill = UIImage(systemName: "arrow.uturn.forward.square.fill")

	/// arrow.uturn.up
	static let arrow_uturn_up = UIImage(systemName: "arrow.uturn.up")

	/// arrow.uturn.up.circle
	static let arrow_uturn_up_circle = UIImage(systemName: "arrow.uturn.up.circle")

	/// arrow.uturn.up.circle.fill
	static let arrow_uturn_up_circle_fill = UIImage(systemName: "arrow.uturn.up.circle.fill")

	/// arrow.uturn.up.square
	static let arrow_uturn_up_square = UIImage(systemName: "arrow.uturn.up.square")

	/// arrow.uturn.up.square.fill
	static let arrow_uturn_up_square_fill = UIImage(systemName: "arrow.uturn.up.square.fill")

	/// arrow.uturn.down
	static let arrow_uturn_down = UIImage(systemName: "arrow.uturn.down")

	/// arrow.uturn.down.circle
	static let arrow_uturn_down_circle = UIImage(systemName: "arrow.uturn.down.circle")

	/// arrow.uturn.down.circle.fill
	static let arrow_uturn_down_circle_fill = UIImage(systemName: "arrow.uturn.down.circle.fill")

	/// arrow.uturn.down.square
	static let arrow_uturn_down_square = UIImage(systemName: "arrow.uturn.down.square")

	/// arrow.uturn.down.square.fill
	static let arrow_uturn_down_square_fill = UIImage(systemName: "arrow.uturn.down.square.fill")

	/// arrow.up.and.down.and.arrow.left.and.right
	static let arrow_up_and_down_and_arrow_left_and_right = UIImage(systemName: "arrow.up.and.down.and.arrow.left.and.right")

	/// arrow.up.left.and.down.right.and.arrow.up.right.and.down.left
	static let arrow_up_left_and_down_right_and_arrow_up_right_and_down_left = UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")

	/// arrow.left.and.right
	static let arrow_left_and_right = UIImage(systemName: "arrow.left.and.right")

	/// arrow.left.and.right.circle
	static let arrow_left_and_right_circle = UIImage(systemName: "arrow.left.and.right.circle")

	/// arrow.left.and.right.circle.fill
	static let arrow_left_and_right_circle_fill = UIImage(systemName: "arrow.left.and.right.circle.fill")

	/// arrow.left.and.right.square
	static let arrow_left_and_right_square = UIImage(systemName: "arrow.left.and.right.square")

	/// arrow.left.and.right.square.fill
	static let arrow_left_and_right_square_fill = UIImage(systemName: "arrow.left.and.right.square.fill")

	/// arrow.up.and.down
	static let arrow_up_and_down = UIImage(systemName: "arrow.up.and.down")

	/// arrow.up.and.down.circle
	static let arrow_up_and_down_circle = UIImage(systemName: "arrow.up.and.down.circle")

	/// arrow.up.and.down.circle.fill
	static let arrow_up_and_down_circle_fill = UIImage(systemName: "arrow.up.and.down.circle.fill")

	/// arrow.up.and.down.square
	static let arrow_up_and_down_square = UIImage(systemName: "arrow.up.and.down.square")

	/// arrow.up.and.down.square.fill
	static let arrow_up_and_down_square_fill = UIImage(systemName: "arrow.up.and.down.square.fill")

	/// arrow.up.to.line
	static let arrow_up_to_line = UIImage(systemName: "arrow.up.to.line")

	/// arrow.up.to.line.compact
	static let arrow_up_to_line_compact = UIImage(systemName: "arrow.up.to.line.compact")

	/// arrow.up.to.line.circle
	static let arrow_up_to_line_circle = UIImage(systemName: "arrow.up.to.line.circle")

	/// arrow.up.to.line.circle.fill
	static let arrow_up_to_line_circle_fill = UIImage(systemName: "arrow.up.to.line.circle.fill")

	/// arrow.down.to.line
	static let arrow_down_to_line = UIImage(systemName: "arrow.down.to.line")

	/// arrow.down.to.line.compact
	static let arrow_down_to_line_compact = UIImage(systemName: "arrow.down.to.line.compact")

	/// arrow.down.to.line.circle
	static let arrow_down_to_line_circle = UIImage(systemName: "arrow.down.to.line.circle")

	/// arrow.down.to.line.circle.fill
	static let arrow_down_to_line_circle_fill = UIImage(systemName: "arrow.down.to.line.circle.fill")

	/// arrow.left.to.line
	static let arrow_left_to_line = UIImage(systemName: "arrow.left.to.line")

	/// arrow.left.to.line.compact
	static let arrow_left_to_line_compact = UIImage(systemName: "arrow.left.to.line.compact")

	/// arrow.left.to.line.circle
	static let arrow_left_to_line_circle = UIImage(systemName: "arrow.left.to.line.circle")

	/// arrow.left.to.line.circle.fill
	static let arrow_left_to_line_circle_fill = UIImage(systemName: "arrow.left.to.line.circle.fill")

	/// arrow.backward.to.line
	static let arrow_backward_to_line = UIImage(systemName: "arrow.backward.to.line")

	/// arrow.backward.to.line.circle
	static let arrow_backward_to_line_circle = UIImage(systemName: "arrow.backward.to.line.circle")

	/// arrow.backward.to.line.circle.fill
	static let arrow_backward_to_line_circle_fill = UIImage(systemName: "arrow.backward.to.line.circle.fill")

	/// arrow.right.to.line
	static let arrow_right_to_line = UIImage(systemName: "arrow.right.to.line")

	/// arrow.right.to.line.compact
	static let arrow_right_to_line_compact = UIImage(systemName: "arrow.right.to.line.compact")

	/// arrow.right.to.line.circle
	static let arrow_right_to_line_circle = UIImage(systemName: "arrow.right.to.line.circle")

	/// arrow.right.to.line.circle.fill
	static let arrow_right_to_line_circle_fill = UIImage(systemName: "arrow.right.to.line.circle.fill")

	/// arrow.forward.to.line
	static let arrow_forward_to_line = UIImage(systemName: "arrow.forward.to.line")

	/// arrow.forward.to.line.circle
	static let arrow_forward_to_line_circle = UIImage(systemName: "arrow.forward.to.line.circle")

	/// arrow.forward.to.line.circle.fill
	static let arrow_forward_to_line_circle_fill = UIImage(systemName: "arrow.forward.to.line.circle.fill")

	/// arrow.clockwise
	static let arrow_clockwise = UIImage(systemName: "arrow.clockwise")

	/// arrow.clockwise.circle
	static let arrow_clockwise_circle = UIImage(systemName: "arrow.clockwise.circle")

	/// arrow.clockwise.circle.fill
	static let arrow_clockwise_circle_fill = UIImage(systemName: "arrow.clockwise.circle.fill")

	/// arrow.counterclockwise
	static let arrow_counterclockwise = UIImage(systemName: "arrow.counterclockwise")

	/// arrow.counterclockwise.circle
	static let arrow_counterclockwise_circle = UIImage(systemName: "arrow.counterclockwise.circle")

	/// arrow.counterclockwise.circle.fill
	static let arrow_counterclockwise_circle_fill = UIImage(systemName: "arrow.counterclockwise.circle.fill")

	/// arrow.up.left.and.arrow.down.right
	static let arrow_up_left_and_arrow_down_right = UIImage(systemName: "arrow.up.left.and.arrow.down.right")

	/// arrow.up.left.and.arrow.down.right.circle
	static let arrow_up_left_and_arrow_down_right_circle = UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle")

	/// arrow.up.left.and.arrow.down.right.circle.fill
	static let arrow_up_left_and_arrow_down_right_circle_fill = UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle.fill")

	/// arrow.up.backward.and.arrow.down.forward
	static let arrow_up_backward_and_arrow_down_forward = UIImage(systemName: "arrow.up.backward.and.arrow.down.forward")

	/// arrow.up.backward.and.arrow.down.forward.circle
	static let arrow_up_backward_and_arrow_down_forward_circle = UIImage(systemName: "arrow.up.backward.and.arrow.down.forward.circle")

	/// arrow.up.backward.and.arrow.down.forward.circle.fill
	static let arrow_up_backward_and_arrow_down_forward_circle_fill = UIImage(systemName: "arrow.up.backward.and.arrow.down.forward.circle.fill")

	/// arrow.down.right.and.arrow.up.left
	static let arrow_down_right_and_arrow_up_left = UIImage(systemName: "arrow.down.right.and.arrow.up.left")

	/// arrow.down.right.and.arrow.up.left.circle
	static let arrow_down_right_and_arrow_up_left_circle = UIImage(systemName: "arrow.down.right.and.arrow.up.left.circle")

	/// arrow.down.right.and.arrow.up.left.circle.fill
	static let arrow_down_right_and_arrow_up_left_circle_fill = UIImage(systemName: "arrow.down.right.and.arrow.up.left.circle.fill")

	/// arrow.down.forward.and.arrow.up.backward
	static let arrow_down_forward_and_arrow_up_backward = UIImage(systemName: "arrow.down.forward.and.arrow.up.backward")

	/// arrow.down.forward.and.arrow.up.backward.circle
	static let arrow_down_forward_and_arrow_up_backward_circle = UIImage(systemName: "arrow.down.forward.and.arrow.up.backward.circle")

	/// arrow.down.forward.and.arrow.up.backward.circle.fill
	static let arrow_down_forward_and_arrow_up_backward_circle_fill = UIImage(systemName: "arrow.down.forward.and.arrow.up.backward.circle.fill")

	/// return
	static let return_Image = UIImage(systemName: "return")

	/// return.left
	static let return_left = UIImage(systemName: "return.left")

	/// return.right
	static let return_right = UIImage(systemName: "return.right")

	/// arrow.2.squarepath
	static let arrow_2_squarepath = UIImage(systemName: "arrow.2.squarepath")

	/// arrow.triangle.2.circlepath
	static let arrow_triangle_2_circlepath = UIImage(systemName: "arrow.triangle.2.circlepath")

	/// arrow.triangle.2.circlepath.circle
	static let arrow_triangle_2_circlepath_circle = UIImage(systemName: "arrow.triangle.2.circlepath.circle")

	/// arrow.triangle.2.circlepath.circle.fill
	static let arrow_triangle_2_circlepath_circle_fill = UIImage(systemName: "arrow.triangle.2.circlepath.circle.fill")

	/// exclamationmark.arrow.triangle.2.circlepath
	static let exclamationmark_arrow_triangle_2_circlepath = UIImage(systemName: "exclamationmark.arrow.triangle.2.circlepath")

	/// arrow.triangle.capsulepath
	static let arrow_triangle_capsulepath = UIImage(systemName: "arrow.triangle.capsulepath")

	/// arrow.3.trianglepath
	static let arrow_3_trianglepath = UIImage(systemName: "arrow.3.trianglepath")

	/// arrow.triangle.turn.up.right.diamond
	static let arrow_triangle_turn_up_right_diamond = UIImage(systemName: "arrow.triangle.turn.up.right.diamond")

	/// arrow.triangle.turn.up.right.diamond.fill
	static let arrow_triangle_turn_up_right_diamond_fill = UIImage(systemName: "arrow.triangle.turn.up.right.diamond.fill")

	/// arrow.triangle.turn.up.right.circle
	static let arrow_triangle_turn_up_right_circle = UIImage(systemName: "arrow.triangle.turn.up.right.circle")

	/// arrow.triangle.turn.up.right.circle.fill
	static let arrow_triangle_turn_up_right_circle_fill = UIImage(systemName: "arrow.triangle.turn.up.right.circle.fill")

	/// arrow.triangle.merge
	static let arrow_triangle_merge = UIImage(systemName: "arrow.triangle.merge")

	/// arrow.triangle.swap
	static let arrow_triangle_swap = UIImage(systemName: "arrow.triangle.swap")

	/// arrow.triangle.branch
	static let arrow_triangle_branch = UIImage(systemName: "arrow.triangle.branch")

	/// arrow.triangle.pull
	static let arrow_triangle_pull = UIImage(systemName: "arrow.triangle.pull")

	/// arrowtriangle.left
	static let arrowtriangle_left = UIImage(systemName: "arrowtriangle.left")

	/// arrowtriangle.left.fill
	static let arrowtriangle_left_fill = UIImage(systemName: "arrowtriangle.left.fill")

	/// arrowtriangle.left.circle
	static let arrowtriangle_left_circle = UIImage(systemName: "arrowtriangle.left.circle")

	/// arrowtriangle.left.circle.fill
	static let arrowtriangle_left_circle_fill = UIImage(systemName: "arrowtriangle.left.circle.fill")

	/// arrowtriangle.left.square
	static let arrowtriangle_left_square = UIImage(systemName: "arrowtriangle.left.square")

	/// arrowtriangle.left.square.fill
	static let arrowtriangle_left_square_fill = UIImage(systemName: "arrowtriangle.left.square.fill")

	/// arrowtriangle.backward
	static let arrowtriangle_backward = UIImage(systemName: "arrowtriangle.backward")

	/// arrowtriangle.backward.fill
	static let arrowtriangle_backward_fill = UIImage(systemName: "arrowtriangle.backward.fill")

	/// arrowtriangle.backward.circle
	static let arrowtriangle_backward_circle = UIImage(systemName: "arrowtriangle.backward.circle")

	/// arrowtriangle.backward.circle.fill
	static let arrowtriangle_backward_circle_fill = UIImage(systemName: "arrowtriangle.backward.circle.fill")

	/// arrowtriangle.backward.square
	static let arrowtriangle_backward_square = UIImage(systemName: "arrowtriangle.backward.square")

	/// arrowtriangle.backward.square.fill
	static let arrowtriangle_backward_square_fill = UIImage(systemName: "arrowtriangle.backward.square.fill")

	/// arrowtriangle.right
	static let arrowtriangle_right = UIImage(systemName: "arrowtriangle.right")

	/// arrowtriangle.right.fill
	static let arrowtriangle_right_fill = UIImage(systemName: "arrowtriangle.right.fill")

	/// arrowtriangle.right.circle
	static let arrowtriangle_right_circle = UIImage(systemName: "arrowtriangle.right.circle")

	/// arrowtriangle.right.circle.fill
	static let arrowtriangle_right_circle_fill = UIImage(systemName: "arrowtriangle.right.circle.fill")

	/// arrowtriangle.right.square
	static let arrowtriangle_right_square = UIImage(systemName: "arrowtriangle.right.square")

	/// arrowtriangle.right.square.fill
	static let arrowtriangle_right_square_fill = UIImage(systemName: "arrowtriangle.right.square.fill")

	/// arrowtriangle.forward
	static let arrowtriangle_forward = UIImage(systemName: "arrowtriangle.forward")

	/// arrowtriangle.forward.fill
	static let arrowtriangle_forward_fill = UIImage(systemName: "arrowtriangle.forward.fill")

	/// arrowtriangle.forward.circle
	static let arrowtriangle_forward_circle = UIImage(systemName: "arrowtriangle.forward.circle")

	/// arrowtriangle.forward.circle.fill
	static let arrowtriangle_forward_circle_fill = UIImage(systemName: "arrowtriangle.forward.circle.fill")

	/// arrowtriangle.forward.square
	static let arrowtriangle_forward_square = UIImage(systemName: "arrowtriangle.forward.square")

	/// arrowtriangle.forward.square.fill
	static let arrowtriangle_forward_square_fill = UIImage(systemName: "arrowtriangle.forward.square.fill")

	/// arrowtriangle.up
	static let arrowtriangle_up = UIImage(systemName: "arrowtriangle.up")

	/// arrowtriangle.up.fill
	static let arrowtriangle_up_fill = UIImage(systemName: "arrowtriangle.up.fill")

	/// arrowtriangle.up.circle
	static let arrowtriangle_up_circle = UIImage(systemName: "arrowtriangle.up.circle")

	/// arrowtriangle.up.circle.fill
	static let arrowtriangle_up_circle_fill = UIImage(systemName: "arrowtriangle.up.circle.fill")

	/// arrowtriangle.up.square
	static let arrowtriangle_up_square = UIImage(systemName: "arrowtriangle.up.square")

	/// arrowtriangle.up.square.fill
	static let arrowtriangle_up_square_fill = UIImage(systemName: "arrowtriangle.up.square.fill")

	/// arrowtriangle.down
	static let arrowtriangle_down = UIImage(systemName: "arrowtriangle.down")

	/// arrowtriangle.down.fill
	static let arrowtriangle_down_fill = UIImage(systemName: "arrowtriangle.down.fill")

	/// arrowtriangle.down.circle
	static let arrowtriangle_down_circle = UIImage(systemName: "arrowtriangle.down.circle")

	/// arrowtriangle.down.circle.fill
	static let arrowtriangle_down_circle_fill = UIImage(systemName: "arrowtriangle.down.circle.fill")

	/// arrowtriangle.down.square
	static let arrowtriangle_down_square = UIImage(systemName: "arrowtriangle.down.square")

	/// arrowtriangle.down.square.fill
	static let arrowtriangle_down_square_fill = UIImage(systemName: "arrowtriangle.down.square.fill")

	/// slash.circle
	static let slash_circle = UIImage(systemName: "slash.circle")

	/// slash.circle.fill
	static let slash_circle_fill = UIImage(systemName: "slash.circle.fill")

	/// asterisk
	static let asterisk = UIImage(systemName: "asterisk")

	/// asterisk.circle
	static let asterisk_circle = UIImage(systemName: "asterisk.circle")

	/// asterisk.circle.fill
	static let asterisk_circle_fill = UIImage(systemName: "asterisk.circle.fill")

	/// a.circle
	static let a_circle = UIImage(systemName: "a.circle")

	/// a.circle.fill
	static let a_circle_fill = UIImage(systemName: "a.circle.fill")

	/// a.square
	static let a_square = UIImage(systemName: "a.square")

	/// a.square.fill
	static let a_square_fill = UIImage(systemName: "a.square.fill")

	/// b.circle
	static let b_circle = UIImage(systemName: "b.circle")

	/// b.circle.fill
	static let b_circle_fill = UIImage(systemName: "b.circle.fill")

	/// b.square
	static let b_square = UIImage(systemName: "b.square")

	/// b.square.fill
	static let b_square_fill = UIImage(systemName: "b.square.fill")

	/// c.circle
	static let c_circle = UIImage(systemName: "c.circle")

	/// c.circle.fill
	static let c_circle_fill = UIImage(systemName: "c.circle.fill")

	/// c.square
	static let c_square = UIImage(systemName: "c.square")

	/// c.square.fill
	static let c_square_fill = UIImage(systemName: "c.square.fill")

	/// d.circle
	static let d_circle = UIImage(systemName: "d.circle")

	/// d.circle.fill
	static let d_circle_fill = UIImage(systemName: "d.circle.fill")

	/// d.square
	static let d_square = UIImage(systemName: "d.square")

	/// d.square.fill
	static let d_square_fill = UIImage(systemName: "d.square.fill")

	/// e.circle
	static let e_circle = UIImage(systemName: "e.circle")

	/// e.circle.fill
	static let e_circle_fill = UIImage(systemName: "e.circle.fill")

	/// e.square
	static let e_square = UIImage(systemName: "e.square")

	/// e.square.fill
	static let e_square_fill = UIImage(systemName: "e.square.fill")

	/// f.circle
	static let f_circle = UIImage(systemName: "f.circle")

	/// f.circle.fill
	static let f_circle_fill = UIImage(systemName: "f.circle.fill")

	/// f.square
	static let f_square = UIImage(systemName: "f.square")

	/// f.square.fill
	static let f_square_fill = UIImage(systemName: "f.square.fill")

	/// g.circle
	static let g_circle = UIImage(systemName: "g.circle")

	/// g.circle.fill
	static let g_circle_fill = UIImage(systemName: "g.circle.fill")

	/// g.square
	static let g_square = UIImage(systemName: "g.square")

	/// g.square.fill
	static let g_square_fill = UIImage(systemName: "g.square.fill")

	/// h.circle
	static let h_circle = UIImage(systemName: "h.circle")

	/// h.circle.fill
	static let h_circle_fill = UIImage(systemName: "h.circle.fill")

	/// h.square
	static let h_square = UIImage(systemName: "h.square")

	/// h.square.fill
	static let h_square_fill = UIImage(systemName: "h.square.fill")

	/// i.circle
	static let i_circle = UIImage(systemName: "i.circle")

	/// i.circle.fill
	static let i_circle_fill = UIImage(systemName: "i.circle.fill")

	/// i.square
	static let i_square = UIImage(systemName: "i.square")

	/// i.square.fill
	static let i_square_fill = UIImage(systemName: "i.square.fill")

	/// j.circle
	static let j_circle = UIImage(systemName: "j.circle")

	/// j.circle.fill
	static let j_circle_fill = UIImage(systemName: "j.circle.fill")

	/// j.square
	static let j_square = UIImage(systemName: "j.square")

	/// j.square.fill
	static let j_square_fill = UIImage(systemName: "j.square.fill")

	/// k.circle
	static let k_circle = UIImage(systemName: "k.circle")

	/// k.circle.fill
	static let k_circle_fill = UIImage(systemName: "k.circle.fill")

	/// k.square
	static let k_square = UIImage(systemName: "k.square")

	/// k.square.fill
	static let k_square_fill = UIImage(systemName: "k.square.fill")

	/// l.circle
	static let l_circle = UIImage(systemName: "l.circle")

	/// l.circle.fill
	static let l_circle_fill = UIImage(systemName: "l.circle.fill")

	/// l.square
	static let l_square = UIImage(systemName: "l.square")

	/// l.square.fill
	static let l_square_fill = UIImage(systemName: "l.square.fill")

	/// m.circle
	static let m_circle = UIImage(systemName: "m.circle")

	/// m.circle.fill
	static let m_circle_fill = UIImage(systemName: "m.circle.fill")

	/// m.square
	static let m_square = UIImage(systemName: "m.square")

	/// m.square.fill
	static let m_square_fill = UIImage(systemName: "m.square.fill")

	/// n.circle
	static let n_circle = UIImage(systemName: "n.circle")

	/// n.circle.fill
	static let n_circle_fill = UIImage(systemName: "n.circle.fill")

	/// n.square
	static let n_square = UIImage(systemName: "n.square")

	/// n.square.fill
	static let n_square_fill = UIImage(systemName: "n.square.fill")

	/// o.circle
	static let o_circle = UIImage(systemName: "o.circle")

	/// o.circle.fill
	static let o_circle_fill = UIImage(systemName: "o.circle.fill")

	/// o.square
	static let o_square = UIImage(systemName: "o.square")

	/// o.square.fill
	static let o_square_fill = UIImage(systemName: "o.square.fill")

	/// p.circle
	static let p_circle = UIImage(systemName: "p.circle")

	/// p.circle.fill
	static let p_circle_fill = UIImage(systemName: "p.circle.fill")

	/// p.square
	static let p_square = UIImage(systemName: "p.square")

	/// p.square.fill
	static let p_square_fill = UIImage(systemName: "p.square.fill")

	/// q.circle
	static let q_circle = UIImage(systemName: "q.circle")

	/// q.circle.fill
	static let q_circle_fill = UIImage(systemName: "q.circle.fill")

	/// q.square
	static let q_square = UIImage(systemName: "q.square")

	/// q.square.fill
	static let q_square_fill = UIImage(systemName: "q.square.fill")

	/// r.circle
	static let r_circle = UIImage(systemName: "r.circle")

	/// r.circle.fill
	static let r_circle_fill = UIImage(systemName: "r.circle.fill")

	/// r.square
	static let r_square = UIImage(systemName: "r.square")

	/// r.square.fill
	static let r_square_fill = UIImage(systemName: "r.square.fill")

	/// s.circle
	static let s_circle = UIImage(systemName: "s.circle")

	/// s.circle.fill
	static let s_circle_fill = UIImage(systemName: "s.circle.fill")

	/// s.square
	static let s_square = UIImage(systemName: "s.square")

	/// s.square.fill
	static let s_square_fill = UIImage(systemName: "s.square.fill")

	/// t.circle
	static let t_circle = UIImage(systemName: "t.circle")

	/// t.circle.fill
	static let t_circle_fill = UIImage(systemName: "t.circle.fill")

	/// t.square
	static let t_square = UIImage(systemName: "t.square")

	/// t.square.fill
	static let t_square_fill = UIImage(systemName: "t.square.fill")

	/// u.circle
	static let u_circle = UIImage(systemName: "u.circle")

	/// u.circle.fill
	static let u_circle_fill = UIImage(systemName: "u.circle.fill")

	/// u.square
	static let u_square = UIImage(systemName: "u.square")

	/// u.square.fill
	static let u_square_fill = UIImage(systemName: "u.square.fill")

	/// v.circle
	static let v_circle = UIImage(systemName: "v.circle")

	/// v.circle.fill
	static let v_circle_fill = UIImage(systemName: "v.circle.fill")

	/// v.square
	static let v_square = UIImage(systemName: "v.square")

	/// v.square.fill
	static let v_square_fill = UIImage(systemName: "v.square.fill")

	/// w.circle
	static let w_circle = UIImage(systemName: "w.circle")

	/// w.circle.fill
	static let w_circle_fill = UIImage(systemName: "w.circle.fill")

	/// w.square
	static let w_square = UIImage(systemName: "w.square")

	/// w.square.fill
	static let w_square_fill = UIImage(systemName: "w.square.fill")

	/// x.circle
	static let x_circle = UIImage(systemName: "x.circle")

	/// x.circle.fill
	static let x_circle_fill = UIImage(systemName: "x.circle.fill")

	/// x.square
	static let x_square = UIImage(systemName: "x.square")

	/// x.square.fill
	static let x_square_fill = UIImage(systemName: "x.square.fill")

	/// y.circle
	static let y_circle = UIImage(systemName: "y.circle")

	/// y.circle.fill
	static let y_circle_fill = UIImage(systemName: "y.circle.fill")

	/// y.square
	static let y_square = UIImage(systemName: "y.square")

	/// y.square.fill
	static let y_square_fill = UIImage(systemName: "y.square.fill")

	/// z.circle
	static let z_circle = UIImage(systemName: "z.circle")

	/// z.circle.fill
	static let z_circle_fill = UIImage(systemName: "z.circle.fill")

	/// z.square
	static let z_square = UIImage(systemName: "z.square")

	/// z.square.fill
	static let z_square_fill = UIImage(systemName: "z.square.fill")

	/// dollarsign.circle
	static let dollarsign_circle = UIImage(systemName: "dollarsign.circle")

	/// dollarsign.circle.fill
	static let dollarsign_circle_fill = UIImage(systemName: "dollarsign.circle.fill")

	/// dollarsign.square
	static let dollarsign_square = UIImage(systemName: "dollarsign.square")

	/// dollarsign.square.fill
	static let dollarsign_square_fill = UIImage(systemName: "dollarsign.square.fill")

	/// centsign.circle
	static let centsign_circle = UIImage(systemName: "centsign.circle")

	/// centsign.circle.fill
	static let centsign_circle_fill = UIImage(systemName: "centsign.circle.fill")

	/// centsign.square
	static let centsign_square = UIImage(systemName: "centsign.square")

	/// centsign.square.fill
	static let centsign_square_fill = UIImage(systemName: "centsign.square.fill")

	/// yensign.circle
	static let yensign_circle = UIImage(systemName: "yensign.circle")

	/// yensign.circle.fill
	static let yensign_circle_fill = UIImage(systemName: "yensign.circle.fill")

	/// yensign.square
	static let yensign_square = UIImage(systemName: "yensign.square")

	/// yensign.square.fill
	static let yensign_square_fill = UIImage(systemName: "yensign.square.fill")

	/// sterlingsign.circle
	static let sterlingsign_circle = UIImage(systemName: "sterlingsign.circle")

	/// sterlingsign.circle.fill
	static let sterlingsign_circle_fill = UIImage(systemName: "sterlingsign.circle.fill")

	/// sterlingsign.square
	static let sterlingsign_square = UIImage(systemName: "sterlingsign.square")

	/// sterlingsign.square.fill
	static let sterlingsign_square_fill = UIImage(systemName: "sterlingsign.square.fill")

	/// francsign.circle
	static let francsign_circle = UIImage(systemName: "francsign.circle")

	/// francsign.circle.fill
	static let francsign_circle_fill = UIImage(systemName: "francsign.circle.fill")

	/// francsign.square
	static let francsign_square = UIImage(systemName: "francsign.square")

	/// francsign.square.fill
	static let francsign_square_fill = UIImage(systemName: "francsign.square.fill")

	/// florinsign.circle
	static let florinsign_circle = UIImage(systemName: "florinsign.circle")

	/// florinsign.circle.fill
	static let florinsign_circle_fill = UIImage(systemName: "florinsign.circle.fill")

	/// florinsign.square
	static let florinsign_square = UIImage(systemName: "florinsign.square")

	/// florinsign.square.fill
	static let florinsign_square_fill = UIImage(systemName: "florinsign.square.fill")

	/// turkishlirasign.circle
	static let turkishlirasign_circle = UIImage(systemName: "turkishlirasign.circle")

	/// turkishlirasign.circle.fill
	static let turkishlirasign_circle_fill = UIImage(systemName: "turkishlirasign.circle.fill")

	/// turkishlirasign.square
	static let turkishlirasign_square = UIImage(systemName: "turkishlirasign.square")

	/// turkishlirasign.square.fill
	static let turkishlirasign_square_fill = UIImage(systemName: "turkishlirasign.square.fill")

	/// rublesign.circle
	static let rublesign_circle = UIImage(systemName: "rublesign.circle")

	/// rublesign.circle.fill
	static let rublesign_circle_fill = UIImage(systemName: "rublesign.circle.fill")

	/// rublesign.square
	static let rublesign_square = UIImage(systemName: "rublesign.square")

	/// rublesign.square.fill
	static let rublesign_square_fill = UIImage(systemName: "rublesign.square.fill")

	/// eurosign.circle
	static let eurosign_circle = UIImage(systemName: "eurosign.circle")

	/// eurosign.circle.fill
	static let eurosign_circle_fill = UIImage(systemName: "eurosign.circle.fill")

	/// eurosign.square
	static let eurosign_square = UIImage(systemName: "eurosign.square")

	/// eurosign.square.fill
	static let eurosign_square_fill = UIImage(systemName: "eurosign.square.fill")

	/// dongsign.circle
	static let dongsign_circle = UIImage(systemName: "dongsign.circle")

	/// dongsign.circle.fill
	static let dongsign_circle_fill = UIImage(systemName: "dongsign.circle.fill")

	/// dongsign.square
	static let dongsign_square = UIImage(systemName: "dongsign.square")

	/// dongsign.square.fill
	static let dongsign_square_fill = UIImage(systemName: "dongsign.square.fill")

	/// indianrupeesign.circle
	static let indianrupeesign_circle = UIImage(systemName: "indianrupeesign.circle")

	/// indianrupeesign.circle.fill
	static let indianrupeesign_circle_fill = UIImage(systemName: "indianrupeesign.circle.fill")

	/// indianrupeesign.square
	static let indianrupeesign_square = UIImage(systemName: "indianrupeesign.square")

	/// indianrupeesign.square.fill
	static let indianrupeesign_square_fill = UIImage(systemName: "indianrupeesign.square.fill")

	/// tengesign.circle
	static let tengesign_circle = UIImage(systemName: "tengesign.circle")

	/// tengesign.circle.fill
	static let tengesign_circle_fill = UIImage(systemName: "tengesign.circle.fill")

	/// tengesign.square
	static let tengesign_square = UIImage(systemName: "tengesign.square")

	/// tengesign.square.fill
	static let tengesign_square_fill = UIImage(systemName: "tengesign.square.fill")

	/// pesetasign.circle
	static let pesetasign_circle = UIImage(systemName: "pesetasign.circle")

	/// pesetasign.circle.fill
	static let pesetasign_circle_fill = UIImage(systemName: "pesetasign.circle.fill")

	/// pesetasign.square
	static let pesetasign_square = UIImage(systemName: "pesetasign.square")

	/// pesetasign.square.fill
	static let pesetasign_square_fill = UIImage(systemName: "pesetasign.square.fill")

	/// pesosign.circle
	static let pesosign_circle = UIImage(systemName: "pesosign.circle")

	/// pesosign.circle.fill
	static let pesosign_circle_fill = UIImage(systemName: "pesosign.circle.fill")

	/// pesosign.square
	static let pesosign_square = UIImage(systemName: "pesosign.square")

	/// pesosign.square.fill
	static let pesosign_square_fill = UIImage(systemName: "pesosign.square.fill")

	/// kipsign.circle
	static let kipsign_circle = UIImage(systemName: "kipsign.circle")

	/// kipsign.circle.fill
	static let kipsign_circle_fill = UIImage(systemName: "kipsign.circle.fill")

	/// kipsign.square
	static let kipsign_square = UIImage(systemName: "kipsign.square")

	/// kipsign.square.fill
	static let kipsign_square_fill = UIImage(systemName: "kipsign.square.fill")

	/// wonsign.circle
	static let wonsign_circle = UIImage(systemName: "wonsign.circle")

	/// wonsign.circle.fill
	static let wonsign_circle_fill = UIImage(systemName: "wonsign.circle.fill")

	/// wonsign.square
	static let wonsign_square = UIImage(systemName: "wonsign.square")

	/// wonsign.square.fill
	static let wonsign_square_fill = UIImage(systemName: "wonsign.square.fill")

	/// lirasign.circle
	static let lirasign_circle = UIImage(systemName: "lirasign.circle")

	/// lirasign.circle.fill
	static let lirasign_circle_fill = UIImage(systemName: "lirasign.circle.fill")

	/// lirasign.square
	static let lirasign_square = UIImage(systemName: "lirasign.square")

	/// lirasign.square.fill
	static let lirasign_square_fill = UIImage(systemName: "lirasign.square.fill")

	/// australsign.circle
	static let australsign_circle = UIImage(systemName: "australsign.circle")

	/// australsign.circle.fill
	static let australsign_circle_fill = UIImage(systemName: "australsign.circle.fill")

	/// australsign.square
	static let australsign_square = UIImage(systemName: "australsign.square")

	/// australsign.square.fill
	static let australsign_square_fill = UIImage(systemName: "australsign.square.fill")

	/// hryvniasign.circle
	static let hryvniasign_circle = UIImage(systemName: "hryvniasign.circle")

	/// hryvniasign.circle.fill
	static let hryvniasign_circle_fill = UIImage(systemName: "hryvniasign.circle.fill")

	/// hryvniasign.square
	static let hryvniasign_square = UIImage(systemName: "hryvniasign.square")

	/// hryvniasign.square.fill
	static let hryvniasign_square_fill = UIImage(systemName: "hryvniasign.square.fill")

	/// nairasign.circle
	static let nairasign_circle = UIImage(systemName: "nairasign.circle")

	/// nairasign.circle.fill
	static let nairasign_circle_fill = UIImage(systemName: "nairasign.circle.fill")

	/// nairasign.square
	static let nairasign_square = UIImage(systemName: "nairasign.square")

	/// nairasign.square.fill
	static let nairasign_square_fill = UIImage(systemName: "nairasign.square.fill")

	/// guaranisign.circle
	static let guaranisign_circle = UIImage(systemName: "guaranisign.circle")

	/// guaranisign.circle.fill
	static let guaranisign_circle_fill = UIImage(systemName: "guaranisign.circle.fill")

	/// guaranisign.square
	static let guaranisign_square = UIImage(systemName: "guaranisign.square")

	/// guaranisign.square.fill
	static let guaranisign_square_fill = UIImage(systemName: "guaranisign.square.fill")

	/// coloncurrencysign.circle
	static let coloncurrencysign_circle = UIImage(systemName: "coloncurrencysign.circle")

	/// coloncurrencysign.circle.fill
	static let coloncurrencysign_circle_fill = UIImage(systemName: "coloncurrencysign.circle.fill")

	/// coloncurrencysign.square
	static let coloncurrencysign_square = UIImage(systemName: "coloncurrencysign.square")

	/// coloncurrencysign.square.fill
	static let coloncurrencysign_square_fill = UIImage(systemName: "coloncurrencysign.square.fill")

	/// cedisign.circle
	static let cedisign_circle = UIImage(systemName: "cedisign.circle")

	/// cedisign.circle.fill
	static let cedisign_circle_fill = UIImage(systemName: "cedisign.circle.fill")

	/// cedisign.square
	static let cedisign_square = UIImage(systemName: "cedisign.square")

	/// cedisign.square.fill
	static let cedisign_square_fill = UIImage(systemName: "cedisign.square.fill")

	/// cruzeirosign.circle
	static let cruzeirosign_circle = UIImage(systemName: "cruzeirosign.circle")

	/// cruzeirosign.circle.fill
	static let cruzeirosign_circle_fill = UIImage(systemName: "cruzeirosign.circle.fill")

	/// cruzeirosign.square
	static let cruzeirosign_square = UIImage(systemName: "cruzeirosign.square")

	/// cruzeirosign.square.fill
	static let cruzeirosign_square_fill = UIImage(systemName: "cruzeirosign.square.fill")

	/// tugriksign.circle
	static let tugriksign_circle = UIImage(systemName: "tugriksign.circle")

	/// tugriksign.circle.fill
	static let tugriksign_circle_fill = UIImage(systemName: "tugriksign.circle.fill")

	/// tugriksign.square
	static let tugriksign_square = UIImage(systemName: "tugriksign.square")

	/// tugriksign.square.fill
	static let tugriksign_square_fill = UIImage(systemName: "tugriksign.square.fill")

	/// millsign.circle
	static let millsign_circle = UIImage(systemName: "millsign.circle")

	/// millsign.circle.fill
	static let millsign_circle_fill = UIImage(systemName: "millsign.circle.fill")

	/// millsign.square
	static let millsign_square = UIImage(systemName: "millsign.square")

	/// millsign.square.fill
	static let millsign_square_fill = UIImage(systemName: "millsign.square.fill")

	/// shekelsign.circle
	static let shekelsign_circle = UIImage(systemName: "shekelsign.circle")

	/// shekelsign.circle.fill
	static let shekelsign_circle_fill = UIImage(systemName: "shekelsign.circle.fill")

	/// shekelsign.square
	static let shekelsign_square = UIImage(systemName: "shekelsign.square")

	/// shekelsign.square.fill
	static let shekelsign_square_fill = UIImage(systemName: "shekelsign.square.fill")

	/// manatsign.circle
	static let manatsign_circle = UIImage(systemName: "manatsign.circle")

	/// manatsign.circle.fill
	static let manatsign_circle_fill = UIImage(systemName: "manatsign.circle.fill")

	/// manatsign.square
	static let manatsign_square = UIImage(systemName: "manatsign.square")

	/// manatsign.square.fill
	static let manatsign_square_fill = UIImage(systemName: "manatsign.square.fill")

	/// rupeesign.circle
	static let rupeesign_circle = UIImage(systemName: "rupeesign.circle")

	/// rupeesign.circle.fill
	static let rupeesign_circle_fill = UIImage(systemName: "rupeesign.circle.fill")

	/// rupeesign.square
	static let rupeesign_square = UIImage(systemName: "rupeesign.square")

	/// rupeesign.square.fill
	static let rupeesign_square_fill = UIImage(systemName: "rupeesign.square.fill")

	/// bahtsign.circle
	static let bahtsign_circle = UIImage(systemName: "bahtsign.circle")

	/// bahtsign.circle.fill
	static let bahtsign_circle_fill = UIImage(systemName: "bahtsign.circle.fill")

	/// bahtsign.square
	static let bahtsign_square = UIImage(systemName: "bahtsign.square")

	/// bahtsign.square.fill
	static let bahtsign_square_fill = UIImage(systemName: "bahtsign.square.fill")

	/// larisign.circle
	static let larisign_circle = UIImage(systemName: "larisign.circle")

	/// larisign.circle.fill
	static let larisign_circle_fill = UIImage(systemName: "larisign.circle.fill")

	/// larisign.square
	static let larisign_square = UIImage(systemName: "larisign.square")

	/// larisign.square.fill
	static let larisign_square_fill = UIImage(systemName: "larisign.square.fill")

	/// bitcoinsign.circle
	static let bitcoinsign_circle = UIImage(systemName: "bitcoinsign.circle")

	/// bitcoinsign.circle.fill
	static let bitcoinsign_circle_fill = UIImage(systemName: "bitcoinsign.circle.fill")

	/// bitcoinsign.square
	static let bitcoinsign_square = UIImage(systemName: "bitcoinsign.square")

	/// bitcoinsign.square.fill
	static let bitcoinsign_square_fill = UIImage(systemName: "bitcoinsign.square.fill")

	/// brazilianrealsign.circle
	static let brazilianrealsign_circle = UIImage(systemName: "brazilianrealsign.circle")

	/// brazilianrealsign.circle.fill
	static let brazilianrealsign_circle_fill = UIImage(systemName: "brazilianrealsign.circle.fill")

	/// brazilianrealsign.square
	static let brazilianrealsign_square = UIImage(systemName: "brazilianrealsign.square")

	/// brazilianrealsign.square.fill
	static let brazilianrealsign_square_fill = UIImage(systemName: "brazilianrealsign.square.fill")

	/// 0.circle
	static let circle_0 = UIImage(systemName: "0.circle")

	/// 0.circle.fill
	static let circle_fill_0 = UIImage(systemName: "0.circle.fill")

	/// 0.square
	static let square_0 = UIImage(systemName: "0.square")

	/// 0.square.fill
	static let square_fill_0 = UIImage(systemName: "0.square.fill")

	/// 1.circle
	static let circle_1 = UIImage(systemName: "1.circle")

	/// 1.circle.fill
	static let circle_fill_1 = UIImage(systemName: "1.circle.fill")

	/// 1.square
	static let square_1 = UIImage(systemName: "1.square")

	/// 1.square.fill
	static let square_fill_1 = UIImage(systemName: "1.square.fill")

	/// 2.circle
	static let circle_2 = UIImage(systemName: "2.circle")

	/// 2.circle.fill
	static let circle_fill_2 = UIImage(systemName: "2.circle.fill")

	/// 2.square
	static let square_2 = UIImage(systemName: "2.square")

	/// 2.square.fill
	static let square_fill_2 = UIImage(systemName: "2.square.fill")

	/// 3.circle
	static let circle_3 = UIImage(systemName: "3.circle")

	/// 3.circle.fill
	static let circle_fill_3 = UIImage(systemName: "3.circle.fill")

	/// 3.square
	static let square_3 = UIImage(systemName: "3.square")

	/// 3.square.fill
	static let square_fill_3 = UIImage(systemName: "3.square.fill")

	/// 4.circle
	static let circle_4 = UIImage(systemName: "4.circle")

	/// 4.circle.fill
	static let circle_fill_4 = UIImage(systemName: "4.circle.fill")

	/// 4.square
	static let square_4 = UIImage(systemName: "4.square")

	/// 4.square.fill
	static let square_fill_4 = UIImage(systemName: "4.square.fill")

	/// 4.alt.circle
	static let alt_circle_4 = UIImage(systemName: "4.alt.circle")

	/// 4.alt.circle.fill
	static let alt_circle_fill_4 = UIImage(systemName: "4.alt.circle.fill")

	/// 4.alt.square
	static let alt_square_4 = UIImage(systemName: "4.alt.square")

	/// 4.alt.square.fill
	static let alt_square_fill_4 = UIImage(systemName: "4.alt.square.fill")

	/// 5.circle
	static let circle_5 = UIImage(systemName: "5.circle")

	/// 5.circle.fill
	static let circle_fill_5 = UIImage(systemName: "5.circle.fill")

	/// 5.square
	static let square_5 = UIImage(systemName: "5.square")

	/// 5.square.fill
	static let square_fill_5 = UIImage(systemName: "5.square.fill")

	/// 6.circle
	static let circle_6 = UIImage(systemName: "6.circle")

	/// 6.circle.fill
	static let circle_fill_6 = UIImage(systemName: "6.circle.fill")

	/// 6.square
	static let square_6 = UIImage(systemName: "6.square")

	/// 6.square.fill
	static let square_fill_6 = UIImage(systemName: "6.square.fill")

	/// 6.alt.circle
	static let alt_circle_6 = UIImage(systemName: "6.alt.circle")

	/// 6.alt.circle.fill
	static let alt_circle_fill_6 = UIImage(systemName: "6.alt.circle.fill")

	/// 6.alt.square
	static let alt_square_6 = UIImage(systemName: "6.alt.square")

	/// 6.alt.square.fill
	static let alt_square_fill_6 = UIImage(systemName: "6.alt.square.fill")

	/// 7.circle
	static let circle_7 = UIImage(systemName: "7.circle")

	/// 7.circle.fill
	static let circle_fill_7 = UIImage(systemName: "7.circle.fill")

	/// 7.square
	static let square_7 = UIImage(systemName: "7.square")

	/// 7.square.fill
	static let square_fill_7 = UIImage(systemName: "7.square.fill")

	/// 8.circle
	static let circle_8 = UIImage(systemName: "8.circle")

	/// 8.circle.fill
	static let circle_fill_8 = UIImage(systemName: "8.circle.fill")

	/// 8.square
	static let square_8 = UIImage(systemName: "8.square")

	/// 8.square.fill
	static let square_fill_8 = UIImage(systemName: "8.square.fill")

	/// 9.circle
	static let circle_9 = UIImage(systemName: "9.circle")

	/// 9.circle.fill
	static let circle_fill_9 = UIImage(systemName: "9.circle.fill")

	/// 9.square
	static let square_9 = UIImage(systemName: "9.square")

	/// 9.square.fill
	static let square_fill_9 = UIImage(systemName: "9.square.fill")

	/// 9.alt.circle
	static let alt_circle_9 = UIImage(systemName: "9.alt.circle")

	/// 9.alt.circle.fill
	static let alt_circle_fill_9 = UIImage(systemName: "9.alt.circle.fill")

	/// 9.alt.square
	static let alt_square_9 = UIImage(systemName: "9.alt.square")

	/// 9.alt.square.fill
	static let alt_square_fill_9 = UIImage(systemName: "9.alt.square.fill")

	/// 00.circle
	static let circle_00 = UIImage(systemName: "00.circle")

	/// 00.circle.fill
	static let circle_fill_00 = UIImage(systemName: "00.circle.fill")

	/// 00.square
	static let square_00 = UIImage(systemName: "00.square")

	/// 00.square.fill
	static let square_fill_00 = UIImage(systemName: "00.square.fill")

	/// 01.circle
	static let circle_01 = UIImage(systemName: "01.circle")

	/// 01.circle.fill
	static let circle_fill_01 = UIImage(systemName: "01.circle.fill")

	/// 01.square
	static let square_01 = UIImage(systemName: "01.square")

	/// 01.square.fill
	static let square_fill_01 = UIImage(systemName: "01.square.fill")

	/// 02.circle
	static let circle_02 = UIImage(systemName: "02.circle")

	/// 02.circle.fill
	static let circle_fill_02 = UIImage(systemName: "02.circle.fill")

	/// 02.square
	static let square_02 = UIImage(systemName: "02.square")

	/// 02.square.fill
	static let square_fill_02 = UIImage(systemName: "02.square.fill")

	/// 03.circle
	static let circle_03 = UIImage(systemName: "03.circle")

	/// 03.circle.fill
	static let circle_fill_03 = UIImage(systemName: "03.circle.fill")

	/// 03.square
	static let square_03 = UIImage(systemName: "03.square")

	/// 03.square.fill
	static let square_fill_03 = UIImage(systemName: "03.square.fill")

	/// 04.circle
	static let circle_04 = UIImage(systemName: "04.circle")

	/// 04.circle.fill
	static let circle_fill_04 = UIImage(systemName: "04.circle.fill")

	/// 04.square
	static let square_04 = UIImage(systemName: "04.square")

	/// 04.square.fill
	static let square_fill_04 = UIImage(systemName: "04.square.fill")

	/// 05.circle
	static let circle_05 = UIImage(systemName: "05.circle")

	/// 05.circle.fill
	static let circle_fill_05 = UIImage(systemName: "05.circle.fill")

	/// 05.square
	static let square_05 = UIImage(systemName: "05.square")

	/// 05.square.fill
	static let square_fill_05 = UIImage(systemName: "05.square.fill")

	/// 06.circle
	static let circle_06 = UIImage(systemName: "06.circle")

	/// 06.circle.fill
	static let circle_fill_06 = UIImage(systemName: "06.circle.fill")

	/// 06.square
	static let square_06 = UIImage(systemName: "06.square")

	/// 06.square.fill
	static let square_fill_06 = UIImage(systemName: "06.square.fill")

	/// 07.circle
	static let circle_07 = UIImage(systemName: "07.circle")

	/// 07.circle.fill
	static let circle_fill_07 = UIImage(systemName: "07.circle.fill")

	/// 07.square
	static let square_07 = UIImage(systemName: "07.square")

	/// 07.square.fill
	static let square_fill_07 = UIImage(systemName: "07.square.fill")

	/// 08.circle
	static let circle_08 = UIImage(systemName: "08.circle")

	/// 08.circle.fill
	static let circle_fill_08 = UIImage(systemName: "08.circle.fill")

	/// 08.square
	static let square_08 = UIImage(systemName: "08.square")

	/// 08.square.fill
	static let square_fill_08 = UIImage(systemName: "08.square.fill")

	/// 09.circle
	static let circle_09 = UIImage(systemName: "09.circle")

	/// 09.circle.fill
	static let circle_fill_09 = UIImage(systemName: "09.circle.fill")

	/// 09.square
	static let square_09 = UIImage(systemName: "09.square")

	/// 09.square.fill
	static let square_fill_09 = UIImage(systemName: "09.square.fill")

	/// 10.circle
	static let circle_10 = UIImage(systemName: "10.circle")

	/// 10.circle.fill
	static let circle_fill_10 = UIImage(systemName: "10.circle.fill")

	/// 10.square
	static let square_10 = UIImage(systemName: "10.square")

	/// 10.square.fill
	static let square_fill_10 = UIImage(systemName: "10.square.fill")

	/// 11.circle
	static let circle_11 = UIImage(systemName: "11.circle")

	/// 11.circle.fill
	static let circle_fill_11 = UIImage(systemName: "11.circle.fill")

	/// 11.square
	static let square_11 = UIImage(systemName: "11.square")

	/// 11.square.fill
	static let square_fill_11 = UIImage(systemName: "11.square.fill")

	/// 12.circle
	static let circle_12 = UIImage(systemName: "12.circle")

	/// 12.circle.fill
	static let circle_fill_12 = UIImage(systemName: "12.circle.fill")

	/// 12.square
	static let square_12 = UIImage(systemName: "12.square")

	/// 12.square.fill
	static let square_fill_12 = UIImage(systemName: "12.square.fill")

	/// 13.circle
	static let circle_13 = UIImage(systemName: "13.circle")

	/// 13.circle.fill
	static let circle_fill_13 = UIImage(systemName: "13.circle.fill")

	/// 13.square
	static let square_13 = UIImage(systemName: "13.square")

	/// 13.square.fill
	static let square_fill_13 = UIImage(systemName: "13.square.fill")

	/// 14.circle
	static let circle_14 = UIImage(systemName: "14.circle")

	/// 14.circle.fill
	static let circle_fill_14 = UIImage(systemName: "14.circle.fill")

	/// 14.square
	static let square_14 = UIImage(systemName: "14.square")

	/// 14.square.fill
	static let square_fill_14 = UIImage(systemName: "14.square.fill")

	/// 15.circle
	static let circle_15 = UIImage(systemName: "15.circle")

	/// 15.circle.fill
	static let circle_fill_15 = UIImage(systemName: "15.circle.fill")

	/// 15.square
	static let square_15 = UIImage(systemName: "15.square")

	/// 15.square.fill
	static let square_fill_15 = UIImage(systemName: "15.square.fill")

	/// 16.circle
	static let circle_16 = UIImage(systemName: "16.circle")

	/// 16.circle.fill
	static let circle_fill_16 = UIImage(systemName: "16.circle.fill")

	/// 16.square
	static let square_16 = UIImage(systemName: "16.square")

	/// 16.square.fill
	static let square_fill_16 = UIImage(systemName: "16.square.fill")

	/// 17.circle
	static let circle_17 = UIImage(systemName: "17.circle")

	/// 17.circle.fill
	static let circle_fill_17 = UIImage(systemName: "17.circle.fill")

	/// 17.square
	static let square_17 = UIImage(systemName: "17.square")

	/// 17.square.fill
	static let square_fill_17 = UIImage(systemName: "17.square.fill")

	/// 18.circle
	static let circle_18 = UIImage(systemName: "18.circle")

	/// 18.circle.fill
	static let circle_fill_18 = UIImage(systemName: "18.circle.fill")

	/// 18.square
	static let square_18 = UIImage(systemName: "18.square")

	/// 18.square.fill
	static let square_fill_18 = UIImage(systemName: "18.square.fill")

	/// 19.circle
	static let circle_19 = UIImage(systemName: "19.circle")

	/// 19.circle.fill
	static let circle_fill_19 = UIImage(systemName: "19.circle.fill")

	/// 19.square
	static let square_19 = UIImage(systemName: "19.square")

	/// 19.square.fill
	static let square_fill_19 = UIImage(systemName: "19.square.fill")

	/// 20.circle
	static let circle_20 = UIImage(systemName: "20.circle")

	/// 20.circle.fill
	static let circle_fill_20 = UIImage(systemName: "20.circle.fill")

	/// 20.square
	static let square_20 = UIImage(systemName: "20.square")

	/// 20.square.fill
	static let square_fill_20 = UIImage(systemName: "20.square.fill")

	/// 21.circle
	static let circle_21 = UIImage(systemName: "21.circle")

	/// 21.circle.fill
	static let circle_fill_21 = UIImage(systemName: "21.circle.fill")

	/// 21.square
	static let square_21 = UIImage(systemName: "21.square")

	/// 21.square.fill
	static let square_fill_21 = UIImage(systemName: "21.square.fill")

	/// 22.circle
	static let circle_22 = UIImage(systemName: "22.circle")

	/// 22.circle.fill
	static let circle_fill_22 = UIImage(systemName: "22.circle.fill")

	/// 22.square
	static let square_22 = UIImage(systemName: "22.square")

	/// 22.square.fill
	static let square_fill_22 = UIImage(systemName: "22.square.fill")

	/// 23.circle
	static let circle_23 = UIImage(systemName: "23.circle")

	/// 23.circle.fill
	static let circle_fill_23 = UIImage(systemName: "23.circle.fill")

	/// 23.square
	static let square_23 = UIImage(systemName: "23.square")

	/// 23.square.fill
	static let square_fill_23 = UIImage(systemName: "23.square.fill")

	/// 24.circle
	static let circle_24 = UIImage(systemName: "24.circle")

	/// 24.circle.fill
	static let circle_fill_24 = UIImage(systemName: "24.circle.fill")

	/// 24.square
	static let square_24 = UIImage(systemName: "24.square")

	/// 24.square.fill
	static let square_fill_24 = UIImage(systemName: "24.square.fill")

	/// 25.circle
	static let circle_25 = UIImage(systemName: "25.circle")

	/// 25.circle.fill
	static let circle_fill_25 = UIImage(systemName: "25.circle.fill")

	/// 25.square
	static let square_25 = UIImage(systemName: "25.square")

	/// 25.square.fill
	static let square_fill_25 = UIImage(systemName: "25.square.fill")

	/// 26.circle
	static let circle_26 = UIImage(systemName: "26.circle")

	/// 26.circle.fill
	static let circle_fill_26 = UIImage(systemName: "26.circle.fill")

	/// 26.square
	static let square_26 = UIImage(systemName: "26.square")

	/// 26.square.fill
	static let square_fill_26 = UIImage(systemName: "26.square.fill")

	/// 27.circle
	static let circle_27 = UIImage(systemName: "27.circle")

	/// 27.circle.fill
	static let circle_fill_27 = UIImage(systemName: "27.circle.fill")

	/// 27.square
	static let square_27 = UIImage(systemName: "27.square")

	/// 27.square.fill
	static let square_fill_27 = UIImage(systemName: "27.square.fill")

	/// 28.circle
	static let circle_28 = UIImage(systemName: "28.circle")

	/// 28.circle.fill
	static let circle_fill_28 = UIImage(systemName: "28.circle.fill")

	/// 28.square
	static let square_28 = UIImage(systemName: "28.square")

	/// 28.square.fill
	static let square_fill_28 = UIImage(systemName: "28.square.fill")

	/// 29.circle
	static let circle_29 = UIImage(systemName: "29.circle")

	/// 29.circle.fill
	static let circle_fill_29 = UIImage(systemName: "29.circle.fill")

	/// 29.square
	static let square_29 = UIImage(systemName: "29.square")

	/// 29.square.fill
	static let square_fill_29 = UIImage(systemName: "29.square.fill")

	/// 30.circle
	static let circle_30 = UIImage(systemName: "30.circle")

	/// 30.circle.fill
	static let circle_fill_30 = UIImage(systemName: "30.circle.fill")

	/// 30.square
	static let square_30 = UIImage(systemName: "30.square")

	/// 30.square.fill
	static let square_fill_30 = UIImage(systemName: "30.square.fill")

	/// 31.circle
	static let circle_31 = UIImage(systemName: "31.circle")

	/// 31.circle.fill
	static let circle_fill_31 = UIImage(systemName: "31.circle.fill")

	/// 31.square
	static let square_31 = UIImage(systemName: "31.square")

	/// 31.square.fill
	static let square_fill_31 = UIImage(systemName: "31.square.fill")

	/// 32.circle
	static let circle_32 = UIImage(systemName: "32.circle")

	/// 32.circle.fill
	static let circle_fill_32 = UIImage(systemName: "32.circle.fill")

	/// 32.square
	static let square_32 = UIImage(systemName: "32.square")

	/// 32.square.fill
	static let square_fill_32 = UIImage(systemName: "32.square.fill")

	/// 33.circle
	static let circle_33 = UIImage(systemName: "33.circle")

	/// 33.circle.fill
	static let circle_fill_33 = UIImage(systemName: "33.circle.fill")

	/// 33.square
	static let square_33 = UIImage(systemName: "33.square")

	/// 33.square.fill
	static let square_fill_33 = UIImage(systemName: "33.square.fill")

	/// 34.circle
	static let circle_34 = UIImage(systemName: "34.circle")

	/// 34.circle.fill
	static let circle_fill_34 = UIImage(systemName: "34.circle.fill")

	/// 34.square
	static let square_34 = UIImage(systemName: "34.square")

	/// 34.square.fill
	static let square_fill_34 = UIImage(systemName: "34.square.fill")

	/// 35.circle
	static let circle_35 = UIImage(systemName: "35.circle")

	/// 35.circle.fill
	static let circle_fill_35 = UIImage(systemName: "35.circle.fill")

	/// 35.square
	static let square_35 = UIImage(systemName: "35.square")

	/// 35.square.fill
	static let square_fill_35 = UIImage(systemName: "35.square.fill")

	/// 36.circle
	static let circle_36 = UIImage(systemName: "36.circle")

	/// 36.circle.fill
	static let circle_fill_36 = UIImage(systemName: "36.circle.fill")

	/// 36.square
	static let square_36 = UIImage(systemName: "36.square")

	/// 36.square.fill
	static let square_fill_36 = UIImage(systemName: "36.square.fill")

	/// 37.circle
	static let circle_37 = UIImage(systemName: "37.circle")

	/// 37.circle.fill
	static let circle_fill_37 = UIImage(systemName: "37.circle.fill")

	/// 37.square
	static let square_37 = UIImage(systemName: "37.square")

	/// 37.square.fill
	static let square_fill_37 = UIImage(systemName: "37.square.fill")

	/// 38.circle
	static let circle_38 = UIImage(systemName: "38.circle")

	/// 38.circle.fill
	static let circle_fill_38 = UIImage(systemName: "38.circle.fill")

	/// 38.square
	static let square_38 = UIImage(systemName: "38.square")

	/// 38.square.fill
	static let square_fill_38 = UIImage(systemName: "38.square.fill")

	/// 39.circle
	static let circle_39 = UIImage(systemName: "39.circle")

	/// 39.circle.fill
	static let circle_fill_39 = UIImage(systemName: "39.circle.fill")

	/// 39.square
	static let square_39 = UIImage(systemName: "39.square")

	/// 39.square.fill
	static let square_fill_39 = UIImage(systemName: "39.square.fill")

	/// 40.circle
	static let circle_40 = UIImage(systemName: "40.circle")

	/// 40.circle.fill
	static let circle_fill_40 = UIImage(systemName: "40.circle.fill")

	/// 40.square
	static let square_40 = UIImage(systemName: "40.square")

	/// 40.square.fill
	static let square_fill_40 = UIImage(systemName: "40.square.fill")

	/// 41.circle
	static let circle_41 = UIImage(systemName: "41.circle")

	/// 41.circle.fill
	static let circle_fill_41 = UIImage(systemName: "41.circle.fill")

	/// 41.square
	static let square_41 = UIImage(systemName: "41.square")

	/// 41.square.fill
	static let square_fill_41 = UIImage(systemName: "41.square.fill")

	/// 42.circle
	static let circle_42 = UIImage(systemName: "42.circle")

	/// 42.circle.fill
	static let circle_fill_42 = UIImage(systemName: "42.circle.fill")

	/// 42.square
	static let square_42 = UIImage(systemName: "42.square")

	/// 42.square.fill
	static let square_fill_42 = UIImage(systemName: "42.square.fill")

	/// 43.circle
	static let circle_43 = UIImage(systemName: "43.circle")

	/// 43.circle.fill
	static let circle_fill_43 = UIImage(systemName: "43.circle.fill")

	/// 43.square
	static let square_43 = UIImage(systemName: "43.square")

	/// 43.square.fill
	static let square_fill_43 = UIImage(systemName: "43.square.fill")

	/// 44.circle
	static let circle_44 = UIImage(systemName: "44.circle")

	/// 44.circle.fill
	static let circle_fill_44 = UIImage(systemName: "44.circle.fill")

	/// 44.square
	static let square_44 = UIImage(systemName: "44.square")

	/// 44.square.fill
	static let square_fill_44 = UIImage(systemName: "44.square.fill")

	/// 45.circle
	static let circle_45 = UIImage(systemName: "45.circle")

	/// 45.circle.fill
	static let circle_fill_45 = UIImage(systemName: "45.circle.fill")

	/// 45.square
	static let square_45 = UIImage(systemName: "45.square")

	/// 45.square.fill
	static let square_fill_45 = UIImage(systemName: "45.square.fill")

	/// 46.circle
	static let circle_46 = UIImage(systemName: "46.circle")

	/// 46.circle.fill
	static let circle_fill_46 = UIImage(systemName: "46.circle.fill")

	/// 46.square
	static let square_46 = UIImage(systemName: "46.square")

	/// 46.square.fill
	static let square_fill_46 = UIImage(systemName: "46.square.fill")

	/// 47.circle
	static let circle_47 = UIImage(systemName: "47.circle")

	/// 47.circle.fill
	static let circle_fill_47 = UIImage(systemName: "47.circle.fill")

	/// 47.square
	static let square_47 = UIImage(systemName: "47.square")

	/// 47.square.fill
	static let square_fill_47 = UIImage(systemName: "47.square.fill")

	/// 48.circle
	static let circle_48 = UIImage(systemName: "48.circle")

	/// 48.circle.fill
	static let circle_fill_48 = UIImage(systemName: "48.circle.fill")

	/// 48.square
	static let square_48 = UIImage(systemName: "48.square")

	/// 48.square.fill
	static let square_fill_48 = UIImage(systemName: "48.square.fill")

	/// 49.circle
	static let circle_49 = UIImage(systemName: "49.circle")

	/// 49.circle.fill
	static let circle_fill_49 = UIImage(systemName: "49.circle.fill")

	/// 49.square
	static let square_49 = UIImage(systemName: "49.square")

	/// 49.square.fill
	static let square_fill_49 = UIImage(systemName: "49.square.fill")

	/// 50.circle
	static let circle_50 = UIImage(systemName: "50.circle")

	/// 50.circle.fill
	static let circle_fill_50 = UIImage(systemName: "50.circle.fill")

	/// 50.square
	static let square_50 = UIImage(systemName: "50.square")

	/// 50.square.fill
	static let square_fill_50 = UIImage(systemName: "50.square.fill")

	/// applelogo
	static let applelogo = UIImage(systemName: "applelogo")

}
