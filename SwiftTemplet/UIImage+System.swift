//
//  UIImage+System.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/18.
//  Copyright © 2021 BN. All rights reserved.
//


//@objc public extension UIImage{
//
//    var assetName: String? {
//        guard let imageAsset = imageAsset else { return nil }
//        return imageAsset.value(forKey:"assetName") as? String
//    }
//}


@available(iOS 13.0, *)
@objc public extension UIImage{
	/// square.and.arrow.up
	static var square_and_arrow_up: UIImage? {
		return UIImage(systemName: "square.and.arrow.up")
	}

	/// square.and.arrow.up.fill
	static var square_and_arrow_up_fill: UIImage? {
		return UIImage(systemName: "square.and.arrow.up.fill")
	}

	/// square.and.arrow.up.trianglebadge.exclamationmark
	static var square_and_arrow_up_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
	}

	/// square.and.arrow.down
	static var square_and_arrow_down: UIImage? {
		return UIImage(systemName: "square.and.arrow.down")
	}

	/// square.and.arrow.down.fill
	static var square_and_arrow_down_fill: UIImage? {
		return UIImage(systemName: "square.and.arrow.down.fill")
	}

	/// square.and.arrow.up.on.square
	static var square_and_arrow_up_on_square: UIImage? {
		return UIImage(systemName: "square.and.arrow.up.on.square")
	}

	/// square.and.arrow.up.on.square.fill
	static var square_and_arrow_up_on_square_fill: UIImage? {
		return UIImage(systemName: "square.and.arrow.up.on.square.fill")
	}

	/// square.and.arrow.down.on.square
	static var square_and_arrow_down_on_square: UIImage? {
		return UIImage(systemName: "square.and.arrow.down.on.square")
	}

	/// square.and.arrow.down.on.square.fill
	static var square_and_arrow_down_on_square_fill: UIImage? {
		return UIImage(systemName: "square.and.arrow.down.on.square.fill")
	}

	/// rectangle.portrait.and.arrow.right
	static var rectangle_portrait_and_arrow_right: UIImage? {
		return UIImage(systemName: "rectangle.portrait.and.arrow.right")
	}

	/// rectangle.portrait.and.arrow.right.fill
	static var rectangle_portrait_and_arrow_right_fill: UIImage? {
		return UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")
	}

	/// pencil
	static var pencil: UIImage? {
		return UIImage(systemName: "pencil")
	}

	/// pencil.circle
	static var pencil_circle: UIImage? {
		return UIImage(systemName: "pencil.circle")
	}

	/// pencil.circle.fill
	static var pencil_circle_fill: UIImage? {
		return UIImage(systemName: "pencil.circle.fill")
	}

	/// pencil.slash
	static var pencil_slash: UIImage? {
		return UIImage(systemName: "pencil.slash")
	}

	/// square.and.pencil
	static var square_and_pencil: UIImage? {
		return UIImage(systemName: "square.and.pencil")
	}

	/// rectangle.and.pencil.and.ellipsis
	static var rectangle_and_pencil_and_ellipsis: UIImage? {
		return UIImage(systemName: "rectangle.and.pencil.and.ellipsis")
	}

	/// scribble
	static var scribble: UIImage? {
		return UIImage(systemName: "scribble")
	}

	/// scribble.variable
	static var scribble_variable: UIImage? {
		return UIImage(systemName: "scribble.variable")
	}

	/// highlighter
	static var highlighter: UIImage? {
		return UIImage(systemName: "highlighter")
	}

	/// pencil.and.outline
	static var pencil_and_outline: UIImage? {
		return UIImage(systemName: "pencil.and.outline")
	}

	/// pencil.tip
	static var pencil_tip: UIImage? {
		return UIImage(systemName: "pencil.tip")
	}

	/// pencil.tip.crop.circle
	static var pencil_tip_crop_circle: UIImage? {
		return UIImage(systemName: "pencil.tip.crop.circle")
	}

	/// pencil.tip.crop.circle.badge.plus
	static var pencil_tip_crop_circle_badge_plus: UIImage? {
		return UIImage(systemName: "pencil.tip.crop.circle.badge.plus")
	}

	/// pencil.tip.crop.circle.badge.minus
	static var pencil_tip_crop_circle_badge_minus: UIImage? {
		return UIImage(systemName: "pencil.tip.crop.circle.badge.minus")
	}

	/// pencil.tip.crop.circle.badge.arrow.forward
	static var pencil_tip_crop_circle_badge_arrow_forward: UIImage? {
		return UIImage(systemName: "pencil.tip.crop.circle.badge.arrow.forward")
	}

	/// lasso
	static var lasso: UIImage? {
		return UIImage(systemName: "lasso")
	}

	/// lasso.and.sparkles
	static var lasso_and_sparkles: UIImage? {
		return UIImage(systemName: "lasso.and.sparkles")
	}

	/// trash
	static var trash: UIImage? {
		return UIImage(systemName: "trash")
	}

	/// trash.fill
	static var trash_fill: UIImage? {
		return UIImage(systemName: "trash.fill")
	}

	/// trash.circle
	static var trash_circle: UIImage? {
		return UIImage(systemName: "trash.circle")
	}

	/// trash.circle.fill
	static var trash_circle_fill: UIImage? {
		return UIImage(systemName: "trash.circle.fill")
	}

	/// trash.square
	static var trash_square: UIImage? {
		return UIImage(systemName: "trash.square")
	}

	/// trash.square.fill
	static var trash_square_fill: UIImage? {
		return UIImage(systemName: "trash.square.fill")
	}

	/// trash.slash
	static var trash_slash: UIImage? {
		return UIImage(systemName: "trash.slash")
	}

	/// trash.slash.fill
	static var trash_slash_fill: UIImage? {
		return UIImage(systemName: "trash.slash.fill")
	}

	/// trash.slash.circle
	static var trash_slash_circle: UIImage? {
		return UIImage(systemName: "trash.slash.circle")
	}

	/// trash.slash.circle.fill
	static var trash_slash_circle_fill: UIImage? {
		return UIImage(systemName: "trash.slash.circle.fill")
	}

	/// trash.slash.square
	static var trash_slash_square: UIImage? {
		return UIImage(systemName: "trash.slash.square")
	}

	/// trash.slash.square.fill
	static var trash_slash_square_fill: UIImage? {
		return UIImage(systemName: "trash.slash.square.fill")
	}

	/// folder
	static var folder: UIImage? {
		return UIImage(systemName: "folder")
	}

	/// folder.fill
	static var folder_fill: UIImage? {
		return UIImage(systemName: "folder.fill")
	}

	/// folder.circle
	static var folder_circle: UIImage? {
		return UIImage(systemName: "folder.circle")
	}

	/// folder.circle.fill
	static var folder_circle_fill: UIImage? {
		return UIImage(systemName: "folder.circle.fill")
	}

	/// folder.badge.plus
	static var folder_badge_plus: UIImage? {
		return UIImage(systemName: "folder.badge.plus")
	}

	/// folder.fill.badge.plus
	static var folder_fill_badge_plus: UIImage? {
		return UIImage(systemName: "folder.fill.badge.plus")
	}

	/// folder.badge.minus
	static var folder_badge_minus: UIImage? {
		return UIImage(systemName: "folder.badge.minus")
	}

	/// folder.fill.badge.minus
	static var folder_fill_badge_minus: UIImage? {
		return UIImage(systemName: "folder.fill.badge.minus")
	}

	/// folder.badge.questionmark
	static var folder_badge_questionmark: UIImage? {
		return UIImage(systemName: "folder.badge.questionmark")
	}

	/// folder.fill.badge.questionmark
	static var folder_fill_badge_questionmark: UIImage? {
		return UIImage(systemName: "folder.fill.badge.questionmark")
	}

	/// folder.badge.person.crop
	static var folder_badge_person_crop: UIImage? {
		return UIImage(systemName: "folder.badge.person.crop")
	}

	/// folder.fill.badge.person.crop
	static var folder_fill_badge_person_crop: UIImage? {
		return UIImage(systemName: "folder.fill.badge.person.crop")
	}

	/// square.grid.3x1.folder.badge.plus
	static var square_grid_3x1_folder_badge_plus: UIImage? {
		return UIImage(systemName: "square.grid.3x1.folder.badge.plus")
	}

	/// square.grid.3x1.folder.fill.badge.plus
	static var square_grid_3x1_folder_fill_badge_plus: UIImage? {
		return UIImage(systemName: "square.grid.3x1.folder.fill.badge.plus")
	}

	/// folder.badge.gearshape
	static var folder_badge_gearshape: UIImage? {
		return UIImage(systemName: "folder.badge.gearshape")
	}

	/// folder.fill.badge.gearshape
	static var folder_fill_badge_gearshape: UIImage? {
		return UIImage(systemName: "folder.fill.badge.gearshape")
	}

	/// plus.rectangle.on.folder
	static var plus_rectangle_on_folder: UIImage? {
		return UIImage(systemName: "plus.rectangle.on.folder")
	}

	/// plus.rectangle.on.folder.fill
	static var plus_rectangle_on_folder_fill: UIImage? {
		return UIImage(systemName: "plus.rectangle.on.folder.fill")
	}

	/// questionmark.folder
	static var questionmark_folder: UIImage? {
		return UIImage(systemName: "questionmark.folder")
	}

	/// questionmark.folder.fill
	static var questionmark_folder_fill: UIImage? {
		return UIImage(systemName: "questionmark.folder.fill")
	}

	/// paperplane
	static var paperplane: UIImage? {
		return UIImage(systemName: "paperplane")
	}

	/// paperplane.fill
	static var paperplane_fill: UIImage? {
		return UIImage(systemName: "paperplane.fill")
	}

	/// paperplane.circle
	static var paperplane_circle: UIImage? {
		return UIImage(systemName: "paperplane.circle")
	}

	/// paperplane.circle.fill
	static var paperplane_circle_fill: UIImage? {
		return UIImage(systemName: "paperplane.circle.fill")
	}

	/// tray
	static var tray: UIImage? {
		return UIImage(systemName: "tray")
	}

	/// tray.fill
	static var tray_fill: UIImage? {
		return UIImage(systemName: "tray.fill")
	}

	/// tray.circle
	static var tray_circle: UIImage? {
		return UIImage(systemName: "tray.circle")
	}

	/// tray.circle.fill
	static var tray_circle_fill: UIImage? {
		return UIImage(systemName: "tray.circle.fill")
	}

	/// tray.and.arrow.up
	static var tray_and_arrow_up: UIImage? {
		return UIImage(systemName: "tray.and.arrow.up")
	}

	/// tray.and.arrow.up.fill
	static var tray_and_arrow_up_fill: UIImage? {
		return UIImage(systemName: "tray.and.arrow.up.fill")
	}

	/// tray.and.arrow.down
	static var tray_and_arrow_down: UIImage? {
		return UIImage(systemName: "tray.and.arrow.down")
	}

	/// tray.and.arrow.down.fill
	static var tray_and_arrow_down_fill: UIImage? {
		return UIImage(systemName: "tray.and.arrow.down.fill")
	}

	/// tray.2
	static var tray_2: UIImage? {
		return UIImage(systemName: "tray.2")
	}

	/// tray.2.fill
	static var tray_2_fill: UIImage? {
		return UIImage(systemName: "tray.2.fill")
	}

	/// tray.full
	static var tray_full: UIImage? {
		return UIImage(systemName: "tray.full")
	}

	/// tray.full.fill
	static var tray_full_fill: UIImage? {
		return UIImage(systemName: "tray.full.fill")
	}

	/// externaldrive
	static var externaldrive: UIImage? {
		return UIImage(systemName: "externaldrive")
	}

	/// externaldrive.fill
	static var externaldrive_fill: UIImage? {
		return UIImage(systemName: "externaldrive.fill")
	}

	/// externaldrive.badge.plus
	static var externaldrive_badge_plus: UIImage? {
		return UIImage(systemName: "externaldrive.badge.plus")
	}

	/// externaldrive.fill.badge.plus
	static var externaldrive_fill_badge_plus: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.plus")
	}

	/// externaldrive.badge.minus
	static var externaldrive_badge_minus: UIImage? {
		return UIImage(systemName: "externaldrive.badge.minus")
	}

	/// externaldrive.fill.badge.minus
	static var externaldrive_fill_badge_minus: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.minus")
	}

	/// externaldrive.badge.checkmark
	static var externaldrive_badge_checkmark: UIImage? {
		return UIImage(systemName: "externaldrive.badge.checkmark")
	}

	/// externaldrive.fill.badge.checkmark
	static var externaldrive_fill_badge_checkmark: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.checkmark")
	}

	/// externaldrive.badge.xmark
	static var externaldrive_badge_xmark: UIImage? {
		return UIImage(systemName: "externaldrive.badge.xmark")
	}

	/// externaldrive.fill.badge.xmark
	static var externaldrive_fill_badge_xmark: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.xmark")
	}

	/// externaldrive.badge.person.crop
	static var externaldrive_badge_person_crop: UIImage? {
		return UIImage(systemName: "externaldrive.badge.person.crop")
	}

	/// externaldrive.fill.badge.person.crop
	static var externaldrive_fill_badge_person_crop: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.person.crop")
	}

	/// externaldrive.badge.icloud
	static var externaldrive_badge_icloud: UIImage? {
		return UIImage(systemName: "externaldrive.badge.icloud")
	}

	/// externaldrive.fill.badge.icloud
	static var externaldrive_fill_badge_icloud: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.icloud")
	}

	/// externaldrive.badge.wifi
	static var externaldrive_badge_wifi: UIImage? {
		return UIImage(systemName: "externaldrive.badge.wifi")
	}

	/// externaldrive.fill.badge.wifi
	static var externaldrive_fill_badge_wifi: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.wifi")
	}

	/// externaldrive.badge.timemachine
	static var externaldrive_badge_timemachine: UIImage? {
		return UIImage(systemName: "externaldrive.badge.timemachine")
	}

	/// externaldrive.fill.badge.timemachine
	static var externaldrive_fill_badge_timemachine: UIImage? {
		return UIImage(systemName: "externaldrive.fill.badge.timemachine")
	}

	/// internaldrive
	static var internaldrive: UIImage? {
		return UIImage(systemName: "internaldrive")
	}

	/// internaldrive.fill
	static var internaldrive_fill: UIImage? {
		return UIImage(systemName: "internaldrive.fill")
	}

	/// opticaldiscdrive
	static var opticaldiscdrive: UIImage? {
		return UIImage(systemName: "opticaldiscdrive")
	}

	/// opticaldiscdrive.fill
	static var opticaldiscdrive_fill: UIImage? {
		return UIImage(systemName: "opticaldiscdrive.fill")
	}

	/// externaldrive.connected.to.line.below
	static var externaldrive_connected_to_line_below: UIImage? {
		return UIImage(systemName: "externaldrive.connected.to.line.below")
	}

	/// externaldrive.connected.to.line.below.fill
	static var externaldrive_connected_to_line_below_fill: UIImage? {
		return UIImage(systemName: "externaldrive.connected.to.line.below.fill")
	}

	/// archivebox
	static var archivebox: UIImage? {
		return UIImage(systemName: "archivebox")
	}

	/// archivebox.fill
	static var archivebox_fill: UIImage? {
		return UIImage(systemName: "archivebox.fill")
	}

	/// archivebox.circle
	static var archivebox_circle: UIImage? {
		return UIImage(systemName: "archivebox.circle")
	}

	/// archivebox.circle.fill
	static var archivebox_circle_fill: UIImage? {
		return UIImage(systemName: "archivebox.circle.fill")
	}

	/// xmark.bin
	static var xmark_bin: UIImage? {
		return UIImage(systemName: "xmark.bin")
	}

	/// xmark.bin.fill
	static var xmark_bin_fill: UIImage? {
		return UIImage(systemName: "xmark.bin.fill")
	}

	/// xmark.bin.circle
	static var xmark_bin_circle: UIImage? {
		return UIImage(systemName: "xmark.bin.circle")
	}

	/// xmark.bin.circle.fill
	static var xmark_bin_circle_fill: UIImage? {
		return UIImage(systemName: "xmark.bin.circle.fill")
	}

	/// arrow.up.bin
	static var arrow_up_bin: UIImage? {
		return UIImage(systemName: "arrow.up.bin")
	}

	/// arrow.up.bin.fill
	static var arrow_up_bin_fill: UIImage? {
		return UIImage(systemName: "arrow.up.bin.fill")
	}

	/// doc
	static var doc: UIImage? {
		return UIImage(systemName: "doc")
	}

	/// doc.fill
	static var doc_fill: UIImage? {
		return UIImage(systemName: "doc.fill")
	}

	/// doc.circle
	static var doc_circle: UIImage? {
		return UIImage(systemName: "doc.circle")
	}

	/// doc.circle.fill
	static var doc_circle_fill: UIImage? {
		return UIImage(systemName: "doc.circle.fill")
	}

	/// doc.badge.plus
	static var doc_badge_plus: UIImage? {
		return UIImage(systemName: "doc.badge.plus")
	}

	/// doc.fill.badge.plus
	static var doc_fill_badge_plus: UIImage? {
		return UIImage(systemName: "doc.fill.badge.plus")
	}

	/// doc.badge.gearshape
	static var doc_badge_gearshape: UIImage? {
		return UIImage(systemName: "doc.badge.gearshape")
	}

	/// doc.badge.gearshape.fill
	static var doc_badge_gearshape_fill: UIImage? {
		return UIImage(systemName: "doc.badge.gearshape.fill")
	}

	/// doc.badge.ellipsis
	static var doc_badge_ellipsis: UIImage? {
		return UIImage(systemName: "doc.badge.ellipsis")
	}

	/// doc.fill.badge.ellipsis
	static var doc_fill_badge_ellipsis: UIImage? {
		return UIImage(systemName: "doc.fill.badge.ellipsis")
	}

	/// lock.doc
	static var lock_doc: UIImage? {
		return UIImage(systemName: "lock.doc")
	}

	/// lock.doc.fill
	static var lock_doc_fill: UIImage? {
		return UIImage(systemName: "lock.doc.fill")
	}

	/// arrow.up.doc
	static var arrow_up_doc: UIImage? {
		return UIImage(systemName: "arrow.up.doc")
	}

	/// arrow.up.doc.fill
	static var arrow_up_doc_fill: UIImage? {
		return UIImage(systemName: "arrow.up.doc.fill")
	}

	/// arrow.down.doc
	static var arrow_down_doc: UIImage? {
		return UIImage(systemName: "arrow.down.doc")
	}

	/// arrow.down.doc.fill
	static var arrow_down_doc_fill: UIImage? {
		return UIImage(systemName: "arrow.down.doc.fill")
	}

	/// doc.text
	static var doc_text: UIImage? {
		return UIImage(systemName: "doc.text")
	}

	/// doc.text.fill
	static var doc_text_fill: UIImage? {
		return UIImage(systemName: "doc.text.fill")
	}

	/// doc.zipper
	static var doc_zipper: UIImage? {
		return UIImage(systemName: "doc.zipper")
	}

	/// doc.on.doc
	static var doc_on_doc: UIImage? {
		return UIImage(systemName: "doc.on.doc")
	}

	/// doc.on.doc.fill
	static var doc_on_doc_fill: UIImage? {
		return UIImage(systemName: "doc.on.doc.fill")
	}

	/// doc.on.clipboard
	static var doc_on_clipboard: UIImage? {
		return UIImage(systemName: "doc.on.clipboard")
	}

	/// arrow.right.doc.on.clipboard
	static var arrow_right_doc_on_clipboard: UIImage? {
		return UIImage(systemName: "arrow.right.doc.on.clipboard")
	}

	/// arrow.up.doc.on.clipboard
	static var arrow_up_doc_on_clipboard: UIImage? {
		return UIImage(systemName: "arrow.up.doc.on.clipboard")
	}

	/// arrow.triangle.2.circlepath.doc.on.clipboard
	static var arrow_triangle_2_circlepath_doc_on_clipboard: UIImage? {
		return UIImage(systemName: "arrow.triangle.2.circlepath.doc.on.clipboard")
	}

	/// doc.on.clipboard.fill
	static var doc_on_clipboard_fill: UIImage? {
		return UIImage(systemName: "doc.on.clipboard.fill")
	}

	/// doc.richtext
	static var doc_richtext: UIImage? {
		return UIImage(systemName: "doc.richtext")
	}

	/// doc.richtext.fill
	static var doc_richtext_fill: UIImage? {
		return UIImage(systemName: "doc.richtext.fill")
	}

	/// doc.plaintext
	static var doc_plaintext: UIImage? {
		return UIImage(systemName: "doc.plaintext")
	}

	/// doc.plaintext.fill
	static var doc_plaintext_fill: UIImage? {
		return UIImage(systemName: "doc.plaintext.fill")
	}

	/// doc.append
	static var doc_append: UIImage? {
		return UIImage(systemName: "doc.append")
	}

	/// doc.append.fill
	static var doc_append_fill: UIImage? {
		return UIImage(systemName: "doc.append.fill")
	}

	/// doc.text.below.ecg
	static var doc_text_below_ecg: UIImage? {
		return UIImage(systemName: "doc.text.below.ecg")
	}

	/// doc.text.below.ecg.fill
	static var doc_text_below_ecg_fill: UIImage? {
		return UIImage(systemName: "doc.text.below.ecg.fill")
	}

	/// chart.bar.doc.horizontal
	static var chart_bar_doc_horizontal: UIImage? {
		return UIImage(systemName: "chart.bar.doc.horizontal")
	}

	/// chart.bar.doc.horizontal.fill
	static var chart_bar_doc_horizontal_fill: UIImage? {
		return UIImage(systemName: "chart.bar.doc.horizontal.fill")
	}

	/// list.bullet.rectangle.portrait
	static var list_bullet_rectangle_portrait: UIImage? {
		return UIImage(systemName: "list.bullet.rectangle.portrait")
	}

	/// list.bullet.rectangle.portrait.fill
	static var list_bullet_rectangle_portrait_fill: UIImage? {
		return UIImage(systemName: "list.bullet.rectangle.portrait.fill")
	}

	/// doc.text.magnifyingglass
	static var doc_text_magnifyingglass: UIImage? {
		return UIImage(systemName: "doc.text.magnifyingglass")
	}

	/// list.bullet.rectangle
	static var list_bullet_rectangle: UIImage? {
		return UIImage(systemName: "list.bullet.rectangle")
	}

	/// list.bullet.rectangle.fill
	static var list_bullet_rectangle_fill: UIImage? {
		return UIImage(systemName: "list.bullet.rectangle.fill")
	}

	/// list.dash.header.rectangle
	static var list_dash_header_rectangle: UIImage? {
		return UIImage(systemName: "list.dash.header.rectangle")
	}

	/// terminal
	static var terminal: UIImage? {
		return UIImage(systemName: "terminal")
	}

	/// terminal.fill
	static var terminal_fill: UIImage? {
		return UIImage(systemName: "terminal.fill")
	}

	/// note
	static var note: UIImage? {
		return UIImage(systemName: "note")
	}

	/// note.text
	static var note_text: UIImage? {
		return UIImage(systemName: "note.text")
	}

	/// note.text.badge.plus
	static var note_text_badge_plus: UIImage? {
		return UIImage(systemName: "note.text.badge.plus")
	}

	/// calendar
	static var calendar: UIImage? {
		return UIImage(systemName: "calendar")
	}

	/// calendar.circle
	static var calendar_circle: UIImage? {
		return UIImage(systemName: "calendar.circle")
	}

	/// calendar.circle.fill
	static var calendar_circle_fill: UIImage? {
		return UIImage(systemName: "calendar.circle.fill")
	}

	/// calendar.badge.plus
	static var calendar_badge_plus: UIImage? {
		return UIImage(systemName: "calendar.badge.plus")
	}

	/// calendar.badge.minus
	static var calendar_badge_minus: UIImage? {
		return UIImage(systemName: "calendar.badge.minus")
	}

	/// calendar.badge.clock
	static var calendar_badge_clock: UIImage? {
		return UIImage(systemName: "calendar.badge.clock")
	}

	/// calendar.badge.exclamationmark
	static var calendar_badge_exclamationmark: UIImage? {
		return UIImage(systemName: "calendar.badge.exclamationmark")
	}

	/// calendar.day.timeline.left
	static var calendar_day_timeline_left: UIImage? {
		return UIImage(systemName: "calendar.day.timeline.left")
	}

	/// calendar.day.timeline.right
	static var calendar_day_timeline_right: UIImage? {
		return UIImage(systemName: "calendar.day.timeline.right")
	}

	/// calendar.day.timeline.leading
	static var calendar_day_timeline_leading: UIImage? {
		return UIImage(systemName: "calendar.day.timeline.leading")
	}

	/// calendar.day.timeline.trailing
	static var calendar_day_timeline_trailing: UIImage? {
		return UIImage(systemName: "calendar.day.timeline.trailing")
	}

	/// arrowshape.turn.up.left
	static var arrowshape_turn_up_left: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left")
	}

	/// arrowshape.turn.up.left.fill
	static var arrowshape_turn_up_left_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left.fill")
	}

	/// arrowshape.turn.up.left.circle
	static var arrowshape_turn_up_left_circle: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left.circle")
	}

	/// arrowshape.turn.up.left.circle.fill
	static var arrowshape_turn_up_left_circle_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left.circle.fill")
	}

	/// arrowshape.turn.up.backward
	static var arrowshape_turn_up_backward: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward")
	}

	/// arrowshape.turn.up.backward.fill
	static var arrowshape_turn_up_backward_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward.fill")
	}

	/// arrowshape.turn.up.backward.circle
	static var arrowshape_turn_up_backward_circle: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward.circle")
	}

	/// arrowshape.turn.up.backward.circle.fill
	static var arrowshape_turn_up_backward_circle_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward.circle.fill")
	}

	/// arrowshape.turn.up.right
	static var arrowshape_turn_up_right: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.right")
	}

	/// arrowshape.turn.up.right.fill
	static var arrowshape_turn_up_right_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.right.fill")
	}

	/// arrowshape.turn.up.right.circle
	static var arrowshape_turn_up_right_circle: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.right.circle")
	}

	/// arrowshape.turn.up.right.circle.fill
	static var arrowshape_turn_up_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.right.circle.fill")
	}

	/// arrowshape.turn.up.forward
	static var arrowshape_turn_up_forward: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.forward")
	}

	/// arrowshape.turn.up.forward.fill
	static var arrowshape_turn_up_forward_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.forward.fill")
	}

	/// arrowshape.turn.up.forward.circle
	static var arrowshape_turn_up_forward_circle: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.forward.circle")
	}

	/// arrowshape.turn.up.forward.circle.fill
	static var arrowshape_turn_up_forward_circle_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.forward.circle.fill")
	}

	/// arrowshape.turn.up.left.2
	static var arrowshape_turn_up_left_2: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left.2")
	}

	/// arrowshape.turn.up.left.2.fill
	static var arrowshape_turn_up_left_2_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left.2.fill")
	}

	/// arrowshape.turn.up.left.2.circle
	static var arrowshape_turn_up_left_2_circle: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left.2.circle")
	}

	/// arrowshape.turn.up.left.2.circle.fill
	static var arrowshape_turn_up_left_2_circle_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.left.2.circle.fill")
	}

	/// arrowshape.turn.up.backward.2
	static var arrowshape_turn_up_backward_2: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward.2")
	}

	/// arrowshape.turn.up.backward.2.fill
	static var arrowshape_turn_up_backward_2_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward.2.fill")
	}

	/// arrowshape.turn.up.backward.2.circle
	static var arrowshape_turn_up_backward_2_circle: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward.2.circle")
	}

	/// arrowshape.turn.up.backward.2.circle.fill
	static var arrowshape_turn_up_backward_2_circle_fill: UIImage? {
		return UIImage(systemName: "arrowshape.turn.up.backward.2.circle.fill")
	}

	/// arrowshape.zigzag.right
	static var arrowshape_zigzag_right: UIImage? {
		return UIImage(systemName: "arrowshape.zigzag.right")
	}

	/// arrowshape.zigzag.right.fill
	static var arrowshape_zigzag_right_fill: UIImage? {
		return UIImage(systemName: "arrowshape.zigzag.right.fill")
	}

	/// arrowshape.zigzag.forward
	static var arrowshape_zigzag_forward: UIImage? {
		return UIImage(systemName: "arrowshape.zigzag.forward")
	}

	/// arrowshape.zigzag.forward.fill
	static var arrowshape_zigzag_forward_fill: UIImage? {
		return UIImage(systemName: "arrowshape.zigzag.forward.fill")
	}

	/// arrowshape.bounce.right
	static var arrowshape_bounce_right: UIImage? {
		return UIImage(systemName: "arrowshape.bounce.right")
	}

	/// arrowshape.bounce.right.fill
	static var arrowshape_bounce_right_fill: UIImage? {
		return UIImage(systemName: "arrowshape.bounce.right.fill")
	}

	/// arrowshape.bounce.forward
	static var arrowshape_bounce_forward: UIImage? {
		return UIImage(systemName: "arrowshape.bounce.forward")
	}

	/// arrowshape.bounce.forward.fill
	static var arrowshape_bounce_forward_fill: UIImage? {
		return UIImage(systemName: "arrowshape.bounce.forward.fill")
	}

	/// book
	static var book: UIImage? {
		return UIImage(systemName: "book")
	}

	/// book.fill
	static var book_fill: UIImage? {
		return UIImage(systemName: "book.fill")
	}

	/// book.circle
	static var book_circle: UIImage? {
		return UIImage(systemName: "book.circle")
	}

	/// book.circle.fill
	static var book_circle_fill: UIImage? {
		return UIImage(systemName: "book.circle.fill")
	}

	/// books.vertical
	static var books_vertical: UIImage? {
		return UIImage(systemName: "books.vertical")
	}

	/// books.vertical.fill
	static var books_vertical_fill: UIImage? {
		return UIImage(systemName: "books.vertical.fill")
	}

	/// book.closed
	static var book_closed: UIImage? {
		return UIImage(systemName: "book.closed")
	}

	/// book.closed.fill
	static var book_closed_fill: UIImage? {
		return UIImage(systemName: "book.closed.fill")
	}

	/// character.book.closed
	static var character_book_closed: UIImage? {
		return UIImage(systemName: "character.book.closed")
	}

	/// character.book.closed.fill
	static var character_book_closed_fill: UIImage? {
		return UIImage(systemName: "character.book.closed.fill")
	}

	/// text.book.closed
	static var text_book_closed: UIImage? {
		return UIImage(systemName: "text.book.closed")
	}

	/// text.book.closed.fill
	static var text_book_closed_fill: UIImage? {
		return UIImage(systemName: "text.book.closed.fill")
	}

	/// menucard
	static var menucard: UIImage? {
		return UIImage(systemName: "menucard")
	}

	/// menucard.fill
	static var menucard_fill: UIImage? {
		return UIImage(systemName: "menucard.fill")
	}

	/// greetingcard
	static var greetingcard: UIImage? {
		return UIImage(systemName: "greetingcard")
	}

	/// greetingcard.fill
	static var greetingcard_fill: UIImage? {
		return UIImage(systemName: "greetingcard.fill")
	}

	/// magazine
	static var magazine: UIImage? {
		return UIImage(systemName: "magazine")
	}

	/// magazine.fill
	static var magazine_fill: UIImage? {
		return UIImage(systemName: "magazine.fill")
	}

	/// newspaper
	static var newspaper: UIImage? {
		return UIImage(systemName: "newspaper")
	}

	/// newspaper.fill
	static var newspaper_fill: UIImage? {
		return UIImage(systemName: "newspaper.fill")
	}

	/// heart.text.square
	static var heart_text_square: UIImage? {
		return UIImage(systemName: "heart.text.square")
	}

	/// heart.text.square.fill
	static var heart_text_square_fill: UIImage? {
		return UIImage(systemName: "heart.text.square.fill")
	}

	/// square.text.square
	static var square_text_square: UIImage? {
		return UIImage(systemName: "square.text.square")
	}

	/// square.text.square.fill
	static var square_text_square_fill: UIImage? {
		return UIImage(systemName: "square.text.square.fill")
	}

	/// doc.text.image
	static var doc_text_image: UIImage? {
		return UIImage(systemName: "doc.text.image")
	}

	/// doc.text.image.fill
	static var doc_text_image_fill: UIImage? {
		return UIImage(systemName: "doc.text.image.fill")
	}

	/// bookmark
	static var bookmark: UIImage? {
		return UIImage(systemName: "bookmark")
	}

	/// bookmark.fill
	static var bookmark_fill: UIImage? {
		return UIImage(systemName: "bookmark.fill")
	}

	/// bookmark.circle
	static var bookmark_circle: UIImage? {
		return UIImage(systemName: "bookmark.circle")
	}

	/// bookmark.circle.fill
	static var bookmark_circle_fill: UIImage? {
		return UIImage(systemName: "bookmark.circle.fill")
	}

	/// bookmark.square
	static var bookmark_square: UIImage? {
		return UIImage(systemName: "bookmark.square")
	}

	/// bookmark.square.fill
	static var bookmark_square_fill: UIImage? {
		return UIImage(systemName: "bookmark.square.fill")
	}

	/// bookmark.slash
	static var bookmark_slash: UIImage? {
		return UIImage(systemName: "bookmark.slash")
	}

	/// bookmark.slash.fill
	static var bookmark_slash_fill: UIImage? {
		return UIImage(systemName: "bookmark.slash.fill")
	}

	/// rosette
	static var rosette: UIImage? {
		return UIImage(systemName: "rosette")
	}

	/// graduationcap
	static var graduationcap: UIImage? {
		return UIImage(systemName: "graduationcap")
	}

	/// graduationcap.fill
	static var graduationcap_fill: UIImage? {
		return UIImage(systemName: "graduationcap.fill")
	}

	/// ticket
	static var ticket: UIImage? {
		return UIImage(systemName: "ticket")
	}

	/// ticket.fill
	static var ticket_fill: UIImage? {
		return UIImage(systemName: "ticket.fill")
	}

	/// paperclip
	static var paperclip: UIImage? {
		return UIImage(systemName: "paperclip")
	}

	/// paperclip.circle
	static var paperclip_circle: UIImage? {
		return UIImage(systemName: "paperclip.circle")
	}

	/// paperclip.circle.fill
	static var paperclip_circle_fill: UIImage? {
		return UIImage(systemName: "paperclip.circle.fill")
	}

	/// paperclip.badge.ellipsis
	static var paperclip_badge_ellipsis: UIImage? {
		return UIImage(systemName: "paperclip.badge.ellipsis")
	}

	/// rectangle.and.paperclip
	static var rectangle_and_paperclip: UIImage? {
		return UIImage(systemName: "rectangle.and.paperclip")
	}

	/// rectangle.dashed.and.paperclip
	static var rectangle_dashed_and_paperclip: UIImage? {
		return UIImage(systemName: "rectangle.dashed.and.paperclip")
	}

	/// link
	static var link: UIImage? {
		return UIImage(systemName: "link")
	}

	/// link.circle
	static var link_circle: UIImage? {
		return UIImage(systemName: "link.circle")
	}

	/// link.circle.fill
	static var link_circle_fill: UIImage? {
		return UIImage(systemName: "link.circle.fill")
	}

	/// link.badge.plus
	static var link_badge_plus: UIImage? {
		return UIImage(systemName: "link.badge.plus")
	}

	/// personalhotspot
	static var personalhotspot: UIImage? {
		return UIImage(systemName: "personalhotspot")
	}

	/// lineweight
	static var lineweight: UIImage? {
		return UIImage(systemName: "lineweight")
	}

	/// person
	static var person: UIImage? {
		return UIImage(systemName: "person")
	}

	/// person.fill
	static var person_fill: UIImage? {
		return UIImage(systemName: "person.fill")
	}

	/// person.fill.turn.right
	static var person_fill_turn_right: UIImage? {
		return UIImage(systemName: "person.fill.turn.right")
	}

	/// person.fill.turn.down
	static var person_fill_turn_down: UIImage? {
		return UIImage(systemName: "person.fill.turn.down")
	}

	/// person.fill.turn.left
	static var person_fill_turn_left: UIImage? {
		return UIImage(systemName: "person.fill.turn.left")
	}

	/// person.fill.checkmark
	static var person_fill_checkmark: UIImage? {
		return UIImage(systemName: "person.fill.checkmark")
	}

	/// person.fill.xmark
	static var person_fill_xmark: UIImage? {
		return UIImage(systemName: "person.fill.xmark")
	}

	/// person.fill.questionmark
	static var person_fill_questionmark: UIImage? {
		return UIImage(systemName: "person.fill.questionmark")
	}

	/// person.circle
	static var person_circle: UIImage? {
		return UIImage(systemName: "person.circle")
	}

	/// person.circle.fill
	static var person_circle_fill: UIImage? {
		return UIImage(systemName: "person.circle.fill")
	}

	/// person.badge.plus
	static var person_badge_plus: UIImage? {
		return UIImage(systemName: "person.badge.plus")
	}

	/// person.fill.badge.plus
	static var person_fill_badge_plus: UIImage? {
		return UIImage(systemName: "person.fill.badge.plus")
	}

	/// person.badge.minus
	static var person_badge_minus: UIImage? {
		return UIImage(systemName: "person.badge.minus")
	}

	/// person.fill.badge.minus
	static var person_fill_badge_minus: UIImage? {
		return UIImage(systemName: "person.fill.badge.minus")
	}

	/// shareplay
	static var shareplay: UIImage? {
		return UIImage(systemName: "shareplay")
	}

	/// person.and.arrow.left.and.arrow.right
	static var person_and_arrow_left_and_arrow_right: UIImage? {
		return UIImage(systemName: "person.and.arrow.left.and.arrow.right")
	}

	/// person.fill.and.arrow.left.and.arrow.right
	static var person_fill_and_arrow_left_and_arrow_right: UIImage? {
		return UIImage(systemName: "person.fill.and.arrow.left.and.arrow.right")
	}

	/// person.2
	static var person_2: UIImage? {
		return UIImage(systemName: "person.2")
	}

	/// person.2.fill
	static var person_2_fill: UIImage? {
		return UIImage(systemName: "person.2.fill")
	}

	/// person.2.circle
	static var person_2_circle: UIImage? {
		return UIImage(systemName: "person.2.circle")
	}

	/// person.2.circle.fill
	static var person_2_circle_fill: UIImage? {
		return UIImage(systemName: "person.2.circle.fill")
	}

	/// person.2.wave.2
	static var person_2_wave_2: UIImage? {
		return UIImage(systemName: "person.2.wave.2")
	}

	/// person.2.wave.2.fill
	static var person_2_wave_2_fill: UIImage? {
		return UIImage(systemName: "person.2.wave.2.fill")
	}

	/// person.3
	static var person_3: UIImage? {
		return UIImage(systemName: "person.3")
	}

	/// person.3.fill
	static var person_3_fill: UIImage? {
		return UIImage(systemName: "person.3.fill")
	}

	/// person.3.sequence
	static var person_3_sequence: UIImage? {
		return UIImage(systemName: "person.3.sequence")
	}

	/// person.3.sequence.fill
	static var person_3_sequence_fill: UIImage? {
		return UIImage(systemName: "person.3.sequence.fill")
	}

	/// lanyardcard
	static var lanyardcard: UIImage? {
		return UIImage(systemName: "lanyardcard")
	}

	/// lanyardcard.fill
	static var lanyardcard_fill: UIImage? {
		return UIImage(systemName: "lanyardcard.fill")
	}

	/// person.crop.circle
	static var person_crop_circle: UIImage? {
		return UIImage(systemName: "person.crop.circle")
	}

	/// person.crop.circle.fill
	static var person_crop_circle_fill: UIImage? {
		return UIImage(systemName: "person.crop.circle.fill")
	}

	/// person.crop.circle.badge.plus
	static var person_crop_circle_badge_plus: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.plus")
	}

	/// person.crop.circle.fill.badge.plus
	static var person_crop_circle_fill_badge_plus: UIImage? {
		return UIImage(systemName: "person.crop.circle.fill.badge.plus")
	}

	/// person.crop.circle.badge.minus
	static var person_crop_circle_badge_minus: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.minus")
	}

	/// person.crop.circle.fill.badge.minus
	static var person_crop_circle_fill_badge_minus: UIImage? {
		return UIImage(systemName: "person.crop.circle.fill.badge.minus")
	}

	/// person.crop.circle.badge.checkmark
	static var person_crop_circle_badge_checkmark: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.checkmark")
	}

	/// person.crop.circle.fill.badge.checkmark
	static var person_crop_circle_fill_badge_checkmark: UIImage? {
		return UIImage(systemName: "person.crop.circle.fill.badge.checkmark")
	}

	/// person.crop.circle.badge.xmark
	static var person_crop_circle_badge_xmark: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.xmark")
	}

	/// person.crop.circle.fill.badge.xmark
	static var person_crop_circle_fill_badge_xmark: UIImage? {
		return UIImage(systemName: "person.crop.circle.fill.badge.xmark")
	}

	/// person.crop.circle.badge.questionmark
	static var person_crop_circle_badge_questionmark: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.questionmark")
	}

	/// person.crop.circle.badge.questionmark.fill
	static var person_crop_circle_badge_questionmark_fill: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.questionmark.fill")
	}

	/// person.crop.circle.badge.exclamationmark
	static var person_crop_circle_badge_exclamationmark: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.exclamationmark")
	}

	/// person.crop.circle.badge.exclamationmark.fill
	static var person_crop_circle_badge_exclamationmark_fill: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.exclamationmark.fill")
	}

	/// person.crop.circle.badge.moon
	static var person_crop_circle_badge_moon: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.moon")
	}

	/// person.crop.circle.badge.moon.fill
	static var person_crop_circle_badge_moon_fill: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.moon.fill")
	}

	/// person.crop.circle.badge
	static var person_crop_circle_badge: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge")
	}

	/// person.crop.circle.badge.fill
	static var person_crop_circle_badge_fill: UIImage? {
		return UIImage(systemName: "person.crop.circle.badge.fill")
	}

	/// person.crop.square
	static var person_crop_square: UIImage? {
		return UIImage(systemName: "person.crop.square")
	}

	/// person.crop.square.fill
	static var person_crop_square_fill: UIImage? {
		return UIImage(systemName: "person.crop.square.fill")
	}

	/// person.crop.artframe
	static var person_crop_artframe: UIImage? {
		return UIImage(systemName: "person.crop.artframe")
	}

	/// person.crop.rectangle.stack
	static var person_crop_rectangle_stack: UIImage? {
		return UIImage(systemName: "person.crop.rectangle.stack")
	}

	/// person.crop.rectangle.stack.fill
	static var person_crop_rectangle_stack_fill: UIImage? {
		return UIImage(systemName: "person.crop.rectangle.stack.fill")
	}

	/// person.2.crop.square.stack
	static var person_2_crop_square_stack: UIImage? {
		return UIImage(systemName: "person.2.crop.square.stack")
	}

	/// person.2.crop.square.stack.fill
	static var person_2_crop_square_stack_fill: UIImage? {
		return UIImage(systemName: "person.2.crop.square.stack.fill")
	}

	/// person.crop.rectangle
	static var person_crop_rectangle: UIImage? {
		return UIImage(systemName: "person.crop.rectangle")
	}

	/// person.crop.rectangle.fill
	static var person_crop_rectangle_fill: UIImage? {
		return UIImage(systemName: "person.crop.rectangle.fill")
	}

	/// arrow.up.and.person.rectangle.portrait
	static var arrow_up_and_person_rectangle_portrait: UIImage? {
		return UIImage(systemName: "arrow.up.and.person.rectangle.portrait")
	}

	/// arrow.up.and.person.rectangle.turn.right
	static var arrow_up_and_person_rectangle_turn_right: UIImage? {
		return UIImage(systemName: "arrow.up.and.person.rectangle.turn.right")
	}

	/// arrow.up.and.person.rectangle.turn.left
	static var arrow_up_and_person_rectangle_turn_left: UIImage? {
		return UIImage(systemName: "arrow.up.and.person.rectangle.turn.left")
	}

	/// person.crop.square.filled.and.at.rectangle
	static var person_crop_square_filled_and_at_rectangle: UIImage? {
		return UIImage(systemName: "person.crop.square.filled.and.at.rectangle")
	}

	/// person.crop.square.filled.and.at.rectangle.fill
	static var person_crop_square_filled_and_at_rectangle_fill: UIImage? {
		return UIImage(systemName: "person.crop.square.filled.and.at.rectangle.fill")
	}

	/// square.and.at.rectangle
	static var square_and_at_rectangle: UIImage? {
		return UIImage(systemName: "square.and.at.rectangle")
	}

	/// square.and.at.rectangle.fill
	static var square_and_at_rectangle_fill: UIImage? {
		return UIImage(systemName: "square.and.at.rectangle.fill")
	}

	/// person.text.rectangle
	static var person_text_rectangle: UIImage? {
		return UIImage(systemName: "person.text.rectangle")
	}

	/// person.text.rectangle.fill
	static var person_text_rectangle_fill: UIImage? {
		return UIImage(systemName: "person.text.rectangle.fill")
	}

	/// command
	static var command: UIImage? {
		return UIImage(systemName: "command")
	}

	/// command.circle
	static var command_circle: UIImage? {
		return UIImage(systemName: "command.circle")
	}

	/// command.circle.fill
	static var command_circle_fill: UIImage? {
		return UIImage(systemName: "command.circle.fill")
	}

	/// command.square
	static var command_square: UIImage? {
		return UIImage(systemName: "command.square")
	}

	/// command.square.fill
	static var command_square_fill: UIImage? {
		return UIImage(systemName: "command.square.fill")
	}

	/// option
	static var option: UIImage? {
		return UIImage(systemName: "option")
	}

	/// alt
	static var alt: UIImage? {
		return UIImage(systemName: "alt")
	}

	/// clear
	static var clear: UIImage? {
		return UIImage(systemName: "clear")
	}

	/// clear.fill
	static var clear_fill: UIImage? {
		return UIImage(systemName: "clear.fill")
	}

	/// delete.left
	static var delete_left: UIImage? {
		return UIImage(systemName: "delete.left")
	}

	/// delete.left.fill
	static var delete_left_fill: UIImage? {
		return UIImage(systemName: "delete.left.fill")
	}

	/// delete.backward
	static var delete_backward: UIImage? {
		return UIImage(systemName: "delete.backward")
	}

	/// delete.backward.fill
	static var delete_backward_fill: UIImage? {
		return UIImage(systemName: "delete.backward.fill")
	}

	/// delete.right
	static var delete_right: UIImage? {
		return UIImage(systemName: "delete.right")
	}

	/// delete.right.fill
	static var delete_right_fill: UIImage? {
		return UIImage(systemName: "delete.right.fill")
	}

	/// delete.forward
	static var delete_forward: UIImage? {
		return UIImage(systemName: "delete.forward")
	}

	/// delete.forward.fill
	static var delete_forward_fill: UIImage? {
		return UIImage(systemName: "delete.forward.fill")
	}

	/// shift
	static var shift: UIImage? {
		return UIImage(systemName: "shift")
	}

	/// shift.fill
	static var shift_fill: UIImage? {
		return UIImage(systemName: "shift.fill")
	}

	/// capslock
	static var capslock: UIImage? {
		return UIImage(systemName: "capslock")
	}

	/// capslock.fill
	static var capslock_fill: UIImage? {
		return UIImage(systemName: "capslock.fill")
	}

	/// escape
	static var escape: UIImage? {
		return UIImage(systemName: "escape")
	}

	/// restart
	static var restart: UIImage? {
		return UIImage(systemName: "restart")
	}

	/// restart.circle
	static var restart_circle: UIImage? {
		return UIImage(systemName: "restart.circle")
	}

	/// restart.circle.fill
	static var restart_circle_fill: UIImage? {
		return UIImage(systemName: "restart.circle.fill")
	}

	/// sleep
	static var sleep: UIImage? {
		return UIImage(systemName: "sleep")
	}

	/// sleep.circle
	static var sleep_circle: UIImage? {
		return UIImage(systemName: "sleep.circle")
	}

	/// sleep.circle.fill
	static var sleep_circle_fill: UIImage? {
		return UIImage(systemName: "sleep.circle.fill")
	}

	/// wake
	static var wake: UIImage? {
		return UIImage(systemName: "wake")
	}

	/// wake.circle
	static var wake_circle: UIImage? {
		return UIImage(systemName: "wake.circle")
	}

	/// wake.circle.fill
	static var wake_circle_fill: UIImage? {
		return UIImage(systemName: "wake.circle.fill")
	}

	/// power
	static var power: UIImage? {
		return UIImage(systemName: "power")
	}

	/// power.circle
	static var power_circle: UIImage? {
		return UIImage(systemName: "power.circle")
	}

	/// power.circle.fill
	static var power_circle_fill: UIImage? {
		return UIImage(systemName: "power.circle.fill")
	}

	/// power.dotted
	static var power_dotted: UIImage? {
		return UIImage(systemName: "power.dotted")
	}

	/// togglepower
	static var togglepower: UIImage? {
		return UIImage(systemName: "togglepower")
	}

	/// poweron
	static var poweron: UIImage? {
		return UIImage(systemName: "poweron")
	}

	/// poweroff
	static var poweroff: UIImage? {
		return UIImage(systemName: "poweroff")
	}

	/// powersleep
	static var powersleep: UIImage? {
		return UIImage(systemName: "powersleep")
	}

	/// directcurrent
	static var directcurrent: UIImage? {
		return UIImage(systemName: "directcurrent")
	}

	/// peacesign
	static var peacesign: UIImage? {
		return UIImage(systemName: "peacesign")
	}

	/// dot.arrowtriangles.up.right.down.left.circle
	static var dot_arrowtriangles_up_right_down_left_circle: UIImage? {
		return UIImage(systemName: "dot.arrowtriangles.up.right.down.left.circle")
	}

	/// globe
	static var globe: UIImage? {
		return UIImage(systemName: "globe")
	}

	/// network
	static var network: UIImage? {
		return UIImage(systemName: "network")
	}

	/// globe.americas
	static var globe_americas: UIImage? {
		return UIImage(systemName: "globe.americas")
	}

	/// globe.americas.fill
	static var globe_americas_fill: UIImage? {
		return UIImage(systemName: "globe.americas.fill")
	}

	/// globe.europe.africa
	static var globe_europe_africa: UIImage? {
		return UIImage(systemName: "globe.europe.africa")
	}

	/// globe.europe.africa.fill
	static var globe_europe_africa_fill: UIImage? {
		return UIImage(systemName: "globe.europe.africa.fill")
	}

	/// globe.asia.australia
	static var globe_asia_australia: UIImage? {
		return UIImage(systemName: "globe.asia.australia")
	}

	/// globe.asia.australia.fill
	static var globe_asia_australia_fill: UIImage? {
		return UIImage(systemName: "globe.asia.australia.fill")
	}

	/// sun.min
	static var sun_min: UIImage? {
		return UIImage(systemName: "sun.min")
	}

	/// sun.min.fill
	static var sun_min_fill: UIImage? {
		return UIImage(systemName: "sun.min.fill")
	}

	/// sun.max
	static var sun_max: UIImage? {
		return UIImage(systemName: "sun.max")
	}

	/// sun.max.fill
	static var sun_max_fill: UIImage? {
		return UIImage(systemName: "sun.max.fill")
	}

	/// sun.max.circle
	static var sun_max_circle: UIImage? {
		return UIImage(systemName: "sun.max.circle")
	}

	/// sun.max.circle.fill
	static var sun_max_circle_fill: UIImage? {
		return UIImage(systemName: "sun.max.circle.fill")
	}

	/// sunrise
	static var sunrise: UIImage? {
		return UIImage(systemName: "sunrise")
	}

	/// sunrise.fill
	static var sunrise_fill: UIImage? {
		return UIImage(systemName: "sunrise.fill")
	}

	/// sunset
	static var sunset: UIImage? {
		return UIImage(systemName: "sunset")
	}

	/// sunset.fill
	static var sunset_fill: UIImage? {
		return UIImage(systemName: "sunset.fill")
	}

	/// sun.and.horizon
	static var sun_and_horizon: UIImage? {
		return UIImage(systemName: "sun.and.horizon")
	}

	/// sun.and.horizon.fill
	static var sun_and_horizon_fill: UIImage? {
		return UIImage(systemName: "sun.and.horizon.fill")
	}

	/// sun.dust
	static var sun_dust: UIImage? {
		return UIImage(systemName: "sun.dust")
	}

	/// sun.dust.fill
	static var sun_dust_fill: UIImage? {
		return UIImage(systemName: "sun.dust.fill")
	}

	/// sun.haze
	static var sun_haze: UIImage? {
		return UIImage(systemName: "sun.haze")
	}

	/// sun.haze.fill
	static var sun_haze_fill: UIImage? {
		return UIImage(systemName: "sun.haze.fill")
	}

	/// moon
	static var moon: UIImage? {
		return UIImage(systemName: "moon")
	}

	/// moon.fill
	static var moon_fill: UIImage? {
		return UIImage(systemName: "moon.fill")
	}

	/// moon.circle
	static var moon_circle: UIImage? {
		return UIImage(systemName: "moon.circle")
	}

	/// moon.circle.fill
	static var moon_circle_fill: UIImage? {
		return UIImage(systemName: "moon.circle.fill")
	}

	/// zzz
	static var zzz: UIImage? {
		return UIImage(systemName: "zzz")
	}

	/// moon.zzz
	static var moon_zzz: UIImage? {
		return UIImage(systemName: "moon.zzz")
	}

	/// moon.zzz.fill
	static var moon_zzz_fill: UIImage? {
		return UIImage(systemName: "moon.zzz.fill")
	}

	/// sparkle
	static var sparkle: UIImage? {
		return UIImage(systemName: "sparkle")
	}

	/// sparkles
	static var sparkles: UIImage? {
		return UIImage(systemName: "sparkles")
	}

	/// moon.stars
	static var moon_stars: UIImage? {
		return UIImage(systemName: "moon.stars")
	}

	/// moon.stars.fill
	static var moon_stars_fill: UIImage? {
		return UIImage(systemName: "moon.stars.fill")
	}

	/// cloud
	static var cloud: UIImage? {
		return UIImage(systemName: "cloud")
	}

	/// cloud.fill
	static var cloud_fill: UIImage? {
		return UIImage(systemName: "cloud.fill")
	}

	/// cloud.drizzle
	static var cloud_drizzle: UIImage? {
		return UIImage(systemName: "cloud.drizzle")
	}

	/// cloud.drizzle.fill
	static var cloud_drizzle_fill: UIImage? {
		return UIImage(systemName: "cloud.drizzle.fill")
	}

	/// cloud.rain
	static var cloud_rain: UIImage? {
		return UIImage(systemName: "cloud.rain")
	}

	/// cloud.rain.fill
	static var cloud_rain_fill: UIImage? {
		return UIImage(systemName: "cloud.rain.fill")
	}

	/// cloud.heavyrain
	static var cloud_heavyrain: UIImage? {
		return UIImage(systemName: "cloud.heavyrain")
	}

	/// cloud.heavyrain.fill
	static var cloud_heavyrain_fill: UIImage? {
		return UIImage(systemName: "cloud.heavyrain.fill")
	}

	/// cloud.fog
	static var cloud_fog: UIImage? {
		return UIImage(systemName: "cloud.fog")
	}

	/// cloud.fog.fill
	static var cloud_fog_fill: UIImage? {
		return UIImage(systemName: "cloud.fog.fill")
	}

	/// cloud.hail
	static var cloud_hail: UIImage? {
		return UIImage(systemName: "cloud.hail")
	}

	/// cloud.hail.fill
	static var cloud_hail_fill: UIImage? {
		return UIImage(systemName: "cloud.hail.fill")
	}

	/// cloud.snow
	static var cloud_snow: UIImage? {
		return UIImage(systemName: "cloud.snow")
	}

	/// cloud.snow.fill
	static var cloud_snow_fill: UIImage? {
		return UIImage(systemName: "cloud.snow.fill")
	}

	/// cloud.sleet
	static var cloud_sleet: UIImage? {
		return UIImage(systemName: "cloud.sleet")
	}

	/// cloud.sleet.fill
	static var cloud_sleet_fill: UIImage? {
		return UIImage(systemName: "cloud.sleet.fill")
	}

	/// cloud.bolt
	static var cloud_bolt: UIImage? {
		return UIImage(systemName: "cloud.bolt")
	}

	/// cloud.bolt.fill
	static var cloud_bolt_fill: UIImage? {
		return UIImage(systemName: "cloud.bolt.fill")
	}

	/// cloud.bolt.rain
	static var cloud_bolt_rain: UIImage? {
		return UIImage(systemName: "cloud.bolt.rain")
	}

	/// cloud.bolt.rain.fill
	static var cloud_bolt_rain_fill: UIImage? {
		return UIImage(systemName: "cloud.bolt.rain.fill")
	}

	/// cloud.sun
	static var cloud_sun: UIImage? {
		return UIImage(systemName: "cloud.sun")
	}

	/// cloud.sun.fill
	static var cloud_sun_fill: UIImage? {
		return UIImage(systemName: "cloud.sun.fill")
	}

	/// cloud.sun.rain
	static var cloud_sun_rain: UIImage? {
		return UIImage(systemName: "cloud.sun.rain")
	}

	/// cloud.sun.rain.fill
	static var cloud_sun_rain_fill: UIImage? {
		return UIImage(systemName: "cloud.sun.rain.fill")
	}

	/// cloud.sun.bolt
	static var cloud_sun_bolt: UIImage? {
		return UIImage(systemName: "cloud.sun.bolt")
	}

	/// cloud.sun.bolt.fill
	static var cloud_sun_bolt_fill: UIImage? {
		return UIImage(systemName: "cloud.sun.bolt.fill")
	}

	/// cloud.moon
	static var cloud_moon: UIImage? {
		return UIImage(systemName: "cloud.moon")
	}

	/// cloud.moon.fill
	static var cloud_moon_fill: UIImage? {
		return UIImage(systemName: "cloud.moon.fill")
	}

	/// cloud.moon.rain
	static var cloud_moon_rain: UIImage? {
		return UIImage(systemName: "cloud.moon.rain")
	}

	/// cloud.moon.rain.fill
	static var cloud_moon_rain_fill: UIImage? {
		return UIImage(systemName: "cloud.moon.rain.fill")
	}

	/// cloud.moon.bolt
	static var cloud_moon_bolt: UIImage? {
		return UIImage(systemName: "cloud.moon.bolt")
	}

	/// cloud.moon.bolt.fill
	static var cloud_moon_bolt_fill: UIImage? {
		return UIImage(systemName: "cloud.moon.bolt.fill")
	}

	/// smoke
	static var smoke: UIImage? {
		return UIImage(systemName: "smoke")
	}

	/// smoke.fill
	static var smoke_fill: UIImage? {
		return UIImage(systemName: "smoke.fill")
	}

	/// wind
	static var wind: UIImage? {
		return UIImage(systemName: "wind")
	}

	/// wind.snow
	static var wind_snow: UIImage? {
		return UIImage(systemName: "wind.snow")
	}

	/// snowflake
	static var snowflake: UIImage? {
		return UIImage(systemName: "snowflake")
	}

	/// tornado
	static var tornado: UIImage? {
		return UIImage(systemName: "tornado")
	}

	/// tropicalstorm
	static var tropicalstorm: UIImage? {
		return UIImage(systemName: "tropicalstorm")
	}

	/// hurricane
	static var hurricane: UIImage? {
		return UIImage(systemName: "hurricane")
	}

	/// thermometer.sun
	static var thermometer_sun: UIImage? {
		return UIImage(systemName: "thermometer.sun")
	}

	/// thermometer.sun.fill
	static var thermometer_sun_fill: UIImage? {
		return UIImage(systemName: "thermometer.sun.fill")
	}

	/// thermometer.snowflake
	static var thermometer_snowflake: UIImage? {
		return UIImage(systemName: "thermometer.snowflake")
	}

	/// thermometer
	static var thermometer: UIImage? {
		return UIImage(systemName: "thermometer")
	}

	/// aqi.low
	static var aqi_low: UIImage? {
		return UIImage(systemName: "aqi.low")
	}

	/// aqi.medium
	static var aqi_medium: UIImage? {
		return UIImage(systemName: "aqi.medium")
	}

	/// aqi.high
	static var aqi_high: UIImage? {
		return UIImage(systemName: "aqi.high")
	}

	/// humidity
	static var humidity: UIImage? {
		return UIImage(systemName: "humidity")
	}

	/// humidity.fill
	static var humidity_fill: UIImage? {
		return UIImage(systemName: "humidity.fill")
	}

	/// umbrella
	static var umbrella: UIImage? {
		return UIImage(systemName: "umbrella")
	}

	/// umbrella.fill
	static var umbrella_fill: UIImage? {
		return UIImage(systemName: "umbrella.fill")
	}

	/// flame
	static var flame: UIImage? {
		return UIImage(systemName: "flame")
	}

	/// flame.fill
	static var flame_fill: UIImage? {
		return UIImage(systemName: "flame.fill")
	}

	/// light.min
	static var light_min: UIImage? {
		return UIImage(systemName: "light.min")
	}

	/// light.max
	static var light_max: UIImage? {
		return UIImage(systemName: "light.max")
	}

	/// rays
	static var rays: UIImage? {
		return UIImage(systemName: "rays")
	}

	/// slowmo
	static var slowmo: UIImage? {
		return UIImage(systemName: "slowmo")
	}

	/// timelapse
	static var timelapse: UIImage? {
		return UIImage(systemName: "timelapse")
	}

	/// cursorarrow.rays
	static var cursorarrow_rays: UIImage? {
		return UIImage(systemName: "cursorarrow.rays")
	}

	/// cursorarrow
	static var cursorarrow: UIImage? {
		return UIImage(systemName: "cursorarrow")
	}

	/// cursorarrow.square
	static var cursorarrow_square: UIImage? {
		return UIImage(systemName: "cursorarrow.square")
	}

	/// cursorarrow.and.square.on.square.dashed
	static var cursorarrow_and_square_on_square_dashed: UIImage? {
		return UIImage(systemName: "cursorarrow.and.square.on.square.dashed")
	}

	/// cursorarrow.click
	static var cursorarrow_click: UIImage? {
		return UIImage(systemName: "cursorarrow.click")
	}

	/// cursorarrow.click.2
	static var cursorarrow_click_2: UIImage? {
		return UIImage(systemName: "cursorarrow.click.2")
	}

	/// contextualmenu.and.cursorarrow
	static var contextualmenu_and_cursorarrow: UIImage? {
		return UIImage(systemName: "contextualmenu.and.cursorarrow")
	}

	/// filemenu.and.cursorarrow
	static var filemenu_and_cursorarrow: UIImage? {
		return UIImage(systemName: "filemenu.and.cursorarrow")
	}

	/// filemenu.and.selection
	static var filemenu_and_selection: UIImage? {
		return UIImage(systemName: "filemenu.and.selection")
	}

	/// dot.circle.and.hand.point.up.left.fill
	static var dot_circle_and_hand_point_up_left_fill: UIImage? {
		return UIImage(systemName: "dot.circle.and.hand.point.up.left.fill")
	}

	/// dot.circle.and.cursorarrow
	static var dot_circle_and_cursorarrow: UIImage? {
		return UIImage(systemName: "dot.circle.and.cursorarrow")
	}

	/// cursorarrow.motionlines
	static var cursorarrow_motionlines: UIImage? {
		return UIImage(systemName: "cursorarrow.motionlines")
	}

	/// cursorarrow.motionlines.click
	static var cursorarrow_motionlines_click: UIImage? {
		return UIImage(systemName: "cursorarrow.motionlines.click")
	}

	/// cursorarrow.click.badge.clock
	static var cursorarrow_click_badge_clock: UIImage? {
		return UIImage(systemName: "cursorarrow.click.badge.clock")
	}

	/// keyboard
	static var keyboard: UIImage? {
		return UIImage(systemName: "keyboard")
	}

	/// keyboard.fill
	static var keyboard_fill: UIImage? {
		return UIImage(systemName: "keyboard.fill")
	}

	/// keyboard.badge.ellipsis
	static var keyboard_badge_ellipsis: UIImage? {
		return UIImage(systemName: "keyboard.badge.ellipsis")
	}

	/// keyboard.chevron.compact.down
	static var keyboard_chevron_compact_down: UIImage? {
		return UIImage(systemName: "keyboard.chevron.compact.down")
	}

	/// keyboard.chevron.compact.left
	static var keyboard_chevron_compact_left: UIImage? {
		return UIImage(systemName: "keyboard.chevron.compact.left")
	}

	/// keyboard.onehanded.left
	static var keyboard_onehanded_left: UIImage? {
		return UIImage(systemName: "keyboard.onehanded.left")
	}

	/// keyboard.onehanded.right
	static var keyboard_onehanded_right: UIImage? {
		return UIImage(systemName: "keyboard.onehanded.right")
	}

	/// rectangle.3.offgrid
	static var rectangle_3_offgrid: UIImage? {
		return UIImage(systemName: "rectangle.3.offgrid")
	}

	/// rectangle.3.offgrid.fill
	static var rectangle_3_offgrid_fill: UIImage? {
		return UIImage(systemName: "rectangle.3.offgrid.fill")
	}

	/// square.grid.3x2
	static var square_grid_3x2: UIImage? {
		return UIImage(systemName: "square.grid.3x2")
	}

	/// square.grid.3x2.fill
	static var square_grid_3x2_fill: UIImage? {
		return UIImage(systemName: "square.grid.3x2.fill")
	}

	/// rectangle.grid.3x2
	static var rectangle_grid_3x2: UIImage? {
		return UIImage(systemName: "rectangle.grid.3x2")
	}

	/// rectangle.grid.3x2.fill
	static var rectangle_grid_3x2_fill: UIImage? {
		return UIImage(systemName: "rectangle.grid.3x2.fill")
	}

	/// square.grid.2x2
	static var square_grid_2x2: UIImage? {
		return UIImage(systemName: "square.grid.2x2")
	}

	/// square.grid.2x2.fill
	static var square_grid_2x2_fill: UIImage? {
		return UIImage(systemName: "square.grid.2x2.fill")
	}

	/// rectangle.grid.2x2
	static var rectangle_grid_2x2: UIImage? {
		return UIImage(systemName: "rectangle.grid.2x2")
	}

	/// rectangle.grid.2x2.fill
	static var rectangle_grid_2x2_fill: UIImage? {
		return UIImage(systemName: "rectangle.grid.2x2.fill")
	}

	/// square.grid.3x1.below.line.grid.1x2
	static var square_grid_3x1_below_line_grid_1x2: UIImage? {
		return UIImage(systemName: "square.grid.3x1.below.line.grid.1x2")
	}

	/// square.grid.3x1.fill.below.line.grid.1x2
	static var square_grid_3x1_fill_below_line_grid_1x2: UIImage? {
		return UIImage(systemName: "square.grid.3x1.fill.below.line.grid.1x2")
	}

	/// square.grid.4x3.fill
	static var square_grid_4x3_fill: UIImage? {
		return UIImage(systemName: "square.grid.4x3.fill")
	}

	/// rectangle.grid.1x2
	static var rectangle_grid_1x2: UIImage? {
		return UIImage(systemName: "rectangle.grid.1x2")
	}

	/// rectangle.grid.1x2.fill
	static var rectangle_grid_1x2_fill: UIImage? {
		return UIImage(systemName: "rectangle.grid.1x2.fill")
	}

	/// circle.grid.2x2
	static var circle_grid_2x2: UIImage? {
		return UIImage(systemName: "circle.grid.2x2")
	}

	/// circle.grid.2x2.fill
	static var circle_grid_2x2_fill: UIImage? {
		return UIImage(systemName: "circle.grid.2x2.fill")
	}

	/// circle.grid.3x3
	static var circle_grid_3x3: UIImage? {
		return UIImage(systemName: "circle.grid.3x3")
	}

	/// circle.grid.3x3.fill
	static var circle_grid_3x3_fill: UIImage? {
		return UIImage(systemName: "circle.grid.3x3.fill")
	}

	/// circle.grid.3x3.circle
	static var circle_grid_3x3_circle: UIImage? {
		return UIImage(systemName: "circle.grid.3x3.circle")
	}

	/// circle.grid.3x3.circle.fill
	static var circle_grid_3x3_circle_fill: UIImage? {
		return UIImage(systemName: "circle.grid.3x3.circle.fill")
	}

	/// square.grid.3x3
	static var square_grid_3x3: UIImage? {
		return UIImage(systemName: "square.grid.3x3")
	}

	/// square.grid.3x3.fill
	static var square_grid_3x3_fill: UIImage? {
		return UIImage(systemName: "square.grid.3x3.fill")
	}

	/// square.grid.3x3.topleft.filled
	static var square_grid_3x3_topleft_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.topleft.filled")
	}

	/// square.grid.3x3.topmiddle.filled
	static var square_grid_3x3_topmiddle_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.topmiddle.filled")
	}

	/// square.grid.3x3.topright.filled
	static var square_grid_3x3_topright_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.topright.filled")
	}

	/// square.grid.3x3.middleleft.filled
	static var square_grid_3x3_middleleft_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.middleleft.filled")
	}

	/// square.grid.3x3.middle.filled
	static var square_grid_3x3_middle_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.middle.filled")
	}

	/// square.grid.3x3.middleright.filled
	static var square_grid_3x3_middleright_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.middleright.filled")
	}

	/// square.grid.3x3.bottomleft.filled
	static var square_grid_3x3_bottomleft_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.bottomleft.filled")
	}

	/// square.grid.3x3.bottommiddle.filled
	static var square_grid_3x3_bottommiddle_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.bottommiddle.filled")
	}

	/// square.grid.3x3.bottomright.filled
	static var square_grid_3x3_bottomright_filled: UIImage? {
		return UIImage(systemName: "square.grid.3x3.bottomright.filled")
	}

	/// circle.hexagongrid
	static var circle_hexagongrid: UIImage? {
		return UIImage(systemName: "circle.hexagongrid")
	}

	/// circle.hexagongrid.fill
	static var circle_hexagongrid_fill: UIImage? {
		return UIImage(systemName: "circle.hexagongrid.fill")
	}

	/// circle.hexagongrid.circle
	static var circle_hexagongrid_circle: UIImage? {
		return UIImage(systemName: "circle.hexagongrid.circle")
	}

	/// circle.hexagongrid.circle.fill
	static var circle_hexagongrid_circle_fill: UIImage? {
		return UIImage(systemName: "circle.hexagongrid.circle.fill")
	}

	/// circle.hexagonpath
	static var circle_hexagonpath: UIImage? {
		return UIImage(systemName: "circle.hexagonpath")
	}

	/// circle.hexagonpath.fill
	static var circle_hexagonpath_fill: UIImage? {
		return UIImage(systemName: "circle.hexagonpath.fill")
	}

	/// circle.grid.cross
	static var circle_grid_cross: UIImage? {
		return UIImage(systemName: "circle.grid.cross")
	}

	/// circle.grid.cross.fill
	static var circle_grid_cross_fill: UIImage? {
		return UIImage(systemName: "circle.grid.cross.fill")
	}

	/// circle.grid.cross.left.fill
	static var circle_grid_cross_left_fill: UIImage? {
		return UIImage(systemName: "circle.grid.cross.left.fill")
	}

	/// circle.grid.cross.up.fill
	static var circle_grid_cross_up_fill: UIImage? {
		return UIImage(systemName: "circle.grid.cross.up.fill")
	}

	/// circle.grid.cross.right.fill
	static var circle_grid_cross_right_fill: UIImage? {
		return UIImage(systemName: "circle.grid.cross.right.fill")
	}

	/// circle.grid.cross.down.fill
	static var circle_grid_cross_down_fill: UIImage? {
		return UIImage(systemName: "circle.grid.cross.down.fill")
	}

	/// seal
	static var seal: UIImage? {
		return UIImage(systemName: "seal")
	}

	/// seal.fill
	static var seal_fill: UIImage? {
		return UIImage(systemName: "seal.fill")
	}

	/// checkmark.seal
	static var checkmark_seal: UIImage? {
		return UIImage(systemName: "checkmark.seal")
	}

	/// checkmark.seal.fill
	static var checkmark_seal_fill: UIImage? {
		return UIImage(systemName: "checkmark.seal.fill")
	}

	/// xmark.seal
	static var xmark_seal: UIImage? {
		return UIImage(systemName: "xmark.seal")
	}

	/// xmark.seal.fill
	static var xmark_seal_fill: UIImage? {
		return UIImage(systemName: "xmark.seal.fill")
	}

	/// exclamationmark.triangle
	static var exclamationmark_triangle: UIImage? {
		return UIImage(systemName: "exclamationmark.triangle")
	}

	/// exclamationmark.triangle.fill
	static var exclamationmark_triangle_fill: UIImage? {
		return UIImage(systemName: "exclamationmark.triangle.fill")
	}

	/// drop
	static var drop: UIImage? {
		return UIImage(systemName: "drop")
	}

	/// drop.fill
	static var drop_fill: UIImage? {
		return UIImage(systemName: "drop.fill")
	}

	/// drop.triangle
	static var drop_triangle: UIImage? {
		return UIImage(systemName: "drop.triangle")
	}

	/// drop.triangle.fill
	static var drop_triangle_fill: UIImage? {
		return UIImage(systemName: "drop.triangle.fill")
	}

	/// play
	static var play: UIImage? {
		return UIImage(systemName: "play")
	}

	/// play.fill
	static var play_fill: UIImage? {
		return UIImage(systemName: "play.fill")
	}

	/// play.circle
	static var play_circle: UIImage? {
		return UIImage(systemName: "play.circle")
	}

	/// play.circle.fill
	static var play_circle_fill: UIImage? {
		return UIImage(systemName: "play.circle.fill")
	}

	/// play.square
	static var play_square: UIImage? {
		return UIImage(systemName: "play.square")
	}

	/// play.square.fill
	static var play_square_fill: UIImage? {
		return UIImage(systemName: "play.square.fill")
	}

	/// play.rectangle
	static var play_rectangle: UIImage? {
		return UIImage(systemName: "play.rectangle")
	}

	/// play.rectangle.fill
	static var play_rectangle_fill: UIImage? {
		return UIImage(systemName: "play.rectangle.fill")
	}

	/// play.slash
	static var play_slash: UIImage? {
		return UIImage(systemName: "play.slash")
	}

	/// play.slash.fill
	static var play_slash_fill: UIImage? {
		return UIImage(systemName: "play.slash.fill")
	}

	/// pause
	static var pause: UIImage? {
		return UIImage(systemName: "pause")
	}

	/// pause.fill
	static var pause_fill: UIImage? {
		return UIImage(systemName: "pause.fill")
	}

	/// pause.circle
	static var pause_circle: UIImage? {
		return UIImage(systemName: "pause.circle")
	}

	/// pause.circle.fill
	static var pause_circle_fill: UIImage? {
		return UIImage(systemName: "pause.circle.fill")
	}

	/// pause.rectangle
	static var pause_rectangle: UIImage? {
		return UIImage(systemName: "pause.rectangle")
	}

	/// pause.rectangle.fill
	static var pause_rectangle_fill: UIImage? {
		return UIImage(systemName: "pause.rectangle.fill")
	}

	/// stop
	static var stop: UIImage? {
		return UIImage(systemName: "stop")
	}

	/// stop.fill
	static var stop_fill: UIImage? {
		return UIImage(systemName: "stop.fill")
	}

	/// stop.circle
	static var stop_circle: UIImage? {
		return UIImage(systemName: "stop.circle")
	}

	/// stop.circle.fill
	static var stop_circle_fill: UIImage? {
		return UIImage(systemName: "stop.circle.fill")
	}

	/// record.circle
	static var record_circle: UIImage? {
		return UIImage(systemName: "record.circle")
	}

	/// record.circle.fill
	static var record_circle_fill: UIImage? {
		return UIImage(systemName: "record.circle.fill")
	}

	/// playpause
	static var playpause: UIImage? {
		return UIImage(systemName: "playpause")
	}

	/// playpause.fill
	static var playpause_fill: UIImage? {
		return UIImage(systemName: "playpause.fill")
	}

	/// backward
	static var backward: UIImage? {
		return UIImage(systemName: "backward")
	}

	/// backward.fill
	static var backward_fill: UIImage? {
		return UIImage(systemName: "backward.fill")
	}

	/// backward.circle
	static var backward_circle: UIImage? {
		return UIImage(systemName: "backward.circle")
	}

	/// backward.circle.fill
	static var backward_circle_fill: UIImage? {
		return UIImage(systemName: "backward.circle.fill")
	}

	/// forward
	static var forward: UIImage? {
		return UIImage(systemName: "forward")
	}

	/// forward.fill
	static var forward_fill: UIImage? {
		return UIImage(systemName: "forward.fill")
	}

	/// forward.circle
	static var forward_circle: UIImage? {
		return UIImage(systemName: "forward.circle")
	}

	/// forward.circle.fill
	static var forward_circle_fill: UIImage? {
		return UIImage(systemName: "forward.circle.fill")
	}

	/// backward.end
	static var backward_end: UIImage? {
		return UIImage(systemName: "backward.end")
	}

	/// backward.end.fill
	static var backward_end_fill: UIImage? {
		return UIImage(systemName: "backward.end.fill")
	}

	/// forward.end
	static var forward_end: UIImage? {
		return UIImage(systemName: "forward.end")
	}

	/// forward.end.fill
	static var forward_end_fill: UIImage? {
		return UIImage(systemName: "forward.end.fill")
	}

	/// backward.end.alt
	static var backward_end_alt: UIImage? {
		return UIImage(systemName: "backward.end.alt")
	}

	/// backward.end.alt.fill
	static var backward_end_alt_fill: UIImage? {
		return UIImage(systemName: "backward.end.alt.fill")
	}

	/// forward.end.alt
	static var forward_end_alt: UIImage? {
		return UIImage(systemName: "forward.end.alt")
	}

	/// forward.end.alt.fill
	static var forward_end_alt_fill: UIImage? {
		return UIImage(systemName: "forward.end.alt.fill")
	}

	/// backward.frame
	static var backward_frame: UIImage? {
		return UIImage(systemName: "backward.frame")
	}

	/// backward.frame.fill
	static var backward_frame_fill: UIImage? {
		return UIImage(systemName: "backward.frame.fill")
	}

	/// forward.frame
	static var forward_frame: UIImage? {
		return UIImage(systemName: "forward.frame")
	}

	/// forward.frame.fill
	static var forward_frame_fill: UIImage? {
		return UIImage(systemName: "forward.frame.fill")
	}

	/// eject
	static var eject: UIImage? {
		return UIImage(systemName: "eject")
	}

	/// eject.fill
	static var eject_fill: UIImage? {
		return UIImage(systemName: "eject.fill")
	}

	/// eject.circle
	static var eject_circle: UIImage? {
		return UIImage(systemName: "eject.circle")
	}

	/// eject.circle.fill
	static var eject_circle_fill: UIImage? {
		return UIImage(systemName: "eject.circle.fill")
	}

	/// mount
	static var mount: UIImage? {
		return UIImage(systemName: "mount")
	}

	/// mount.fill
	static var mount_fill: UIImage? {
		return UIImage(systemName: "mount.fill")
	}

	/// memories
	static var memories: UIImage? {
		return UIImage(systemName: "memories")
	}

	/// memories.badge.plus
	static var memories_badge_plus: UIImage? {
		return UIImage(systemName: "memories.badge.plus")
	}

	/// memories.badge.minus
	static var memories_badge_minus: UIImage? {
		return UIImage(systemName: "memories.badge.minus")
	}

	/// shuffle
	static var shuffle: UIImage? {
		return UIImage(systemName: "shuffle")
	}

	/// shuffle.circle
	static var shuffle_circle: UIImage? {
		return UIImage(systemName: "shuffle.circle")
	}

	/// shuffle.circle.fill
	static var shuffle_circle_fill: UIImage? {
		return UIImage(systemName: "shuffle.circle.fill")
	}

	/// repeat
	static var repeat_Image: UIImage? {
		return UIImage(systemName: "repeat")
	}

	/// repeat.circle
	static var repeat_circle: UIImage? {
		return UIImage(systemName: "repeat.circle")
	}

	/// repeat.circle.fill
	static var repeat_circle_fill: UIImage? {
		return UIImage(systemName: "repeat.circle.fill")
	}

	/// repeat.1
	static var repeat_1: UIImage? {
		return UIImage(systemName: "repeat.1")
	}

	/// repeat.1.circle
	static var repeat_1_circle: UIImage? {
		return UIImage(systemName: "repeat.1.circle")
	}

	/// repeat.1.circle.fill
	static var repeat_1_circle_fill: UIImage? {
		return UIImage(systemName: "repeat.1.circle.fill")
	}

	/// infinity
	static var infinity: UIImage? {
		return UIImage(systemName: "infinity")
	}

	/// infinity.circle
	static var infinity_circle: UIImage? {
		return UIImage(systemName: "infinity.circle")
	}

	/// infinity.circle.fill
	static var infinity_circle_fill: UIImage? {
		return UIImage(systemName: "infinity.circle.fill")
	}

	/// megaphone
	static var megaphone: UIImage? {
		return UIImage(systemName: "megaphone")
	}

	/// megaphone.fill
	static var megaphone_fill: UIImage? {
		return UIImage(systemName: "megaphone.fill")
	}

	/// speaker
	static var speaker: UIImage? {
		return UIImage(systemName: "speaker")
	}

	/// speaker.fill
	static var speaker_fill: UIImage? {
		return UIImage(systemName: "speaker.fill")
	}

	/// speaker.circle
	static var speaker_circle: UIImage? {
		return UIImage(systemName: "speaker.circle")
	}

	/// speaker.circle.fill
	static var speaker_circle_fill: UIImage? {
		return UIImage(systemName: "speaker.circle.fill")
	}

	/// speaker.slash
	static var speaker_slash: UIImage? {
		return UIImage(systemName: "speaker.slash")
	}

	/// speaker.slash.fill
	static var speaker_slash_fill: UIImage? {
		return UIImage(systemName: "speaker.slash.fill")
	}

	/// speaker.slash.circle
	static var speaker_slash_circle: UIImage? {
		return UIImage(systemName: "speaker.slash.circle")
	}

	/// speaker.slash.circle.fill
	static var speaker_slash_circle_fill: UIImage? {
		return UIImage(systemName: "speaker.slash.circle.fill")
	}

	/// speaker.zzz
	static var speaker_zzz: UIImage? {
		return UIImage(systemName: "speaker.zzz")
	}

	/// speaker.zzz.fill
	static var speaker_zzz_fill: UIImage? {
		return UIImage(systemName: "speaker.zzz.fill")
	}

	/// speaker.wave.1
	static var speaker_wave_1: UIImage? {
		return UIImage(systemName: "speaker.wave.1")
	}

	/// speaker.wave.1.fill
	static var speaker_wave_1_fill: UIImage? {
		return UIImage(systemName: "speaker.wave.1.fill")
	}

	/// speaker.wave.2
	static var speaker_wave_2: UIImage? {
		return UIImage(systemName: "speaker.wave.2")
	}

	/// speaker.wave.2.fill
	static var speaker_wave_2_fill: UIImage? {
		return UIImage(systemName: "speaker.wave.2.fill")
	}

	/// speaker.wave.2.circle
	static var speaker_wave_2_circle: UIImage? {
		return UIImage(systemName: "speaker.wave.2.circle")
	}

	/// speaker.wave.2.circle.fill
	static var speaker_wave_2_circle_fill: UIImage? {
		return UIImage(systemName: "speaker.wave.2.circle.fill")
	}

	/// speaker.wave.3
	static var speaker_wave_3: UIImage? {
		return UIImage(systemName: "speaker.wave.3")
	}

	/// speaker.wave.3.fill
	static var speaker_wave_3_fill: UIImage? {
		return UIImage(systemName: "speaker.wave.3.fill")
	}

	/// speaker.badge.exclamationmark
	static var speaker_badge_exclamationmark: UIImage? {
		return UIImage(systemName: "speaker.badge.exclamationmark")
	}

	/// speaker.badge.exclamationmark.fill
	static var speaker_badge_exclamationmark_fill: UIImage? {
		return UIImage(systemName: "speaker.badge.exclamationmark.fill")
	}

	/// badge.plus.radiowaves.right
	static var badge_plus_radiowaves_right: UIImage? {
		return UIImage(systemName: "badge.plus.radiowaves.right")
	}

	/// badge.plus.radiowaves.forward
	static var badge_plus_radiowaves_forward: UIImage? {
		return UIImage(systemName: "badge.plus.radiowaves.forward")
	}

	/// music.note
	static var music_note: UIImage? {
		return UIImage(systemName: "music.note")
	}

	/// music.note.list
	static var music_note_list: UIImage? {
		return UIImage(systemName: "music.note.list")
	}

	/// music.quarternote.3
	static var music_quarternote_3: UIImage? {
		return UIImage(systemName: "music.quarternote.3")
	}

	/// music.mic
	static var music_mic: UIImage? {
		return UIImage(systemName: "music.mic")
	}

	/// music.mic.circle
	static var music_mic_circle: UIImage? {
		return UIImage(systemName: "music.mic.circle")
	}

	/// music.mic.circle.fill
	static var music_mic_circle_fill: UIImage? {
		return UIImage(systemName: "music.mic.circle.fill")
	}

	/// arrow.rectanglepath
	static var arrow_rectanglepath: UIImage? {
		return UIImage(systemName: "arrow.rectanglepath")
	}

	/// goforward
	static var goforward: UIImage? {
		return UIImage(systemName: "goforward")
	}

	/// gobackward
	static var gobackward: UIImage? {
		return UIImage(systemName: "gobackward")
	}

	/// goforward.5
	static var goforward_5: UIImage? {
		return UIImage(systemName: "goforward.5")
	}

	/// gobackward.5
	static var gobackward_5: UIImage? {
		return UIImage(systemName: "gobackward.5")
	}

	/// goforward.10
	static var goforward_10: UIImage? {
		return UIImage(systemName: "goforward.10")
	}

	/// gobackward.10
	static var gobackward_10: UIImage? {
		return UIImage(systemName: "gobackward.10")
	}

	/// goforward.15
	static var goforward_15: UIImage? {
		return UIImage(systemName: "goforward.15")
	}

	/// gobackward.15
	static var gobackward_15: UIImage? {
		return UIImage(systemName: "gobackward.15")
	}

	/// goforward.30
	static var goforward_30: UIImage? {
		return UIImage(systemName: "goforward.30")
	}

	/// gobackward.30
	static var gobackward_30: UIImage? {
		return UIImage(systemName: "gobackward.30")
	}

	/// goforward.45
	static var goforward_45: UIImage? {
		return UIImage(systemName: "goforward.45")
	}

	/// gobackward.45
	static var gobackward_45: UIImage? {
		return UIImage(systemName: "gobackward.45")
	}

	/// goforward.60
	static var goforward_60: UIImage? {
		return UIImage(systemName: "goforward.60")
	}

	/// gobackward.60
	static var gobackward_60: UIImage? {
		return UIImage(systemName: "gobackward.60")
	}

	/// goforward.75
	static var goforward_75: UIImage? {
		return UIImage(systemName: "goforward.75")
	}

	/// gobackward.75
	static var gobackward_75: UIImage? {
		return UIImage(systemName: "gobackward.75")
	}

	/// goforward.90
	static var goforward_90: UIImage? {
		return UIImage(systemName: "goforward.90")
	}

	/// gobackward.90
	static var gobackward_90: UIImage? {
		return UIImage(systemName: "gobackward.90")
	}

	/// goforward.plus
	static var goforward_plus: UIImage? {
		return UIImage(systemName: "goforward.plus")
	}

	/// gobackward.minus
	static var gobackward_minus: UIImage? {
		return UIImage(systemName: "gobackward.minus")
	}

	/// swift
	static var swift: UIImage? {
		return UIImage(systemName: "swift")
	}

	/// magnifyingglass
	static var magnifyingglass: UIImage? {
		return UIImage(systemName: "magnifyingglass")
	}

	/// magnifyingglass.circle
	static var magnifyingglass_circle: UIImage? {
		return UIImage(systemName: "magnifyingglass.circle")
	}

	/// magnifyingglass.circle.fill
	static var magnifyingglass_circle_fill: UIImage? {
		return UIImage(systemName: "magnifyingglass.circle.fill")
	}

	/// plus.magnifyingglass
	static var plus_magnifyingglass: UIImage? {
		return UIImage(systemName: "plus.magnifyingglass")
	}

	/// minus.magnifyingglass
	static var minus_magnifyingglass: UIImage? {
		return UIImage(systemName: "minus.magnifyingglass")
	}

	/// 1.magnifyingglass
	static var magnifyingglass_1: UIImage? {
		return UIImage(systemName: "1.magnifyingglass")
	}

	/// arrow.up.left.and.down.right.magnifyingglass
	static var arrow_up_left_and_down_right_magnifyingglass: UIImage? {
		return UIImage(systemName: "arrow.up.left.and.down.right.magnifyingglass")
	}

	/// text.magnifyingglass
	static var text_magnifyingglass: UIImage? {
		return UIImage(systemName: "text.magnifyingglass")
	}

	/// loupe
	static var loupe: UIImage? {
		return UIImage(systemName: "loupe")
	}

	/// mic
	static var mic: UIImage? {
		return UIImage(systemName: "mic")
	}

	/// mic.fill
	static var mic_fill: UIImage? {
		return UIImage(systemName: "mic.fill")
	}

	/// mic.circle
	static var mic_circle: UIImage? {
		return UIImage(systemName: "mic.circle")
	}

	/// mic.circle.fill
	static var mic_circle_fill: UIImage? {
		return UIImage(systemName: "mic.circle.fill")
	}

	/// mic.square
	static var mic_square: UIImage? {
		return UIImage(systemName: "mic.square")
	}

	/// mic.square.fill
	static var mic_square_fill: UIImage? {
		return UIImage(systemName: "mic.square.fill")
	}

	/// mic.slash
	static var mic_slash: UIImage? {
		return UIImage(systemName: "mic.slash")
	}

	/// mic.slash.fill
	static var mic_slash_fill: UIImage? {
		return UIImage(systemName: "mic.slash.fill")
	}

	/// mic.slash.circle
	static var mic_slash_circle: UIImage? {
		return UIImage(systemName: "mic.slash.circle")
	}

	/// mic.slash.circle.fill
	static var mic_slash_circle_fill: UIImage? {
		return UIImage(systemName: "mic.slash.circle.fill")
	}

	/// mic.badge.plus
	static var mic_badge_plus: UIImage? {
		return UIImage(systemName: "mic.badge.plus")
	}

	/// mic.fill.badge.plus
	static var mic_fill_badge_plus: UIImage? {
		return UIImage(systemName: "mic.fill.badge.plus")
	}

	/// line.diagonal
	static var line_diagonal: UIImage? {
		return UIImage(systemName: "line.diagonal")
	}

	/// line.diagonal.arrow
	static var line_diagonal_arrow: UIImage? {
		return UIImage(systemName: "line.diagonal.arrow")
	}

	/// circle
	static var circle: UIImage? {
		return UIImage(systemName: "circle")
	}

	/// circle.fill
	static var circle_fill: UIImage? {
		return UIImage(systemName: "circle.fill")
	}

	/// circle.slash
	static var circle_slash: UIImage? {
		return UIImage(systemName: "circle.slash")
	}

	/// circle.slash.fill
	static var circle_slash_fill: UIImage? {
		return UIImage(systemName: "circle.slash.fill")
	}

	/// circle.lefthalf.filled
	static var circle_lefthalf_filled: UIImage? {
		return UIImage(systemName: "circle.lefthalf.filled")
	}

	/// circle.righthalf.filled
	static var circle_righthalf_filled: UIImage? {
		return UIImage(systemName: "circle.righthalf.filled")
	}

	/// circle.tophalf.filled
	static var circle_tophalf_filled: UIImage? {
		return UIImage(systemName: "circle.tophalf.filled")
	}

	/// circle.bottomhalf.filled
	static var circle_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "circle.bottomhalf.filled")
	}

	/// circle.inset.filled
	static var circle_inset_filled: UIImage? {
		return UIImage(systemName: "circle.inset.filled")
	}

	/// smallcircle.fill.circle
	static var smallcircle_fill_circle: UIImage? {
		return UIImage(systemName: "smallcircle.fill.circle")
	}

	/// smallcircle.fill.circle.fill
	static var smallcircle_fill_circle_fill: UIImage? {
		return UIImage(systemName: "smallcircle.fill.circle.fill")
	}

	/// circle.dashed
	static var circle_dashed: UIImage? {
		return UIImage(systemName: "circle.dashed")
	}

	/// circle.dashed.inset.filled
	static var circle_dashed_inset_filled: UIImage? {
		return UIImage(systemName: "circle.dashed.inset.filled")
	}

	/// circlebadge
	static var circlebadge: UIImage? {
		return UIImage(systemName: "circlebadge")
	}

	/// circlebadge.fill
	static var circlebadge_fill: UIImage? {
		return UIImage(systemName: "circlebadge.fill")
	}

	/// circlebadge.2
	static var circlebadge_2: UIImage? {
		return UIImage(systemName: "circlebadge.2")
	}

	/// circlebadge.2.fill
	static var circlebadge_2_fill: UIImage? {
		return UIImage(systemName: "circlebadge.2.fill")
	}

	/// smallcircle.circle
	static var smallcircle_circle: UIImage? {
		return UIImage(systemName: "smallcircle.circle")
	}

	/// smallcircle.circle.fill
	static var smallcircle_circle_fill: UIImage? {
		return UIImage(systemName: "smallcircle.circle.fill")
	}

	/// target
	static var target: UIImage? {
		return UIImage(systemName: "target")
	}

	/// capsule
	static var capsule: UIImage? {
		return UIImage(systemName: "capsule")
	}

	/// capsule.fill
	static var capsule_fill: UIImage? {
		return UIImage(systemName: "capsule.fill")
	}

	/// capsule.lefthalf.filled
	static var capsule_lefthalf_filled: UIImage? {
		return UIImage(systemName: "capsule.lefthalf.filled")
	}

	/// capsule.righthalf.filled
	static var capsule_righthalf_filled: UIImage? {
		return UIImage(systemName: "capsule.righthalf.filled")
	}

	/// capsule.tophalf.filled
	static var capsule_tophalf_filled: UIImage? {
		return UIImage(systemName: "capsule.tophalf.filled")
	}

	/// capsule.bottomhalf.filled
	static var capsule_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "capsule.bottomhalf.filled")
	}

	/// capsule.inset.filled
	static var capsule_inset_filled: UIImage? {
		return UIImage(systemName: "capsule.inset.filled")
	}

	/// capsule.portrait
	static var capsule_portrait: UIImage? {
		return UIImage(systemName: "capsule.portrait")
	}

	/// capsule.portrait.fill
	static var capsule_portrait_fill: UIImage? {
		return UIImage(systemName: "capsule.portrait.fill")
	}

	/// capsule.portrait.lefthalf.filled
	static var capsule_portrait_lefthalf_filled: UIImage? {
		return UIImage(systemName: "capsule.portrait.lefthalf.filled")
	}

	/// capsule.portrait.righthalf.filled
	static var capsule_portrait_righthalf_filled: UIImage? {
		return UIImage(systemName: "capsule.portrait.righthalf.filled")
	}

	/// capsule.portrait.tophalf.filled
	static var capsule_portrait_tophalf_filled: UIImage? {
		return UIImage(systemName: "capsule.portrait.tophalf.filled")
	}

	/// capsule.portrait.bottomhalf.filled
	static var capsule_portrait_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "capsule.portrait.bottomhalf.filled")
	}

	/// capsule.portrait.inset.filled
	static var capsule_portrait_inset_filled: UIImage? {
		return UIImage(systemName: "capsule.portrait.inset.filled")
	}

	/// oval
	static var oval: UIImage? {
		return UIImage(systemName: "oval")
	}

	/// oval.fill
	static var oval_fill: UIImage? {
		return UIImage(systemName: "oval.fill")
	}

	/// oval.lefthalf.filled
	static var oval_lefthalf_filled: UIImage? {
		return UIImage(systemName: "oval.lefthalf.filled")
	}

	/// oval.righthalf.filled
	static var oval_righthalf_filled: UIImage? {
		return UIImage(systemName: "oval.righthalf.filled")
	}

	/// oval.tophalf.filled
	static var oval_tophalf_filled: UIImage? {
		return UIImage(systemName: "oval.tophalf.filled")
	}

	/// oval.bottomhalf.filled
	static var oval_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "oval.bottomhalf.filled")
	}

	/// oval.inset.filled
	static var oval_inset_filled: UIImage? {
		return UIImage(systemName: "oval.inset.filled")
	}

	/// oval.portrait
	static var oval_portrait: UIImage? {
		return UIImage(systemName: "oval.portrait")
	}

	/// oval.portrait.fill
	static var oval_portrait_fill: UIImage? {
		return UIImage(systemName: "oval.portrait.fill")
	}

	/// oval.portrait.lefthalf.filled
	static var oval_portrait_lefthalf_filled: UIImage? {
		return UIImage(systemName: "oval.portrait.lefthalf.filled")
	}

	/// oval.portrait.righthalf.filled
	static var oval_portrait_righthalf_filled: UIImage? {
		return UIImage(systemName: "oval.portrait.righthalf.filled")
	}

	/// oval.portrait.tophalf.filled
	static var oval_portrait_tophalf_filled: UIImage? {
		return UIImage(systemName: "oval.portrait.tophalf.filled")
	}

	/// oval.portrait.bottomhalf.filled
	static var oval_portrait_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "oval.portrait.bottomhalf.filled")
	}

	/// oval.portrait.inset.filled
	static var oval_portrait_inset_filled: UIImage? {
		return UIImage(systemName: "oval.portrait.inset.filled")
	}

	/// placeholdertext.fill
	static var placeholdertext_fill: UIImage? {
		return UIImage(systemName: "placeholdertext.fill")
	}

	/// square
	static var square: UIImage? {
		return UIImage(systemName: "square")
	}

	/// square.fill
	static var square_fill: UIImage? {
		return UIImage(systemName: "square.fill")
	}

	/// square.slash
	static var square_slash: UIImage? {
		return UIImage(systemName: "square.slash")
	}

	/// square.slash.fill
	static var square_slash_fill: UIImage? {
		return UIImage(systemName: "square.slash.fill")
	}

	/// square.lefthalf.filled
	static var square_lefthalf_filled: UIImage? {
		return UIImage(systemName: "square.lefthalf.filled")
	}

	/// square.righthalf.filled
	static var square_righthalf_filled: UIImage? {
		return UIImage(systemName: "square.righthalf.filled")
	}

	/// square.tophalf.filled
	static var square_tophalf_filled: UIImage? {
		return UIImage(systemName: "square.tophalf.filled")
	}

	/// square.bottomhalf.filled
	static var square_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "square.bottomhalf.filled")
	}

	/// square.inset.filled
	static var square_inset_filled: UIImage? {
		return UIImage(systemName: "square.inset.filled")
	}

	/// square.split.2x1
	static var square_split_2x1: UIImage? {
		return UIImage(systemName: "square.split.2x1")
	}

	/// square.split.2x1.fill
	static var square_split_2x1_fill: UIImage? {
		return UIImage(systemName: "square.split.2x1.fill")
	}

	/// square.split.1x2
	static var square_split_1x2: UIImage? {
		return UIImage(systemName: "square.split.1x2")
	}

	/// square.split.1x2.fill
	static var square_split_1x2_fill: UIImage? {
		return UIImage(systemName: "square.split.1x2.fill")
	}

	/// square.split.2x2
	static var square_split_2x2: UIImage? {
		return UIImage(systemName: "square.split.2x2")
	}

	/// square.split.2x2.fill
	static var square_split_2x2_fill: UIImage? {
		return UIImage(systemName: "square.split.2x2.fill")
	}

	/// square.split.diagonal.2x2
	static var square_split_diagonal_2x2: UIImage? {
		return UIImage(systemName: "square.split.diagonal.2x2")
	}

	/// square.split.diagonal.2x2.fill
	static var square_split_diagonal_2x2_fill: UIImage? {
		return UIImage(systemName: "square.split.diagonal.2x2.fill")
	}

	/// square.split.diagonal
	static var square_split_diagonal: UIImage? {
		return UIImage(systemName: "square.split.diagonal")
	}

	/// square.split.diagonal.fill
	static var square_split_diagonal_fill: UIImage? {
		return UIImage(systemName: "square.split.diagonal.fill")
	}

	/// dot.square
	static var dot_square: UIImage? {
		return UIImage(systemName: "dot.square")
	}

	/// dot.square.fill
	static var dot_square_fill: UIImage? {
		return UIImage(systemName: "dot.square.fill")
	}

	/// circle.square
	static var circle_square: UIImage? {
		return UIImage(systemName: "circle.square")
	}

	/// circle.fill.square.fill
	static var circle_fill_square_fill: UIImage? {
		return UIImage(systemName: "circle.fill.square.fill")
	}

	/// square.dashed
	static var square_dashed: UIImage? {
		return UIImage(systemName: "square.dashed")
	}

	/// square.dashed.inset.filled
	static var square_dashed_inset_filled: UIImage? {
		return UIImage(systemName: "square.dashed.inset.filled")
	}

	/// questionmark.square.dashed
	static var questionmark_square_dashed: UIImage? {
		return UIImage(systemName: "questionmark.square.dashed")
	}

	/// square.on.square
	static var square_on_square: UIImage? {
		return UIImage(systemName: "square.on.square")
	}

	/// square.fill.on.square.fill
	static var square_fill_on_square_fill: UIImage? {
		return UIImage(systemName: "square.fill.on.square.fill")
	}

	/// square.filled.on.square
	static var square_filled_on_square: UIImage? {
		return UIImage(systemName: "square.filled.on.square")
	}

	/// sparkles.square.filled.on.square
	static var sparkles_square_filled_on_square: UIImage? {
		return UIImage(systemName: "sparkles.square.filled.on.square")
	}

	/// square.on.square.dashed
	static var square_on_square_dashed: UIImage? {
		return UIImage(systemName: "square.on.square.dashed")
	}

	/// plus.square.on.square
	static var plus_square_on_square: UIImage? {
		return UIImage(systemName: "plus.square.on.square")
	}

	/// plus.square.fill.on.square.fill
	static var plus_square_fill_on_square_fill: UIImage? {
		return UIImage(systemName: "plus.square.fill.on.square.fill")
	}

	/// square.on.circle
	static var square_on_circle: UIImage? {
		return UIImage(systemName: "square.on.circle")
	}

	/// square.fill.on.circle.fill
	static var square_fill_on_circle_fill: UIImage? {
		return UIImage(systemName: "square.fill.on.circle.fill")
	}

	/// r.square.on.square
	static var r_square_on_square: UIImage? {
		return UIImage(systemName: "r.square.on.square")
	}

	/// r.square.on.square.fill
	static var r_square_on_square_fill: UIImage? {
		return UIImage(systemName: "r.square.on.square.fill")
	}

	/// j.square.on.square
	static var j_square_on_square: UIImage? {
		return UIImage(systemName: "j.square.on.square")
	}

	/// j.square.on.square.fill
	static var j_square_on_square_fill: UIImage? {
		return UIImage(systemName: "j.square.on.square.fill")
	}

	/// h.square.on.square
	static var h_square_on_square: UIImage? {
		return UIImage(systemName: "h.square.on.square")
	}

	/// h.square.on.square.fill
	static var h_square_on_square_fill: UIImage? {
		return UIImage(systemName: "h.square.on.square.fill")
	}

	/// square.stack
	static var square_stack: UIImage? {
		return UIImage(systemName: "square.stack")
	}

	/// square.stack.fill
	static var square_stack_fill: UIImage? {
		return UIImage(systemName: "square.stack.fill")
	}

	/// squareshape
	static var squareshape: UIImage? {
		return UIImage(systemName: "squareshape")
	}

	/// squareshape.fill
	static var squareshape_fill: UIImage? {
		return UIImage(systemName: "squareshape.fill")
	}

	/// squareshape.dashed.squareshape
	static var squareshape_dashed_squareshape: UIImage? {
		return UIImage(systemName: "squareshape.dashed.squareshape")
	}

	/// squareshape.squareshape.dashed
	static var squareshape_squareshape_dashed: UIImage? {
		return UIImage(systemName: "squareshape.squareshape.dashed")
	}

	/// dot.squareshape
	static var dot_squareshape: UIImage? {
		return UIImage(systemName: "dot.squareshape")
	}

	/// dot.squareshape.fill
	static var dot_squareshape_fill: UIImage? {
		return UIImage(systemName: "dot.squareshape.fill")
	}

	/// app
	static var app: UIImage? {
		return UIImage(systemName: "app")
	}

	/// app.fill
	static var app_fill: UIImage? {
		return UIImage(systemName: "app.fill")
	}

	/// rectangle
	static var rectangle: UIImage? {
		return UIImage(systemName: "rectangle")
	}

	/// rectangle.fill
	static var rectangle_fill: UIImage? {
		return UIImage(systemName: "rectangle.fill")
	}

	/// rectangle.slash
	static var rectangle_slash: UIImage? {
		return UIImage(systemName: "rectangle.slash")
	}

	/// rectangle.slash.fill
	static var rectangle_slash_fill: UIImage? {
		return UIImage(systemName: "rectangle.slash.fill")
	}

	/// rectangle.lefthalf.filled
	static var rectangle_lefthalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.lefthalf.filled")
	}

	/// rectangle.righthalf.filled
	static var rectangle_righthalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.righthalf.filled")
	}

	/// rectangle.tophalf.filled
	static var rectangle_tophalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.tophalf.filled")
	}

	/// rectangle.bottomhalf.filled
	static var rectangle_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.bottomhalf.filled")
	}

	/// rectangle.split.2x1
	static var rectangle_split_2x1: UIImage? {
		return UIImage(systemName: "rectangle.split.2x1")
	}

	/// rectangle.split.2x1.fill
	static var rectangle_split_2x1_fill: UIImage? {
		return UIImage(systemName: "rectangle.split.2x1.fill")
	}

	/// rectangle.split.2x1.slash
	static var rectangle_split_2x1_slash: UIImage? {
		return UIImage(systemName: "rectangle.split.2x1.slash")
	}

	/// rectangle.split.2x1.slash.fill
	static var rectangle_split_2x1_slash_fill: UIImage? {
		return UIImage(systemName: "rectangle.split.2x1.slash.fill")
	}

	/// rectangle.split.1x2
	static var rectangle_split_1x2: UIImage? {
		return UIImage(systemName: "rectangle.split.1x2")
	}

	/// rectangle.split.1x2.fill
	static var rectangle_split_1x2_fill: UIImage? {
		return UIImage(systemName: "rectangle.split.1x2.fill")
	}

	/// rectangle.split.3x1
	static var rectangle_split_3x1: UIImage? {
		return UIImage(systemName: "rectangle.split.3x1")
	}

	/// rectangle.split.3x1.fill
	static var rectangle_split_3x1_fill: UIImage? {
		return UIImage(systemName: "rectangle.split.3x1.fill")
	}

	/// rectangle.split.2x2
	static var rectangle_split_2x2: UIImage? {
		return UIImage(systemName: "rectangle.split.2x2")
	}

	/// rectangle.split.2x2.fill
	static var rectangle_split_2x2_fill: UIImage? {
		return UIImage(systemName: "rectangle.split.2x2.fill")
	}

	/// tablecells
	static var tablecells: UIImage? {
		return UIImage(systemName: "tablecells")
	}

	/// tablecells.fill
	static var tablecells_fill: UIImage? {
		return UIImage(systemName: "tablecells.fill")
	}

	/// tablecells.badge.ellipsis
	static var tablecells_badge_ellipsis: UIImage? {
		return UIImage(systemName: "tablecells.badge.ellipsis")
	}

	/// tablecells.fill.badge.ellipsis
	static var tablecells_fill_badge_ellipsis: UIImage? {
		return UIImage(systemName: "tablecells.fill.badge.ellipsis")
	}

	/// rectangle.split.3x3
	static var rectangle_split_3x3: UIImage? {
		return UIImage(systemName: "rectangle.split.3x3")
	}

	/// rectangle.inset.fill
	static var rectangle_inset_fill: UIImage? {
		return UIImage(systemName: "rectangle.inset.fill")
	}

	/// rectangle.tophalf.inset.filled
	static var rectangle_tophalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.tophalf.inset.filled")
	}

	/// rectangle.bottomhalf.inset.filled
	static var rectangle_bottomhalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.bottomhalf.inset.filled")
	}

	/// rectangle.lefthalf.inset.filled
	static var rectangle_lefthalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.lefthalf.inset.filled")
	}

	/// rectangle.righthalf.inset.filled
	static var rectangle_righthalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.righthalf.inset.filled")
	}

	/// rectangle.leadinghalf.inset.filled
	static var rectangle_leadinghalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.leadinghalf.inset.filled")
	}

	/// rectangle.trailinghalf.inset.filled
	static var rectangle_trailinghalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.trailinghalf.inset.filled")
	}

	/// rectangle.lefthalf.inset.filled.arrow.left
	static var rectangle_lefthalf_inset_filled_arrow_left: UIImage? {
		return UIImage(systemName: "rectangle.lefthalf.inset.filled.arrow.left")
	}

	/// rectangle.righthalf.inset.filled.arrow.right
	static var rectangle_righthalf_inset_filled_arrow_right: UIImage? {
		return UIImage(systemName: "rectangle.righthalf.inset.filled.arrow.right")
	}

	/// rectangle.leadinghalf.inset.filled.arrow.leading
	static var rectangle_leadinghalf_inset_filled_arrow_leading: UIImage? {
		return UIImage(systemName: "rectangle.leadinghalf.inset.filled.arrow.leading")
	}

	/// rectangle.trailinghalf.inset.filled.arrow.trailing
	static var rectangle_trailinghalf_inset_filled_arrow_trailing: UIImage? {
		return UIImage(systemName: "rectangle.trailinghalf.inset.filled.arrow.trailing")
	}

	/// rectangle.topthird.inset.filled
	static var rectangle_topthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.topthird.inset.filled")
	}

	/// rectangle.bottomthird.inset.filled
	static var rectangle_bottomthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.bottomthird.inset.filled")
	}

	/// rectangle.leftthird.inset.filled
	static var rectangle_leftthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.leftthird.inset.filled")
	}

	/// rectangle.rightthird.inset.filled
	static var rectangle_rightthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.rightthird.inset.filled")
	}

	/// rectangle.leadingthird.inset.filled
	static var rectangle_leadingthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.leadingthird.inset.filled")
	}

	/// rectangle.trailingthird.inset.filled
	static var rectangle_trailingthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.trailingthird.inset.filled")
	}

	/// rectangle.center.inset.filled
	static var rectangle_center_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.center.inset.filled")
	}

	/// rectangle.inset.topleft.filled
	static var rectangle_inset_topleft_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.topleft.filled")
	}

	/// rectangle.inset.topright.filled
	static var rectangle_inset_topright_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.topright.filled")
	}

	/// rectangle.inset.topleading.filled
	static var rectangle_inset_topleading_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.topleading.filled")
	}

	/// rectangle.inset.toptrailing.filled
	static var rectangle_inset_toptrailing_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.toptrailing.filled")
	}

	/// rectangle.inset.bottomleft.filled
	static var rectangle_inset_bottomleft_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.bottomleft.filled")
	}

	/// rectangle.inset.bottomright.filled
	static var rectangle_inset_bottomright_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.bottomright.filled")
	}

	/// rectangle.inset.bottomleading.filled
	static var rectangle_inset_bottomleading_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.bottomleading.filled")
	}

	/// rectangle.inset.bottomtrailing.filled
	static var rectangle_inset_bottomtrailing_filled: UIImage? {
		return UIImage(systemName: "rectangle.inset.bottomtrailing.filled")
	}

	/// rectangle.on.rectangle
	static var rectangle_on_rectangle: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle")
	}

	/// rectangle.fill.on.rectangle.fill
	static var rectangle_fill_on_rectangle_fill: UIImage? {
		return UIImage(systemName: "rectangle.fill.on.rectangle.fill")
	}

	/// rectangle.on.rectangle.circle
	static var rectangle_on_rectangle_circle: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.circle")
	}

	/// rectangle.on.rectangle.circle.fill
	static var rectangle_on_rectangle_circle_fill: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.circle.fill")
	}

	/// rectangle.on.rectangle.square
	static var rectangle_on_rectangle_square: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.square")
	}

	/// rectangle.on.rectangle.square.fill
	static var rectangle_on_rectangle_square_fill: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.square.fill")
	}

	/// rectangle.inset.filled.on.rectangle
	static var rectangle_inset_filled_on_rectangle: UIImage? {
		return UIImage(systemName: "rectangle.inset.filled.on.rectangle")
	}

	/// rectangle.on.rectangle.slash
	static var rectangle_on_rectangle_slash: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.slash")
	}

	/// rectangle.on.rectangle.slash.fill
	static var rectangle_on_rectangle_slash_fill: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.slash.fill")
	}

	/// rectangle.on.rectangle.slash.circle
	static var rectangle_on_rectangle_slash_circle: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.slash.circle")
	}

	/// rectangle.on.rectangle.slash.circle.fill
	static var rectangle_on_rectangle_slash_circle_fill: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.slash.circle.fill")
	}

	/// play.rectangle.on.rectangle
	static var play_rectangle_on_rectangle: UIImage? {
		return UIImage(systemName: "play.rectangle.on.rectangle")
	}

	/// play.rectangle.on.rectangle.fill
	static var play_rectangle_on_rectangle_fill: UIImage? {
		return UIImage(systemName: "play.rectangle.on.rectangle.fill")
	}

	/// play.rectangle.on.rectangle.circle
	static var play_rectangle_on_rectangle_circle: UIImage? {
		return UIImage(systemName: "play.rectangle.on.rectangle.circle")
	}

	/// play.rectangle.on.rectangle.circle.fill
	static var play_rectangle_on_rectangle_circle_fill: UIImage? {
		return UIImage(systemName: "play.rectangle.on.rectangle.circle.fill")
	}

	/// plus.rectangle.on.rectangle
	static var plus_rectangle_on_rectangle: UIImage? {
		return UIImage(systemName: "plus.rectangle.on.rectangle")
	}

	/// plus.rectangle.fill.on.rectangle.fill
	static var plus_rectangle_fill_on_rectangle_fill: UIImage? {
		return UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill")
	}

	/// rectangle.portrait
	static var rectangle_portrait: UIImage? {
		return UIImage(systemName: "rectangle.portrait")
	}

	/// rectangle.portrait.fill
	static var rectangle_portrait_fill: UIImage? {
		return UIImage(systemName: "rectangle.portrait.fill")
	}

	/// rectangle.portrait.slash
	static var rectangle_portrait_slash: UIImage? {
		return UIImage(systemName: "rectangle.portrait.slash")
	}

	/// rectangle.portrait.slash.fill
	static var rectangle_portrait_slash_fill: UIImage? {
		return UIImage(systemName: "rectangle.portrait.slash.fill")
	}

	/// rectangle.portrait.lefthalf.filled
	static var rectangle_portrait_lefthalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.lefthalf.filled")
	}

	/// rectangle.portrait.righthalf.filled
	static var rectangle_portrait_righthalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.righthalf.filled")
	}

	/// rectangle.portrait.tophalf.filled
	static var rectangle_portrait_tophalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.tophalf.filled")
	}

	/// rectangle.portrait.bottomhalf.filled
	static var rectangle_portrait_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.bottomhalf.filled")
	}

	/// rectangle.portrait.inset.filled
	static var rectangle_portrait_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.inset.filled")
	}

	/// rectangle.portrait.tophalf.inset.filled
	static var rectangle_portrait_tophalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.tophalf.inset.filled")
	}

	/// rectangle.portrait.bottomhalf.inset.filled
	static var rectangle_portrait_bottomhalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.bottomhalf.inset.filled")
	}

	/// rectangle.portrait.lefthalf.inset.filled
	static var rectangle_portrait_lefthalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.lefthalf.inset.filled")
	}

	/// rectangle.portrait.righthalf.inset.filled
	static var rectangle_portrait_righthalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.righthalf.inset.filled")
	}

	/// rectangle.portrait.leadinghalf.inset.filled
	static var rectangle_portrait_leadinghalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.leadinghalf.inset.filled")
	}

	/// rectangle.portrait.trailinghalf.inset.filled
	static var rectangle_portrait_trailinghalf_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.trailinghalf.inset.filled")
	}

	/// rectangle.portrait.topthird.inset.filled
	static var rectangle_portrait_topthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.topthird.inset.filled")
	}

	/// rectangle.portrait.bottomthird.inset.filled
	static var rectangle_portrait_bottomthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.bottomthird.inset.filled")
	}

	/// rectangle.portrait.leftthird.inset.filled
	static var rectangle_portrait_leftthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.leftthird.inset.filled")
	}

	/// rectangle.portrait.rightthird.inset.filled
	static var rectangle_portrait_rightthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.rightthird.inset.filled")
	}

	/// rectangle.portrait.leadingthird.inset.filled
	static var rectangle_portrait_leadingthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.leadingthird.inset.filled")
	}

	/// rectangle.portrait.trailingthird.inset.filled
	static var rectangle_portrait_trailingthird_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.trailingthird.inset.filled")
	}

	/// rectangle.portrait.center.inset.filled
	static var rectangle_portrait_center_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.center.inset.filled")
	}

	/// rectangle.portrait.topleft.inset.filled
	static var rectangle_portrait_topleft_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.topleft.inset.filled")
	}

	/// rectangle.portrait.topright.inset.filled
	static var rectangle_portrait_topright_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.topright.inset.filled")
	}

	/// rectangle.portrait.topleading.inset.filled
	static var rectangle_portrait_topleading_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.topleading.inset.filled")
	}

	/// rectangle.portrait.toptrailing.inset.filled
	static var rectangle_portrait_toptrailing_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.toptrailing.inset.filled")
	}

	/// rectangle.portrait.bottomleft.inset.filled
	static var rectangle_portrait_bottomleft_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.bottomleft.inset.filled")
	}

	/// rectangle.portrait.bottomright.inset.filled
	static var rectangle_portrait_bottomright_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.bottomright.inset.filled")
	}

	/// rectangle.portrait.bottomleading.inset.filled
	static var rectangle_portrait_bottomleading_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.bottomleading.inset.filled")
	}

	/// rectangle.portrait.bottomtrailing.inset.filled
	static var rectangle_portrait_bottomtrailing_inset_filled: UIImage? {
		return UIImage(systemName: "rectangle.portrait.bottomtrailing.inset.filled")
	}

	/// rectangle.portrait.on.rectangle.portrait
	static var rectangle_portrait_on_rectangle_portrait: UIImage? {
		return UIImage(systemName: "rectangle.portrait.on.rectangle.portrait")
	}

	/// rectangle.portrait.on.rectangle.portrait.fill
	static var rectangle_portrait_on_rectangle_portrait_fill: UIImage? {
		return UIImage(systemName: "rectangle.portrait.on.rectangle.portrait.fill")
	}

	/// rectangle.portrait.on.rectangle.portrait.slash
	static var rectangle_portrait_on_rectangle_portrait_slash: UIImage? {
		return UIImage(systemName: "rectangle.portrait.on.rectangle.portrait.slash")
	}

	/// rectangle.portrait.on.rectangle.portrait.slash.fill
	static var rectangle_portrait_on_rectangle_portrait_slash_fill: UIImage? {
		return UIImage(systemName: "rectangle.portrait.on.rectangle.portrait.slash.fill")
	}

	/// rectangle.portrait.split.2x1
	static var rectangle_portrait_split_2x1: UIImage? {
		return UIImage(systemName: "rectangle.portrait.split.2x1")
	}

	/// rectangle.portrait.split.2x1.fill
	static var rectangle_portrait_split_2x1_fill: UIImage? {
		return UIImage(systemName: "rectangle.portrait.split.2x1.fill")
	}

	/// rectangle.portrait.split.2x1.slash
	static var rectangle_portrait_split_2x1_slash: UIImage? {
		return UIImage(systemName: "rectangle.portrait.split.2x1.slash")
	}

	/// rectangle.portrait.split.2x1.slash.fill
	static var rectangle_portrait_split_2x1_slash_fill: UIImage? {
		return UIImage(systemName: "rectangle.portrait.split.2x1.slash.fill")
	}

	/// triangle
	static var triangle: UIImage? {
		return UIImage(systemName: "triangle")
	}

	/// triangle.fill
	static var triangle_fill: UIImage? {
		return UIImage(systemName: "triangle.fill")
	}

	/// triangle.lefthalf.filled
	static var triangle_lefthalf_filled: UIImage? {
		return UIImage(systemName: "triangle.lefthalf.filled")
	}

	/// triangle.righthalf.filled
	static var triangle_righthalf_filled: UIImage? {
		return UIImage(systemName: "triangle.righthalf.filled")
	}

	/// triangle.tophalf.filled
	static var triangle_tophalf_filled: UIImage? {
		return UIImage(systemName: "triangle.tophalf.filled")
	}

	/// triangle.bottomhalf.filled
	static var triangle_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "triangle.bottomhalf.filled")
	}

	/// triangle.inset.filled
	static var triangle_inset_filled: UIImage? {
		return UIImage(systemName: "triangle.inset.filled")
	}

	/// diamond
	static var diamond: UIImage? {
		return UIImage(systemName: "diamond")
	}

	/// diamond.fill
	static var diamond_fill: UIImage? {
		return UIImage(systemName: "diamond.fill")
	}

	/// diamond.lefthalf.filled
	static var diamond_lefthalf_filled: UIImage? {
		return UIImage(systemName: "diamond.lefthalf.filled")
	}

	/// diamond.righthalf.filled
	static var diamond_righthalf_filled: UIImage? {
		return UIImage(systemName: "diamond.righthalf.filled")
	}

	/// diamond.tophalf.filled
	static var diamond_tophalf_filled: UIImage? {
		return UIImage(systemName: "diamond.tophalf.filled")
	}

	/// diamond.bottomhalf.filled
	static var diamond_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "diamond.bottomhalf.filled")
	}

	/// diamond.inset.filled
	static var diamond_inset_filled: UIImage? {
		return UIImage(systemName: "diamond.inset.filled")
	}

	/// octagon
	static var octagon: UIImage? {
		return UIImage(systemName: "octagon")
	}

	/// octagon.fill
	static var octagon_fill: UIImage? {
		return UIImage(systemName: "octagon.fill")
	}

	/// octagon.lefthalf.filled
	static var octagon_lefthalf_filled: UIImage? {
		return UIImage(systemName: "octagon.lefthalf.filled")
	}

	/// octagon.righthalf.filled
	static var octagon_righthalf_filled: UIImage? {
		return UIImage(systemName: "octagon.righthalf.filled")
	}

	/// octagon.tophalf.filled
	static var octagon_tophalf_filled: UIImage? {
		return UIImage(systemName: "octagon.tophalf.filled")
	}

	/// octagon.bottomhalf.filled
	static var octagon_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "octagon.bottomhalf.filled")
	}

	/// hexagon
	static var hexagon: UIImage? {
		return UIImage(systemName: "hexagon")
	}

	/// hexagon.fill
	static var hexagon_fill: UIImage? {
		return UIImage(systemName: "hexagon.fill")
	}

	/// hexagon.lefthalf.filled
	static var hexagon_lefthalf_filled: UIImage? {
		return UIImage(systemName: "hexagon.lefthalf.filled")
	}

	/// hexagon.righthalf.filled
	static var hexagon_righthalf_filled: UIImage? {
		return UIImage(systemName: "hexagon.righthalf.filled")
	}

	/// hexagon.tophalf.filled
	static var hexagon_tophalf_filled: UIImage? {
		return UIImage(systemName: "hexagon.tophalf.filled")
	}

	/// hexagon.bottomhalf.filled
	static var hexagon_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "hexagon.bottomhalf.filled")
	}

	/// pentagon
	static var pentagon: UIImage? {
		return UIImage(systemName: "pentagon")
	}

	/// pentagon.fill
	static var pentagon_fill: UIImage? {
		return UIImage(systemName: "pentagon.fill")
	}

	/// pentagon.lefthalf.filled
	static var pentagon_lefthalf_filled: UIImage? {
		return UIImage(systemName: "pentagon.lefthalf.filled")
	}

	/// pentagon.righthalf.filled
	static var pentagon_righthalf_filled: UIImage? {
		return UIImage(systemName: "pentagon.righthalf.filled")
	}

	/// pentagon.tophalf.filled
	static var pentagon_tophalf_filled: UIImage? {
		return UIImage(systemName: "pentagon.tophalf.filled")
	}

	/// pentagon.bottomhalf.filled
	static var pentagon_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "pentagon.bottomhalf.filled")
	}

	/// suit.heart
	static var suit_heart: UIImage? {
		return UIImage(systemName: "suit.heart")
	}

	/// suit.heart.fill
	static var suit_heart_fill: UIImage? {
		return UIImage(systemName: "suit.heart.fill")
	}

	/// suit.club
	static var suit_club: UIImage? {
		return UIImage(systemName: "suit.club")
	}

	/// suit.club.fill
	static var suit_club_fill: UIImage? {
		return UIImage(systemName: "suit.club.fill")
	}

	/// suit.spade
	static var suit_spade: UIImage? {
		return UIImage(systemName: "suit.spade")
	}

	/// suit.spade.fill
	static var suit_spade_fill: UIImage? {
		return UIImage(systemName: "suit.spade.fill")
	}

	/// suit.diamond
	static var suit_diamond: UIImage? {
		return UIImage(systemName: "suit.diamond")
	}

	/// suit.diamond.fill
	static var suit_diamond_fill: UIImage? {
		return UIImage(systemName: "suit.diamond.fill")
	}

	/// heart
	static var heart: UIImage? {
		return UIImage(systemName: "heart")
	}

	/// heart.fill
	static var heart_fill: UIImage? {
		return UIImage(systemName: "heart.fill")
	}

	/// heart.circle
	static var heart_circle: UIImage? {
		return UIImage(systemName: "heart.circle")
	}

	/// heart.circle.fill
	static var heart_circle_fill: UIImage? {
		return UIImage(systemName: "heart.circle.fill")
	}

	/// heart.square
	static var heart_square: UIImage? {
		return UIImage(systemName: "heart.square")
	}

	/// heart.square.fill
	static var heart_square_fill: UIImage? {
		return UIImage(systemName: "heart.square.fill")
	}

	/// heart.rectangle
	static var heart_rectangle: UIImage? {
		return UIImage(systemName: "heart.rectangle")
	}

	/// heart.rectangle.fill
	static var heart_rectangle_fill: UIImage? {
		return UIImage(systemName: "heart.rectangle.fill")
	}

	/// heart.slash
	static var heart_slash: UIImage? {
		return UIImage(systemName: "heart.slash")
	}

	/// heart.slash.fill
	static var heart_slash_fill: UIImage? {
		return UIImage(systemName: "heart.slash.fill")
	}

	/// heart.slash.circle
	static var heart_slash_circle: UIImage? {
		return UIImage(systemName: "heart.slash.circle")
	}

	/// heart.slash.circle.fill
	static var heart_slash_circle_fill: UIImage? {
		return UIImage(systemName: "heart.slash.circle.fill")
	}

	/// bolt.heart
	static var bolt_heart: UIImage? {
		return UIImage(systemName: "bolt.heart")
	}

	/// bolt.heart.fill
	static var bolt_heart_fill: UIImage? {
		return UIImage(systemName: "bolt.heart.fill")
	}

	/// arrow.up.heart
	static var arrow_up_heart: UIImage? {
		return UIImage(systemName: "arrow.up.heart")
	}

	/// arrow.up.heart.fill
	static var arrow_up_heart_fill: UIImage? {
		return UIImage(systemName: "arrow.up.heart.fill")
	}

	/// arrow.down.heart
	static var arrow_down_heart: UIImage? {
		return UIImage(systemName: "arrow.down.heart")
	}

	/// arrow.down.heart.fill
	static var arrow_down_heart_fill: UIImage? {
		return UIImage(systemName: "arrow.down.heart.fill")
	}

	/// arrow.clockwise.heart
	static var arrow_clockwise_heart: UIImage? {
		return UIImage(systemName: "arrow.clockwise.heart")
	}

	/// arrow.clockwise.heart.fill
	static var arrow_clockwise_heart_fill: UIImage? {
		return UIImage(systemName: "arrow.clockwise.heart.fill")
	}

	/// rhombus
	static var rhombus: UIImage? {
		return UIImage(systemName: "rhombus")
	}

	/// rhombus.fill
	static var rhombus_fill: UIImage? {
		return UIImage(systemName: "rhombus.fill")
	}

	/// star
	static var star: UIImage? {
		return UIImage(systemName: "star")
	}

	/// star.fill
	static var star_fill: UIImage? {
		return UIImage(systemName: "star.fill")
	}

	/// star.leadinghalf.filled
	static var star_leadinghalf_filled: UIImage? {
		return UIImage(systemName: "star.leadinghalf.filled")
	}

	/// star.circle
	static var star_circle: UIImage? {
		return UIImage(systemName: "star.circle")
	}

	/// star.circle.fill
	static var star_circle_fill: UIImage? {
		return UIImage(systemName: "star.circle.fill")
	}

	/// star.square
	static var star_square: UIImage? {
		return UIImage(systemName: "star.square")
	}

	/// star.square.fill
	static var star_square_fill: UIImage? {
		return UIImage(systemName: "star.square.fill")
	}

	/// star.slash
	static var star_slash: UIImage? {
		return UIImage(systemName: "star.slash")
	}

	/// star.slash.fill
	static var star_slash_fill: UIImage? {
		return UIImage(systemName: "star.slash.fill")
	}

	/// line.horizontal.star.fill.line.horizontal
	static var line_horizontal_star_fill_line_horizontal: UIImage? {
		return UIImage(systemName: "line.horizontal.star.fill.line.horizontal")
	}

	/// flag
	static var flag: UIImage? {
		return UIImage(systemName: "flag")
	}

	/// flag.fill
	static var flag_fill: UIImage? {
		return UIImage(systemName: "flag.fill")
	}

	/// flag.circle
	static var flag_circle: UIImage? {
		return UIImage(systemName: "flag.circle")
	}

	/// flag.circle.fill
	static var flag_circle_fill: UIImage? {
		return UIImage(systemName: "flag.circle.fill")
	}

	/// flag.square
	static var flag_square: UIImage? {
		return UIImage(systemName: "flag.square")
	}

	/// flag.square.fill
	static var flag_square_fill: UIImage? {
		return UIImage(systemName: "flag.square.fill")
	}

	/// flag.slash
	static var flag_slash: UIImage? {
		return UIImage(systemName: "flag.slash")
	}

	/// flag.slash.fill
	static var flag_slash_fill: UIImage? {
		return UIImage(systemName: "flag.slash.fill")
	}

	/// flag.slash.circle
	static var flag_slash_circle: UIImage? {
		return UIImage(systemName: "flag.slash.circle")
	}

	/// flag.slash.circle.fill
	static var flag_slash_circle_fill: UIImage? {
		return UIImage(systemName: "flag.slash.circle.fill")
	}

	/// flag.badge.ellipsis
	static var flag_badge_ellipsis: UIImage? {
		return UIImage(systemName: "flag.badge.ellipsis")
	}

	/// flag.badge.ellipsis.fill
	static var flag_badge_ellipsis_fill: UIImage? {
		return UIImage(systemName: "flag.badge.ellipsis.fill")
	}

	/// flag.2.crossed
	static var flag_2_crossed: UIImage? {
		return UIImage(systemName: "flag.2.crossed")
	}

	/// flag.2.crossed.fill
	static var flag_2_crossed_fill: UIImage? {
		return UIImage(systemName: "flag.2.crossed.fill")
	}

	/// flag.filled.and.flag.crossed
	static var flag_filled_and_flag_crossed: UIImage? {
		return UIImage(systemName: "flag.filled.and.flag.crossed")
	}

	/// flag.and.flag.filled.crossed
	static var flag_and_flag_filled_crossed: UIImage? {
		return UIImage(systemName: "flag.and.flag.filled.crossed")
	}

	/// location
	static var location: UIImage? {
		return UIImage(systemName: "location")
	}

	/// location.fill
	static var location_fill: UIImage? {
		return UIImage(systemName: "location.fill")
	}

	/// location.north.circle
	static var location_north_circle: UIImage? {
		return UIImage(systemName: "location.north.circle")
	}

	/// location.north.circle.fill
	static var location_north_circle_fill: UIImage? {
		return UIImage(systemName: "location.north.circle.fill")
	}

	/// location.slash
	static var location_slash: UIImage? {
		return UIImage(systemName: "location.slash")
	}

	/// location.slash.fill
	static var location_slash_fill: UIImage? {
		return UIImage(systemName: "location.slash.fill")
	}

	/// location.north
	static var location_north: UIImage? {
		return UIImage(systemName: "location.north")
	}

	/// location.north.fill
	static var location_north_fill: UIImage? {
		return UIImage(systemName: "location.north.fill")
	}

	/// location.circle
	static var location_circle: UIImage? {
		return UIImage(systemName: "location.circle")
	}

	/// location.circle.fill
	static var location_circle_fill: UIImage? {
		return UIImage(systemName: "location.circle.fill")
	}

	/// location.square
	static var location_square: UIImage? {
		return UIImage(systemName: "location.square")
	}

	/// location.square.fill
	static var location_square_fill: UIImage? {
		return UIImage(systemName: "location.square.fill")
	}

	/// location.north.line
	static var location_north_line: UIImage? {
		return UIImage(systemName: "location.north.line")
	}

	/// location.north.line.fill
	static var location_north_line_fill: UIImage? {
		return UIImage(systemName: "location.north.line.fill")
	}

	/// sensor.tag.radiowaves.forward
	static var sensor_tag_radiowaves_forward: UIImage? {
		return UIImage(systemName: "sensor.tag.radiowaves.forward")
	}

	/// sensor.tag.radiowaves.forward.fill
	static var sensor_tag_radiowaves_forward_fill: UIImage? {
		return UIImage(systemName: "sensor.tag.radiowaves.forward.fill")
	}

	/// bell
	static var bell: UIImage? {
		return UIImage(systemName: "bell")
	}

	/// bell.fill
	static var bell_fill: UIImage? {
		return UIImage(systemName: "bell.fill")
	}

	/// bell.circle
	static var bell_circle: UIImage? {
		return UIImage(systemName: "bell.circle")
	}

	/// bell.circle.fill
	static var bell_circle_fill: UIImage? {
		return UIImage(systemName: "bell.circle.fill")
	}

	/// bell.square
	static var bell_square: UIImage? {
		return UIImage(systemName: "bell.square")
	}

	/// bell.square.fill
	static var bell_square_fill: UIImage? {
		return UIImage(systemName: "bell.square.fill")
	}

	/// bell.slash
	static var bell_slash: UIImage? {
		return UIImage(systemName: "bell.slash")
	}

	/// bell.slash.fill
	static var bell_slash_fill: UIImage? {
		return UIImage(systemName: "bell.slash.fill")
	}

	/// bell.slash.circle
	static var bell_slash_circle: UIImage? {
		return UIImage(systemName: "bell.slash.circle")
	}

	/// bell.slash.circle.fill
	static var bell_slash_circle_fill: UIImage? {
		return UIImage(systemName: "bell.slash.circle.fill")
	}

	/// bell.and.waveform
	static var bell_and_waveform: UIImage? {
		return UIImage(systemName: "bell.and.waveform")
	}

	/// bell.and.waveform.fill
	static var bell_and_waveform_fill: UIImage? {
		return UIImage(systemName: "bell.and.waveform.fill")
	}

	/// bell.badge
	static var bell_badge: UIImage? {
		return UIImage(systemName: "bell.badge")
	}

	/// bell.badge.fill
	static var bell_badge_fill: UIImage? {
		return UIImage(systemName: "bell.badge.fill")
	}

	/// bell.badge.circle
	static var bell_badge_circle: UIImage? {
		return UIImage(systemName: "bell.badge.circle")
	}

	/// bell.badge.circle.fill
	static var bell_badge_circle_fill: UIImage? {
		return UIImage(systemName: "bell.badge.circle.fill")
	}

	/// tag
	static var tag: UIImage? {
		return UIImage(systemName: "tag")
	}

	/// tag.fill
	static var tag_fill: UIImage? {
		return UIImage(systemName: "tag.fill")
	}

	/// tag.circle
	static var tag_circle: UIImage? {
		return UIImage(systemName: "tag.circle")
	}

	/// tag.circle.fill
	static var tag_circle_fill: UIImage? {
		return UIImage(systemName: "tag.circle.fill")
	}

	/// tag.square
	static var tag_square: UIImage? {
		return UIImage(systemName: "tag.square")
	}

	/// tag.square.fill
	static var tag_square_fill: UIImage? {
		return UIImage(systemName: "tag.square.fill")
	}

	/// tag.slash
	static var tag_slash: UIImage? {
		return UIImage(systemName: "tag.slash")
	}

	/// tag.slash.fill
	static var tag_slash_fill: UIImage? {
		return UIImage(systemName: "tag.slash.fill")
	}

	/// bolt
	static var bolt: UIImage? {
		return UIImage(systemName: "bolt")
	}

	/// bolt.fill
	static var bolt_fill: UIImage? {
		return UIImage(systemName: "bolt.fill")
	}

	/// bolt.circle
	static var bolt_circle: UIImage? {
		return UIImage(systemName: "bolt.circle")
	}

	/// bolt.circle.fill
	static var bolt_circle_fill: UIImage? {
		return UIImage(systemName: "bolt.circle.fill")
	}

	/// bolt.square
	static var bolt_square: UIImage? {
		return UIImage(systemName: "bolt.square")
	}

	/// bolt.square.fill
	static var bolt_square_fill: UIImage? {
		return UIImage(systemName: "bolt.square.fill")
	}

	/// bolt.shield
	static var bolt_shield: UIImage? {
		return UIImage(systemName: "bolt.shield")
	}

	/// bolt.shield.fill
	static var bolt_shield_fill: UIImage? {
		return UIImage(systemName: "bolt.shield.fill")
	}

	/// bolt.slash
	static var bolt_slash: UIImage? {
		return UIImage(systemName: "bolt.slash")
	}

	/// bolt.slash.fill
	static var bolt_slash_fill: UIImage? {
		return UIImage(systemName: "bolt.slash.fill")
	}

	/// bolt.slash.circle
	static var bolt_slash_circle: UIImage? {
		return UIImage(systemName: "bolt.slash.circle")
	}

	/// bolt.slash.circle.fill
	static var bolt_slash_circle_fill: UIImage? {
		return UIImage(systemName: "bolt.slash.circle.fill")
	}

	/// bolt.badge.a
	static var bolt_badge_a: UIImage? {
		return UIImage(systemName: "bolt.badge.a")
	}

	/// bolt.badge.a.fill
	static var bolt_badge_a_fill: UIImage? {
		return UIImage(systemName: "bolt.badge.a.fill")
	}

	/// bolt.horizontal
	static var bolt_horizontal: UIImage? {
		return UIImage(systemName: "bolt.horizontal")
	}

	/// bolt.horizontal.fill
	static var bolt_horizontal_fill: UIImage? {
		return UIImage(systemName: "bolt.horizontal.fill")
	}

	/// bolt.horizontal.circle
	static var bolt_horizontal_circle: UIImage? {
		return UIImage(systemName: "bolt.horizontal.circle")
	}

	/// bolt.horizontal.circle.fill
	static var bolt_horizontal_circle_fill: UIImage? {
		return UIImage(systemName: "bolt.horizontal.circle.fill")
	}

	/// eye
	static var eye: UIImage? {
		return UIImage(systemName: "eye")
	}

	/// eye.fill
	static var eye_fill: UIImage? {
		return UIImage(systemName: "eye.fill")
	}

	/// eye.circle
	static var eye_circle: UIImage? {
		return UIImage(systemName: "eye.circle")
	}

	/// eye.circle.fill
	static var eye_circle_fill: UIImage? {
		return UIImage(systemName: "eye.circle.fill")
	}

	/// eye.square
	static var eye_square: UIImage? {
		return UIImage(systemName: "eye.square")
	}

	/// eye.square.fill
	static var eye_square_fill: UIImage? {
		return UIImage(systemName: "eye.square.fill")
	}

	/// eye.slash
	static var eye_slash: UIImage? {
		return UIImage(systemName: "eye.slash")
	}

	/// eye.slash.fill
	static var eye_slash_fill: UIImage? {
		return UIImage(systemName: "eye.slash.fill")
	}

	/// eye.slash.circle
	static var eye_slash_circle: UIImage? {
		return UIImage(systemName: "eye.slash.circle")
	}

	/// eye.slash.circle.fill
	static var eye_slash_circle_fill: UIImage? {
		return UIImage(systemName: "eye.slash.circle.fill")
	}

	/// eye.trianglebadge.exclamationmark
	static var eye_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "eye.trianglebadge.exclamationmark")
	}

	/// eye.trianglebadge.exclamationmark.fill
	static var eye_trianglebadge_exclamationmark_fill: UIImage? {
		return UIImage(systemName: "eye.trianglebadge.exclamationmark.fill")
	}

	/// tshirt
	static var tshirt: UIImage? {
		return UIImage(systemName: "tshirt")
	}

	/// tshirt.fill
	static var tshirt_fill: UIImage? {
		return UIImage(systemName: "tshirt.fill")
	}

	/// eyes
	static var eyes: UIImage? {
		return UIImage(systemName: "eyes")
	}

	/// eyes.inverse
	static var eyes_inverse: UIImage? {
		return UIImage(systemName: "eyes.inverse")
	}

	/// eyebrow
	static var eyebrow: UIImage? {
		return UIImage(systemName: "eyebrow")
	}

	/// nose
	static var nose: UIImage? {
		return UIImage(systemName: "nose")
	}

	/// nose.fill
	static var nose_fill: UIImage? {
		return UIImage(systemName: "nose.fill")
	}

	/// mustache
	static var mustache: UIImage? {
		return UIImage(systemName: "mustache")
	}

	/// mustache.fill
	static var mustache_fill: UIImage? {
		return UIImage(systemName: "mustache.fill")
	}

	/// mouth
	static var mouth: UIImage? {
		return UIImage(systemName: "mouth")
	}

	/// mouth.fill
	static var mouth_fill: UIImage? {
		return UIImage(systemName: "mouth.fill")
	}

	/// eyeglasses
	static var eyeglasses: UIImage? {
		return UIImage(systemName: "eyeglasses")
	}

	/// facemask
	static var facemask: UIImage? {
		return UIImage(systemName: "facemask")
	}

	/// facemask.fill
	static var facemask_fill: UIImage? {
		return UIImage(systemName: "facemask.fill")
	}

	/// brain.head.profile
	static var brain_head_profile: UIImage? {
		return UIImage(systemName: "brain.head.profile")
	}

	/// brain
	static var brain: UIImage? {
		return UIImage(systemName: "brain")
	}

	/// icloud
	static var icloud: UIImage? {
		return UIImage(systemName: "icloud")
	}

	/// icloud.fill
	static var icloud_fill: UIImage? {
		return UIImage(systemName: "icloud.fill")
	}

	/// icloud.circle
	static var icloud_circle: UIImage? {
		return UIImage(systemName: "icloud.circle")
	}

	/// icloud.circle.fill
	static var icloud_circle_fill: UIImage? {
		return UIImage(systemName: "icloud.circle.fill")
	}

	/// icloud.square
	static var icloud_square: UIImage? {
		return UIImage(systemName: "icloud.square")
	}

	/// icloud.square.fill
	static var icloud_square_fill: UIImage? {
		return UIImage(systemName: "icloud.square.fill")
	}

	/// icloud.slash
	static var icloud_slash: UIImage? {
		return UIImage(systemName: "icloud.slash")
	}

	/// icloud.slash.fill
	static var icloud_slash_fill: UIImage? {
		return UIImage(systemName: "icloud.slash.fill")
	}

	/// exclamationmark.icloud
	static var exclamationmark_icloud: UIImage? {
		return UIImage(systemName: "exclamationmark.icloud")
	}

	/// exclamationmark.icloud.fill
	static var exclamationmark_icloud_fill: UIImage? {
		return UIImage(systemName: "exclamationmark.icloud.fill")
	}

	/// checkmark.icloud
	static var checkmark_icloud: UIImage? {
		return UIImage(systemName: "checkmark.icloud")
	}

	/// checkmark.icloud.fill
	static var checkmark_icloud_fill: UIImage? {
		return UIImage(systemName: "checkmark.icloud.fill")
	}

	/// xmark.icloud
	static var xmark_icloud: UIImage? {
		return UIImage(systemName: "xmark.icloud")
	}

	/// xmark.icloud.fill
	static var xmark_icloud_fill: UIImage? {
		return UIImage(systemName: "xmark.icloud.fill")
	}

	/// link.icloud
	static var link_icloud: UIImage? {
		return UIImage(systemName: "link.icloud")
	}

	/// link.icloud.fill
	static var link_icloud_fill: UIImage? {
		return UIImage(systemName: "link.icloud.fill")
	}

	/// bolt.horizontal.icloud
	static var bolt_horizontal_icloud: UIImage? {
		return UIImage(systemName: "bolt.horizontal.icloud")
	}

	/// bolt.horizontal.icloud.fill
	static var bolt_horizontal_icloud_fill: UIImage? {
		return UIImage(systemName: "bolt.horizontal.icloud.fill")
	}

	/// person.icloud
	static var person_icloud: UIImage? {
		return UIImage(systemName: "person.icloud")
	}

	/// person.icloud.fill
	static var person_icloud_fill: UIImage? {
		return UIImage(systemName: "person.icloud.fill")
	}

	/// lock.icloud
	static var lock_icloud: UIImage? {
		return UIImage(systemName: "lock.icloud")
	}

	/// lock.icloud.fill
	static var lock_icloud_fill: UIImage? {
		return UIImage(systemName: "lock.icloud.fill")
	}

	/// key.icloud
	static var key_icloud: UIImage? {
		return UIImage(systemName: "key.icloud")
	}

	/// key.icloud.fill
	static var key_icloud_fill: UIImage? {
		return UIImage(systemName: "key.icloud.fill")
	}

	/// arrow.clockwise.icloud
	static var arrow_clockwise_icloud: UIImage? {
		return UIImage(systemName: "arrow.clockwise.icloud")
	}

	/// arrow.clockwise.icloud.fill
	static var arrow_clockwise_icloud_fill: UIImage? {
		return UIImage(systemName: "arrow.clockwise.icloud.fill")
	}

	/// arrow.counterclockwise.icloud
	static var arrow_counterclockwise_icloud: UIImage? {
		return UIImage(systemName: "arrow.counterclockwise.icloud")
	}

	/// arrow.counterclockwise.icloud.fill
	static var arrow_counterclockwise_icloud_fill: UIImage? {
		return UIImage(systemName: "arrow.counterclockwise.icloud.fill")
	}

	/// icloud.and.arrow.down
	static var icloud_and_arrow_down: UIImage? {
		return UIImage(systemName: "icloud.and.arrow.down")
	}

	/// icloud.and.arrow.down.fill
	static var icloud_and_arrow_down_fill: UIImage? {
		return UIImage(systemName: "icloud.and.arrow.down.fill")
	}

	/// icloud.and.arrow.up
	static var icloud_and_arrow_up: UIImage? {
		return UIImage(systemName: "icloud.and.arrow.up")
	}

	/// icloud.and.arrow.up.fill
	static var icloud_and_arrow_up_fill: UIImage? {
		return UIImage(systemName: "icloud.and.arrow.up.fill")
	}

	/// flashlight.off.fill
	static var flashlight_off_fill: UIImage? {
		return UIImage(systemName: "flashlight.off.fill")
	}

	/// flashlight.on.fill
	static var flashlight_on_fill: UIImage? {
		return UIImage(systemName: "flashlight.on.fill")
	}

	/// camera
	static var camera: UIImage? {
		return UIImage(systemName: "camera")
	}

	/// camera.fill
	static var camera_fill: UIImage? {
		return UIImage(systemName: "camera.fill")
	}

	/// camera.circle
	static var camera_circle: UIImage? {
		return UIImage(systemName: "camera.circle")
	}

	/// camera.circle.fill
	static var camera_circle_fill: UIImage? {
		return UIImage(systemName: "camera.circle.fill")
	}

	/// camera.shutter.button
	static var camera_shutter_button: UIImage? {
		return UIImage(systemName: "camera.shutter.button")
	}

	/// camera.shutter.button.fill
	static var camera_shutter_button_fill: UIImage? {
		return UIImage(systemName: "camera.shutter.button.fill")
	}

	/// camera.badge.ellipsis
	static var camera_badge_ellipsis: UIImage? {
		return UIImage(systemName: "camera.badge.ellipsis")
	}

	/// camera.fill.badge.ellipsis
	static var camera_fill_badge_ellipsis: UIImage? {
		return UIImage(systemName: "camera.fill.badge.ellipsis")
	}

	/// arrow.triangle.2.circlepath.camera
	static var arrow_triangle_2_circlepath_camera: UIImage? {
		return UIImage(systemName: "arrow.triangle.2.circlepath.camera")
	}

	/// arrow.triangle.2.circlepath.camera.fill
	static var arrow_triangle_2_circlepath_camera_fill: UIImage? {
		return UIImage(systemName: "arrow.triangle.2.circlepath.camera.fill")
	}

	/// camera.on.rectangle
	static var camera_on_rectangle: UIImage? {
		return UIImage(systemName: "camera.on.rectangle")
	}

	/// camera.on.rectangle.fill
	static var camera_on_rectangle_fill: UIImage? {
		return UIImage(systemName: "camera.on.rectangle.fill")
	}

	/// message
	static var message: UIImage? {
		return UIImage(systemName: "message")
	}

	/// message.fill
	static var message_fill: UIImage? {
		return UIImage(systemName: "message.fill")
	}

	/// message.circle
	static var message_circle: UIImage? {
		return UIImage(systemName: "message.circle")
	}

	/// message.circle.fill
	static var message_circle_fill: UIImage? {
		return UIImage(systemName: "message.circle.fill")
	}

	/// message.and.waveform
	static var message_and_waveform: UIImage? {
		return UIImage(systemName: "message.and.waveform")
	}

	/// message.and.waveform.fill
	static var message_and_waveform_fill: UIImage? {
		return UIImage(systemName: "message.and.waveform.fill")
	}

	/// arrow.up.message
	static var arrow_up_message: UIImage? {
		return UIImage(systemName: "arrow.up.message")
	}

	/// arrow.up.message.fill
	static var arrow_up_message_fill: UIImage? {
		return UIImage(systemName: "arrow.up.message.fill")
	}

	/// plus.message
	static var plus_message: UIImage? {
		return UIImage(systemName: "plus.message")
	}

	/// plus.message.fill
	static var plus_message_fill: UIImage? {
		return UIImage(systemName: "plus.message.fill")
	}

	/// bubble.right
	static var bubble_right: UIImage? {
		return UIImage(systemName: "bubble.right")
	}

	/// bubble.right.fill
	static var bubble_right_fill: UIImage? {
		return UIImage(systemName: "bubble.right.fill")
	}

	/// bubble.left
	static var bubble_left: UIImage? {
		return UIImage(systemName: "bubble.left")
	}

	/// bubble.left.fill
	static var bubble_left_fill: UIImage? {
		return UIImage(systemName: "bubble.left.fill")
	}

	/// exclamationmark.bubble
	static var exclamationmark_bubble: UIImage? {
		return UIImage(systemName: "exclamationmark.bubble")
	}

	/// exclamationmark.bubble.fill
	static var exclamationmark_bubble_fill: UIImage? {
		return UIImage(systemName: "exclamationmark.bubble.fill")
	}

	/// quote.bubble
	static var quote_bubble: UIImage? {
		return UIImage(systemName: "quote.bubble")
	}

	/// quote.bubble.fill
	static var quote_bubble_fill: UIImage? {
		return UIImage(systemName: "quote.bubble.fill")
	}

	/// star.bubble
	static var star_bubble: UIImage? {
		return UIImage(systemName: "star.bubble")
	}

	/// star.bubble.fill
	static var star_bubble_fill: UIImage? {
		return UIImage(systemName: "star.bubble.fill")
	}

	/// character.bubble
	static var character_bubble: UIImage? {
		return UIImage(systemName: "character.bubble")
	}

	/// character.bubble.fill
	static var character_bubble_fill: UIImage? {
		return UIImage(systemName: "character.bubble.fill")
	}

	/// text.bubble
	static var text_bubble: UIImage? {
		return UIImage(systemName: "text.bubble")
	}

	/// text.bubble.fill
	static var text_bubble_fill: UIImage? {
		return UIImage(systemName: "text.bubble.fill")
	}

	/// captions.bubble
	static var captions_bubble: UIImage? {
		return UIImage(systemName: "captions.bubble")
	}

	/// captions.bubble.fill
	static var captions_bubble_fill: UIImage? {
		return UIImage(systemName: "captions.bubble.fill")
	}

	/// plus.bubble
	static var plus_bubble: UIImage? {
		return UIImage(systemName: "plus.bubble")
	}

	/// plus.bubble.fill
	static var plus_bubble_fill: UIImage? {
		return UIImage(systemName: "plus.bubble.fill")
	}

	/// checkmark.bubble
	static var checkmark_bubble: UIImage? {
		return UIImage(systemName: "checkmark.bubble")
	}

	/// checkmark.bubble.fill
	static var checkmark_bubble_fill: UIImage? {
		return UIImage(systemName: "checkmark.bubble.fill")
	}

	/// rectangle.3.offgrid.bubble.left
	static var rectangle_3_offgrid_bubble_left: UIImage? {
		return UIImage(systemName: "rectangle.3.offgrid.bubble.left")
	}

	/// rectangle.3.offgrid.bubble.left.fill
	static var rectangle_3_offgrid_bubble_left_fill: UIImage? {
		return UIImage(systemName: "rectangle.3.offgrid.bubble.left.fill")
	}

	/// ellipsis.bubble
	static var ellipsis_bubble: UIImage? {
		return UIImage(systemName: "ellipsis.bubble")
	}

	/// ellipsis.bubble.fill
	static var ellipsis_bubble_fill: UIImage? {
		return UIImage(systemName: "ellipsis.bubble.fill")
	}

	/// ellipsis.vertical.bubble
	static var ellipsis_vertical_bubble: UIImage? {
		return UIImage(systemName: "ellipsis.vertical.bubble")
	}

	/// ellipsis.vertical.bubble.fill
	static var ellipsis_vertical_bubble_fill: UIImage? {
		return UIImage(systemName: "ellipsis.vertical.bubble.fill")
	}

	/// phone.bubble.left
	static var phone_bubble_left: UIImage? {
		return UIImage(systemName: "phone.bubble.left")
	}

	/// phone.bubble.left.fill
	static var phone_bubble_left_fill: UIImage? {
		return UIImage(systemName: "phone.bubble.left.fill")
	}

	/// video.bubble.left
	static var video_bubble_left: UIImage? {
		return UIImage(systemName: "video.bubble.left")
	}

	/// video.bubble.left.fill
	static var video_bubble_left_fill: UIImage? {
		return UIImage(systemName: "video.bubble.left.fill")
	}

	/// bubble.middle.bottom
	static var bubble_middle_bottom: UIImage? {
		return UIImage(systemName: "bubble.middle.bottom")
	}

	/// bubble.middle.bottom.fill
	static var bubble_middle_bottom_fill: UIImage? {
		return UIImage(systemName: "bubble.middle.bottom.fill")
	}

	/// bubble.middle.top
	static var bubble_middle_top: UIImage? {
		return UIImage(systemName: "bubble.middle.top")
	}

	/// bubble.middle.top.fill
	static var bubble_middle_top_fill: UIImage? {
		return UIImage(systemName: "bubble.middle.top.fill")
	}

	/// bubble.left.and.bubble.right
	static var bubble_left_and_bubble_right: UIImage? {
		return UIImage(systemName: "bubble.left.and.bubble.right")
	}

	/// bubble.left.and.bubble.right.fill
	static var bubble_left_and_bubble_right_fill: UIImage? {
		return UIImage(systemName: "bubble.left.and.bubble.right.fill")
	}

	/// bubble.left.and.exclamationmark.bubble.right
	static var bubble_left_and_exclamationmark_bubble_right: UIImage? {
		return UIImage(systemName: "bubble.left.and.exclamationmark.bubble.right")
	}

	/// bubble.left.and.exclamationmark.bubble.right.fill
	static var bubble_left_and_exclamationmark_bubble_right_fill: UIImage? {
		return UIImage(systemName: "bubble.left.and.exclamationmark.bubble.right.fill")
	}

	/// phone
	static var phone: UIImage? {
		return UIImage(systemName: "phone")
	}

	/// phone.fill
	static var phone_fill: UIImage? {
		return UIImage(systemName: "phone.fill")
	}

	/// phone.circle
	static var phone_circle: UIImage? {
		return UIImage(systemName: "phone.circle")
	}

	/// phone.circle.fill
	static var phone_circle_fill: UIImage? {
		return UIImage(systemName: "phone.circle.fill")
	}

	/// phone.badge.plus
	static var phone_badge_plus: UIImage? {
		return UIImage(systemName: "phone.badge.plus")
	}

	/// phone.fill.badge.plus
	static var phone_fill_badge_plus: UIImage? {
		return UIImage(systemName: "phone.fill.badge.plus")
	}

	/// phone.connection
	static var phone_connection: UIImage? {
		return UIImage(systemName: "phone.connection")
	}

	/// phone.fill.connection
	static var phone_fill_connection: UIImage? {
		return UIImage(systemName: "phone.fill.connection")
	}

	/// phone.and.waveform
	static var phone_and_waveform: UIImage? {
		return UIImage(systemName: "phone.and.waveform")
	}

	/// phone.and.waveform.fill
	static var phone_and_waveform_fill: UIImage? {
		return UIImage(systemName: "phone.and.waveform.fill")
	}

	/// phone.arrow.up.right
	static var phone_arrow_up_right: UIImage? {
		return UIImage(systemName: "phone.arrow.up.right")
	}

	/// phone.fill.arrow.up.right
	static var phone_fill_arrow_up_right: UIImage? {
		return UIImage(systemName: "phone.fill.arrow.up.right")
	}

	/// phone.arrow.down.left
	static var phone_arrow_down_left: UIImage? {
		return UIImage(systemName: "phone.arrow.down.left")
	}

	/// phone.fill.arrow.down.left
	static var phone_fill_arrow_down_left: UIImage? {
		return UIImage(systemName: "phone.fill.arrow.down.left")
	}

	/// phone.arrow.right
	static var phone_arrow_right: UIImage? {
		return UIImage(systemName: "phone.arrow.right")
	}

	/// phone.fill.arrow.right
	static var phone_fill_arrow_right: UIImage? {
		return UIImage(systemName: "phone.fill.arrow.right")
	}

	/// phone.down
	static var phone_down: UIImage? {
		return UIImage(systemName: "phone.down")
	}

	/// phone.down.fill
	static var phone_down_fill: UIImage? {
		return UIImage(systemName: "phone.down.fill")
	}

	/// phone.down.circle
	static var phone_down_circle: UIImage? {
		return UIImage(systemName: "phone.down.circle")
	}

	/// phone.down.circle.fill
	static var phone_down_circle_fill: UIImage? {
		return UIImage(systemName: "phone.down.circle.fill")
	}

	/// teletype
	static var teletype: UIImage? {
		return UIImage(systemName: "teletype")
	}

	/// teletype.circle
	static var teletype_circle: UIImage? {
		return UIImage(systemName: "teletype.circle")
	}

	/// teletype.circle.fill
	static var teletype_circle_fill: UIImage? {
		return UIImage(systemName: "teletype.circle.fill")
	}

	/// teletype.answer
	static var teletype_answer: UIImage? {
		return UIImage(systemName: "teletype.answer")
	}

	/// video
	static var video: UIImage? {
		return UIImage(systemName: "video")
	}

	/// video.fill
	static var video_fill: UIImage? {
		return UIImage(systemName: "video.fill")
	}

	/// video.circle
	static var video_circle: UIImage? {
		return UIImage(systemName: "video.circle")
	}

	/// video.circle.fill
	static var video_circle_fill: UIImage? {
		return UIImage(systemName: "video.circle.fill")
	}

	/// video.square
	static var video_square: UIImage? {
		return UIImage(systemName: "video.square")
	}

	/// video.square.fill
	static var video_square_fill: UIImage? {
		return UIImage(systemName: "video.square.fill")
	}

	/// video.slash
	static var video_slash: UIImage? {
		return UIImage(systemName: "video.slash")
	}

	/// video.slash.fill
	static var video_slash_fill: UIImage? {
		return UIImage(systemName: "video.slash.fill")
	}

	/// video.badge.plus
	static var video_badge_plus: UIImage? {
		return UIImage(systemName: "video.badge.plus")
	}

	/// video.fill.badge.plus
	static var video_fill_badge_plus: UIImage? {
		return UIImage(systemName: "video.fill.badge.plus")
	}

	/// video.badge.checkmark
	static var video_badge_checkmark: UIImage? {
		return UIImage(systemName: "video.badge.checkmark")
	}

	/// video.fill.badge.checkmark
	static var video_fill_badge_checkmark: UIImage? {
		return UIImage(systemName: "video.fill.badge.checkmark")
	}

	/// video.badge.ellipsis
	static var video_badge_ellipsis: UIImage? {
		return UIImage(systemName: "video.badge.ellipsis")
	}

	/// video.fill.badge.ellipsis
	static var video_fill_badge_ellipsis: UIImage? {
		return UIImage(systemName: "video.fill.badge.ellipsis")
	}

	/// video.and.waveform
	static var video_and_waveform: UIImage? {
		return UIImage(systemName: "video.and.waveform")
	}

	/// video.and.waveform.fill
	static var video_and_waveform_fill: UIImage? {
		return UIImage(systemName: "video.and.waveform.fill")
	}

	/// arrow.up.right.video
	static var arrow_up_right_video: UIImage? {
		return UIImage(systemName: "arrow.up.right.video")
	}

	/// arrow.up.right.video.fill
	static var arrow_up_right_video_fill: UIImage? {
		return UIImage(systemName: "arrow.up.right.video.fill")
	}

	/// arrow.down.left.video
	static var arrow_down_left_video: UIImage? {
		return UIImage(systemName: "arrow.down.left.video")
	}

	/// arrow.down.left.video.fill
	static var arrow_down_left_video_fill: UIImage? {
		return UIImage(systemName: "arrow.down.left.video.fill")
	}

	/// questionmark.video
	static var questionmark_video: UIImage? {
		return UIImage(systemName: "questionmark.video")
	}

	/// questionmark.video.fill
	static var questionmark_video_fill: UIImage? {
		return UIImage(systemName: "questionmark.video.fill")
	}

	/// envelope
	static var envelope: UIImage? {
		return UIImage(systemName: "envelope")
	}

	/// envelope.fill
	static var envelope_fill: UIImage? {
		return UIImage(systemName: "envelope.fill")
	}

	/// envelope.circle
	static var envelope_circle: UIImage? {
		return UIImage(systemName: "envelope.circle")
	}

	/// envelope.circle.fill
	static var envelope_circle_fill: UIImage? {
		return UIImage(systemName: "envelope.circle.fill")
	}

	/// envelope.arrow.triangle.branch
	static var envelope_arrow_triangle_branch: UIImage? {
		return UIImage(systemName: "envelope.arrow.triangle.branch")
	}

	/// envelope.arrow.triangle.branch.fill
	static var envelope_arrow_triangle_branch_fill: UIImage? {
		return UIImage(systemName: "envelope.arrow.triangle.branch.fill")
	}

	/// envelope.open
	static var envelope_open: UIImage? {
		return UIImage(systemName: "envelope.open")
	}

	/// envelope.open.fill
	static var envelope_open_fill: UIImage? {
		return UIImage(systemName: "envelope.open.fill")
	}

	/// envelope.badge
	static var envelope_badge: UIImage? {
		return UIImage(systemName: "envelope.badge")
	}

	/// envelope.badge.fill
	static var envelope_badge_fill: UIImage? {
		return UIImage(systemName: "envelope.badge.fill")
	}

	/// envelope.badge.shield.half.filled
	static var envelope_badge_shield_half_filled: UIImage? {
		return UIImage(systemName: "envelope.badge.shield.half.filled")
	}

	/// envelope.badge.shield.half.filled.fill
	static var envelope_badge_shield_half_filled_fill: UIImage? {
		return UIImage(systemName: "envelope.badge.shield.half.filled.fill")
	}

	/// mail.stack
	static var mail_stack: UIImage? {
		return UIImage(systemName: "mail.stack")
	}

	/// mail.stack.fill
	static var mail_stack_fill: UIImage? {
		return UIImage(systemName: "mail.stack.fill")
	}

	/// mail
	static var mail: UIImage? {
		return UIImage(systemName: "mail")
	}

	/// mail.fill
	static var mail_fill: UIImage? {
		return UIImage(systemName: "mail.fill")
	}

	/// mail.and.text.magnifyingglass
	static var mail_and_text_magnifyingglass: UIImage? {
		return UIImage(systemName: "mail.and.text.magnifyingglass")
	}

	/// rectangle.and.text.magnifyingglass
	static var rectangle_and_text_magnifyingglass: UIImage? {
		return UIImage(systemName: "rectangle.and.text.magnifyingglass")
	}

	/// arrow.up.right.and.arrow.down.left.rectangle
	static var arrow_up_right_and_arrow_down_left_rectangle: UIImage? {
		return UIImage(systemName: "arrow.up.right.and.arrow.down.left.rectangle")
	}

	/// arrow.up.right.and.arrow.down.left.rectangle.fill
	static var arrow_up_right_and_arrow_down_left_rectangle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.right.and.arrow.down.left.rectangle.fill")
	}

	/// gear
	static var gear: UIImage? {
		return UIImage(systemName: "gear")
	}

	/// gear.circle
	static var gear_circle: UIImage? {
		return UIImage(systemName: "gear.circle")
	}

	/// gear.circle.fill
	static var gear_circle_fill: UIImage? {
		return UIImage(systemName: "gear.circle.fill")
	}

	/// gearshape
	static var gearshape: UIImage? {
		return UIImage(systemName: "gearshape")
	}

	/// gearshape.fill
	static var gearshape_fill: UIImage? {
		return UIImage(systemName: "gearshape.fill")
	}

	/// gearshape.circle
	static var gearshape_circle: UIImage? {
		return UIImage(systemName: "gearshape.circle")
	}

	/// gearshape.circle.fill
	static var gearshape_circle_fill: UIImage? {
		return UIImage(systemName: "gearshape.circle.fill")
	}

	/// gearshape.2
	static var gearshape_2: UIImage? {
		return UIImage(systemName: "gearshape.2")
	}

	/// gearshape.2.fill
	static var gearshape_2_fill: UIImage? {
		return UIImage(systemName: "gearshape.2.fill")
	}

	/// signature
	static var signature: UIImage? {
		return UIImage(systemName: "signature")
	}

	/// line.3.crossed.swirl.circle
	static var line_3_crossed_swirl_circle: UIImage? {
		return UIImage(systemName: "line.3.crossed.swirl.circle")
	}

	/// line.3.crossed.swirl.circle.fill
	static var line_3_crossed_swirl_circle_fill: UIImage? {
		return UIImage(systemName: "line.3.crossed.swirl.circle.fill")
	}

	/// scissors
	static var scissors: UIImage? {
		return UIImage(systemName: "scissors")
	}

	/// scissors.badge.ellipsis
	static var scissors_badge_ellipsis: UIImage? {
		return UIImage(systemName: "scissors.badge.ellipsis")
	}

	/// ellipsis
	static var ellipsis: UIImage? {
		return UIImage(systemName: "ellipsis")
	}

	/// ellipsis.circle
	static var ellipsis_circle: UIImage? {
		return UIImage(systemName: "ellipsis.circle")
	}

	/// ellipsis.circle.fill
	static var ellipsis_circle_fill: UIImage? {
		return UIImage(systemName: "ellipsis.circle.fill")
	}

	/// ellipsis.rectangle
	static var ellipsis_rectangle: UIImage? {
		return UIImage(systemName: "ellipsis.rectangle")
	}

	/// ellipsis.rectangle.fill
	static var ellipsis_rectangle_fill: UIImage? {
		return UIImage(systemName: "ellipsis.rectangle.fill")
	}

	/// bag
	static var bag: UIImage? {
		return UIImage(systemName: "bag")
	}

	/// bag.fill
	static var bag_fill: UIImage? {
		return UIImage(systemName: "bag.fill")
	}

	/// bag.circle
	static var bag_circle: UIImage? {
		return UIImage(systemName: "bag.circle")
	}

	/// bag.circle.fill
	static var bag_circle_fill: UIImage? {
		return UIImage(systemName: "bag.circle.fill")
	}

	/// bag.badge.plus
	static var bag_badge_plus: UIImage? {
		return UIImage(systemName: "bag.badge.plus")
	}

	/// bag.fill.badge.plus
	static var bag_fill_badge_plus: UIImage? {
		return UIImage(systemName: "bag.fill.badge.plus")
	}

	/// bag.badge.minus
	static var bag_badge_minus: UIImage? {
		return UIImage(systemName: "bag.badge.minus")
	}

	/// bag.fill.badge.minus
	static var bag_fill_badge_minus: UIImage? {
		return UIImage(systemName: "bag.fill.badge.minus")
	}

	/// cart
	static var cart: UIImage? {
		return UIImage(systemName: "cart")
	}

	/// cart.fill
	static var cart_fill: UIImage? {
		return UIImage(systemName: "cart.fill")
	}

	/// cart.circle
	static var cart_circle: UIImage? {
		return UIImage(systemName: "cart.circle")
	}

	/// cart.circle.fill
	static var cart_circle_fill: UIImage? {
		return UIImage(systemName: "cart.circle.fill")
	}

	/// cart.badge.plus
	static var cart_badge_plus: UIImage? {
		return UIImage(systemName: "cart.badge.plus")
	}

	/// cart.fill.badge.plus
	static var cart_fill_badge_plus: UIImage? {
		return UIImage(systemName: "cart.fill.badge.plus")
	}

	/// cart.badge.minus
	static var cart_badge_minus: UIImage? {
		return UIImage(systemName: "cart.badge.minus")
	}

	/// cart.fill.badge.minus
	static var cart_fill_badge_minus: UIImage? {
		return UIImage(systemName: "cart.fill.badge.minus")
	}

	/// creditcard
	static var creditcard: UIImage? {
		return UIImage(systemName: "creditcard")
	}

	/// creditcard.fill
	static var creditcard_fill: UIImage? {
		return UIImage(systemName: "creditcard.fill")
	}

	/// creditcard.circle
	static var creditcard_circle: UIImage? {
		return UIImage(systemName: "creditcard.circle")
	}

	/// creditcard.circle.fill
	static var creditcard_circle_fill: UIImage? {
		return UIImage(systemName: "creditcard.circle.fill")
	}

	/// creditcard.and.123
	static var creditcard_and_123: UIImage? {
		return UIImage(systemName: "creditcard.and.123")
	}

	/// creditcard.trianglebadge.exclamationmark
	static var creditcard_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "creditcard.trianglebadge.exclamationmark")
	}

	/// giftcard
	static var giftcard: UIImage? {
		return UIImage(systemName: "giftcard")
	}

	/// giftcard.fill
	static var giftcard_fill: UIImage? {
		return UIImage(systemName: "giftcard.fill")
	}

	/// wallet.pass
	static var wallet_pass: UIImage? {
		return UIImage(systemName: "wallet.pass")
	}

	/// wallet.pass.fill
	static var wallet_pass_fill: UIImage? {
		return UIImage(systemName: "wallet.pass.fill")
	}

	/// wand.and.rays
	static var wand_and_rays: UIImage? {
		return UIImage(systemName: "wand.and.rays")
	}

	/// wand.and.rays.inverse
	static var wand_and_rays_inverse: UIImage? {
		return UIImage(systemName: "wand.and.rays.inverse")
	}

	/// wand.and.stars
	static var wand_and_stars: UIImage? {
		return UIImage(systemName: "wand.and.stars")
	}

	/// wand.and.stars.inverse
	static var wand_and_stars_inverse: UIImage? {
		return UIImage(systemName: "wand.and.stars.inverse")
	}

	/// crop
	static var crop: UIImage? {
		return UIImage(systemName: "crop")
	}

	/// crop.rotate
	static var crop_rotate: UIImage? {
		return UIImage(systemName: "crop.rotate")
	}

	/// dial.min
	static var dial_min: UIImage? {
		return UIImage(systemName: "dial.min")
	}

	/// dial.min.fill
	static var dial_min_fill: UIImage? {
		return UIImage(systemName: "dial.min.fill")
	}

	/// dial.max
	static var dial_max: UIImage? {
		return UIImage(systemName: "dial.max")
	}

	/// dial.max.fill
	static var dial_max_fill: UIImage? {
		return UIImage(systemName: "dial.max.fill")
	}

	/// gyroscope
	static var gyroscope: UIImage? {
		return UIImage(systemName: "gyroscope")
	}

	/// nosign
	static var nosign: UIImage? {
		return UIImage(systemName: "nosign")
	}

	/// gauge
	static var gauge: UIImage? {
		return UIImage(systemName: "gauge")
	}

	/// gauge.badge.plus
	static var gauge_badge_plus: UIImage? {
		return UIImage(systemName: "gauge.badge.plus")
	}

	/// gauge.badge.minus
	static var gauge_badge_minus: UIImage? {
		return UIImage(systemName: "gauge.badge.minus")
	}

	/// speedometer
	static var speedometer: UIImage? {
		return UIImage(systemName: "speedometer")
	}

	/// barometer
	static var barometer: UIImage? {
		return UIImage(systemName: "barometer")
	}

	/// metronome
	static var metronome: UIImage? {
		return UIImage(systemName: "metronome")
	}

	/// metronome.fill
	static var metronome_fill: UIImage? {
		return UIImage(systemName: "metronome.fill")
	}

	/// amplifier
	static var amplifier: UIImage? {
		return UIImage(systemName: "amplifier")
	}

	/// dice
	static var dice: UIImage? {
		return UIImage(systemName: "dice")
	}

	/// dice.fill
	static var dice_fill: UIImage? {
		return UIImage(systemName: "dice.fill")
	}

	/// die.face.1
	static var die_face_1: UIImage? {
		return UIImage(systemName: "die.face.1")
	}

	/// die.face.1.fill
	static var die_face_1_fill: UIImage? {
		return UIImage(systemName: "die.face.1.fill")
	}

	/// die.face.2
	static var die_face_2: UIImage? {
		return UIImage(systemName: "die.face.2")
	}

	/// die.face.2.fill
	static var die_face_2_fill: UIImage? {
		return UIImage(systemName: "die.face.2.fill")
	}

	/// die.face.3
	static var die_face_3: UIImage? {
		return UIImage(systemName: "die.face.3")
	}

	/// die.face.3.fill
	static var die_face_3_fill: UIImage? {
		return UIImage(systemName: "die.face.3.fill")
	}

	/// die.face.4
	static var die_face_4: UIImage? {
		return UIImage(systemName: "die.face.4")
	}

	/// die.face.4.fill
	static var die_face_4_fill: UIImage? {
		return UIImage(systemName: "die.face.4.fill")
	}

	/// die.face.5
	static var die_face_5: UIImage? {
		return UIImage(systemName: "die.face.5")
	}

	/// die.face.5.fill
	static var die_face_5_fill: UIImage? {
		return UIImage(systemName: "die.face.5.fill")
	}

	/// die.face.6
	static var die_face_6: UIImage? {
		return UIImage(systemName: "die.face.6")
	}

	/// die.face.6.fill
	static var die_face_6_fill: UIImage? {
		return UIImage(systemName: "die.face.6.fill")
	}

	/// square.grid.3x3.square
	static var square_grid_3x3_square: UIImage? {
		return UIImage(systemName: "square.grid.3x3.square")
	}

	/// pianokeys
	static var pianokeys: UIImage? {
		return UIImage(systemName: "pianokeys")
	}

	/// pianokeys.inverse
	static var pianokeys_inverse: UIImage? {
		return UIImage(systemName: "pianokeys.inverse")
	}

	/// tuningfork
	static var tuningfork: UIImage? {
		return UIImage(systemName: "tuningfork")
	}

	/// paintbrush
	static var paintbrush: UIImage? {
		return UIImage(systemName: "paintbrush")
	}

	/// paintbrush.fill
	static var paintbrush_fill: UIImage? {
		return UIImage(systemName: "paintbrush.fill")
	}

	/// paintbrush.pointed
	static var paintbrush_pointed: UIImage? {
		return UIImage(systemName: "paintbrush.pointed")
	}

	/// paintbrush.pointed.fill
	static var paintbrush_pointed_fill: UIImage? {
		return UIImage(systemName: "paintbrush.pointed.fill")
	}

	/// bandage
	static var bandage: UIImage? {
		return UIImage(systemName: "bandage")
	}

	/// bandage.fill
	static var bandage_fill: UIImage? {
		return UIImage(systemName: "bandage.fill")
	}

	/// ruler
	static var ruler: UIImage? {
		return UIImage(systemName: "ruler")
	}

	/// ruler.fill
	static var ruler_fill: UIImage? {
		return UIImage(systemName: "ruler.fill")
	}

	/// level
	static var level: UIImage? {
		return UIImage(systemName: "level")
	}

	/// level.fill
	static var level_fill: UIImage? {
		return UIImage(systemName: "level.fill")
	}

	/// lines.measurement.horizontal
	static var lines_measurement_horizontal: UIImage? {
		return UIImage(systemName: "lines.measurement.horizontal")
	}

	/// wrench
	static var wrench: UIImage? {
		return UIImage(systemName: "wrench")
	}

	/// wrench.fill
	static var wrench_fill: UIImage? {
		return UIImage(systemName: "wrench.fill")
	}

	/// hammer
	static var hammer: UIImage? {
		return UIImage(systemName: "hammer")
	}

	/// hammer.fill
	static var hammer_fill: UIImage? {
		return UIImage(systemName: "hammer.fill")
	}

	/// hammer.circle
	static var hammer_circle: UIImage? {
		return UIImage(systemName: "hammer.circle")
	}

	/// hammer.circle.fill
	static var hammer_circle_fill: UIImage? {
		return UIImage(systemName: "hammer.circle.fill")
	}

	/// screwdriver
	static var screwdriver: UIImage? {
		return UIImage(systemName: "screwdriver")
	}

	/// screwdriver.fill
	static var screwdriver_fill: UIImage? {
		return UIImage(systemName: "screwdriver.fill")
	}

	/// eyedropper
	static var eyedropper: UIImage? {
		return UIImage(systemName: "eyedropper")
	}

	/// eyedropper.halffull
	static var eyedropper_halffull: UIImage? {
		return UIImage(systemName: "eyedropper.halffull")
	}

	/// eyedropper.full
	static var eyedropper_full: UIImage? {
		return UIImage(systemName: "eyedropper.full")
	}

	/// wrench.and.screwdriver
	static var wrench_and_screwdriver: UIImage? {
		return UIImage(systemName: "wrench.and.screwdriver")
	}

	/// wrench.and.screwdriver.fill
	static var wrench_and_screwdriver_fill: UIImage? {
		return UIImage(systemName: "wrench.and.screwdriver.fill")
	}

	/// applescript
	static var applescript: UIImage? {
		return UIImage(systemName: "applescript")
	}

	/// applescript.fill
	static var applescript_fill: UIImage? {
		return UIImage(systemName: "applescript.fill")
	}

	/// scroll
	static var scroll: UIImage? {
		return UIImage(systemName: "scroll")
	}

	/// scroll.fill
	static var scroll_fill: UIImage? {
		return UIImage(systemName: "scroll.fill")
	}

	/// stethoscope
	static var stethoscope: UIImage? {
		return UIImage(systemName: "stethoscope")
	}

	/// printer
	static var printer: UIImage? {
		return UIImage(systemName: "printer")
	}

	/// printer.fill
	static var printer_fill: UIImage? {
		return UIImage(systemName: "printer.fill")
	}

	/// printer.filled.and.paper
	static var printer_filled_and_paper: UIImage? {
		return UIImage(systemName: "printer.filled.and.paper")
	}

	/// printer.dotmatrix
	static var printer_dotmatrix: UIImage? {
		return UIImage(systemName: "printer.dotmatrix")
	}

	/// printer.dotmatrix.fill
	static var printer_dotmatrix_fill: UIImage? {
		return UIImage(systemName: "printer.dotmatrix.fill")
	}

	/// printer.dotmatrix.filled.and.paper
	static var printer_dotmatrix_filled_and_paper: UIImage? {
		return UIImage(systemName: "printer.dotmatrix.filled.and.paper")
	}

	/// scanner
	static var scanner: UIImage? {
		return UIImage(systemName: "scanner")
	}

	/// scanner.fill
	static var scanner_fill: UIImage? {
		return UIImage(systemName: "scanner.fill")
	}

	/// faxmachine
	static var faxmachine: UIImage? {
		return UIImage(systemName: "faxmachine")
	}

	/// briefcase
	static var briefcase: UIImage? {
		return UIImage(systemName: "briefcase")
	}

	/// briefcase.fill
	static var briefcase_fill: UIImage? {
		return UIImage(systemName: "briefcase.fill")
	}

	/// briefcase.circle
	static var briefcase_circle: UIImage? {
		return UIImage(systemName: "briefcase.circle")
	}

	/// briefcase.circle.fill
	static var briefcase_circle_fill: UIImage? {
		return UIImage(systemName: "briefcase.circle.fill")
	}

	/// case
	static var case_Image: UIImage? {
		return UIImage(systemName: "case")
	}

	/// case.fill
	static var case_fill: UIImage? {
		return UIImage(systemName: "case.fill")
	}

	/// latch.2.case
	static var latch_2_case: UIImage? {
		return UIImage(systemName: "latch.2.case")
	}

	/// latch.2.case.fill
	static var latch_2_case_fill: UIImage? {
		return UIImage(systemName: "latch.2.case.fill")
	}

	/// cross.case
	static var cross_case: UIImage? {
		return UIImage(systemName: "cross.case")
	}

	/// cross.case.fill
	static var cross_case_fill: UIImage? {
		return UIImage(systemName: "cross.case.fill")
	}

	/// suitcase
	static var suitcase: UIImage? {
		return UIImage(systemName: "suitcase")
	}

	/// suitcase.fill
	static var suitcase_fill: UIImage? {
		return UIImage(systemName: "suitcase.fill")
	}

	/// suitcase.cart
	static var suitcase_cart: UIImage? {
		return UIImage(systemName: "suitcase.cart")
	}

	/// suitcase.cart.fill
	static var suitcase_cart_fill: UIImage? {
		return UIImage(systemName: "suitcase.cart.fill")
	}

	/// theatermasks
	static var theatermasks: UIImage? {
		return UIImage(systemName: "theatermasks")
	}

	/// theatermasks.fill
	static var theatermasks_fill: UIImage? {
		return UIImage(systemName: "theatermasks.fill")
	}

	/// theatermasks.circle
	static var theatermasks_circle: UIImage? {
		return UIImage(systemName: "theatermasks.circle")
	}

	/// theatermasks.circle.fill
	static var theatermasks_circle_fill: UIImage? {
		return UIImage(systemName: "theatermasks.circle.fill")
	}

	/// puzzlepiece.extension
	static var puzzlepiece_extension: UIImage? {
		return UIImage(systemName: "puzzlepiece.extension")
	}

	/// puzzlepiece.extension.fill
	static var puzzlepiece_extension_fill: UIImage? {
		return UIImage(systemName: "puzzlepiece.extension.fill")
	}

	/// puzzlepiece
	static var puzzlepiece: UIImage? {
		return UIImage(systemName: "puzzlepiece")
	}

	/// puzzlepiece.fill
	static var puzzlepiece_fill: UIImage? {
		return UIImage(systemName: "puzzlepiece.fill")
	}

	/// homekit
	static var homekit: UIImage? {
		return UIImage(systemName: "homekit")
	}

	/// house
	static var house: UIImage? {
		return UIImage(systemName: "house")
	}

	/// house.fill
	static var house_fill: UIImage? {
		return UIImage(systemName: "house.fill")
	}

	/// house.circle
	static var house_circle: UIImage? {
		return UIImage(systemName: "house.circle")
	}

	/// house.circle.fill
	static var house_circle_fill: UIImage? {
		return UIImage(systemName: "house.circle.fill")
	}

	/// music.note.house
	static var music_note_house: UIImage? {
		return UIImage(systemName: "music.note.house")
	}

	/// music.note.house.fill
	static var music_note_house_fill: UIImage? {
		return UIImage(systemName: "music.note.house.fill")
	}

	/// building.columns
	static var building_columns: UIImage? {
		return UIImage(systemName: "building.columns")
	}

	/// building.columns.fill
	static var building_columns_fill: UIImage? {
		return UIImage(systemName: "building.columns.fill")
	}

	/// signpost.left
	static var signpost_left: UIImage? {
		return UIImage(systemName: "signpost.left")
	}

	/// signpost.left.fill
	static var signpost_left_fill: UIImage? {
		return UIImage(systemName: "signpost.left.fill")
	}

	/// signpost.right
	static var signpost_right: UIImage? {
		return UIImage(systemName: "signpost.right")
	}

	/// signpost.right.fill
	static var signpost_right_fill: UIImage? {
		return UIImage(systemName: "signpost.right.fill")
	}

	/// square.split.bottomrightquarter
	static var square_split_bottomrightquarter: UIImage? {
		return UIImage(systemName: "square.split.bottomrightquarter")
	}

	/// square.split.bottomrightquarter.fill
	static var square_split_bottomrightquarter_fill: UIImage? {
		return UIImage(systemName: "square.split.bottomrightquarter.fill")
	}

	/// building
	static var building: UIImage? {
		return UIImage(systemName: "building")
	}

	/// building.fill
	static var building_fill: UIImage? {
		return UIImage(systemName: "building.fill")
	}

	/// building.2
	static var building_2: UIImage? {
		return UIImage(systemName: "building.2")
	}

	/// building.2.fill
	static var building_2_fill: UIImage? {
		return UIImage(systemName: "building.2.fill")
	}

	/// building.2.crop.circle
	static var building_2_crop_circle: UIImage? {
		return UIImage(systemName: "building.2.crop.circle")
	}

	/// building.2.crop.circle.fill
	static var building_2_crop_circle_fill: UIImage? {
		return UIImage(systemName: "building.2.crop.circle.fill")
	}

	/// lock
	static var lock: UIImage? {
		return UIImage(systemName: "lock")
	}

	/// lock.fill
	static var lock_fill: UIImage? {
		return UIImage(systemName: "lock.fill")
	}

	/// lock.circle
	static var lock_circle: UIImage? {
		return UIImage(systemName: "lock.circle")
	}

	/// lock.circle.fill
	static var lock_circle_fill: UIImage? {
		return UIImage(systemName: "lock.circle.fill")
	}

	/// lock.square
	static var lock_square: UIImage? {
		return UIImage(systemName: "lock.square")
	}

	/// lock.square.fill
	static var lock_square_fill: UIImage? {
		return UIImage(systemName: "lock.square.fill")
	}

	/// lock.square.stack
	static var lock_square_stack: UIImage? {
		return UIImage(systemName: "lock.square.stack")
	}

	/// lock.square.stack.fill
	static var lock_square_stack_fill: UIImage? {
		return UIImage(systemName: "lock.square.stack.fill")
	}

	/// lock.rectangle
	static var lock_rectangle: UIImage? {
		return UIImage(systemName: "lock.rectangle")
	}

	/// lock.rectangle.fill
	static var lock_rectangle_fill: UIImage? {
		return UIImage(systemName: "lock.rectangle.fill")
	}

	/// lock.rectangle.stack
	static var lock_rectangle_stack: UIImage? {
		return UIImage(systemName: "lock.rectangle.stack")
	}

	/// lock.rectangle.stack.fill
	static var lock_rectangle_stack_fill: UIImage? {
		return UIImage(systemName: "lock.rectangle.stack.fill")
	}

	/// lock.rectangle.on.rectangle
	static var lock_rectangle_on_rectangle: UIImage? {
		return UIImage(systemName: "lock.rectangle.on.rectangle")
	}

	/// lock.rectangle.on.rectangle.fill
	static var lock_rectangle_on_rectangle_fill: UIImage? {
		return UIImage(systemName: "lock.rectangle.on.rectangle.fill")
	}

	/// lock.shield
	static var lock_shield: UIImage? {
		return UIImage(systemName: "lock.shield")
	}

	/// lock.shield.fill
	static var lock_shield_fill: UIImage? {
		return UIImage(systemName: "lock.shield.fill")
	}

	/// lock.slash
	static var lock_slash: UIImage? {
		return UIImage(systemName: "lock.slash")
	}

	/// lock.slash.fill
	static var lock_slash_fill: UIImage? {
		return UIImage(systemName: "lock.slash.fill")
	}

	/// lock.open
	static var lock_open: UIImage? {
		return UIImage(systemName: "lock.open")
	}

	/// lock.open.fill
	static var lock_open_fill: UIImage? {
		return UIImage(systemName: "lock.open.fill")
	}

	/// lock.rotation
	static var lock_rotation: UIImage? {
		return UIImage(systemName: "lock.rotation")
	}

	/// lock.rotation.open
	static var lock_rotation_open: UIImage? {
		return UIImage(systemName: "lock.rotation.open")
	}

	/// key
	static var key: UIImage? {
		return UIImage(systemName: "key")
	}

	/// key.fill
	static var key_fill: UIImage? {
		return UIImage(systemName: "key.fill")
	}

	/// wifi
	static var wifi: UIImage? {
		return UIImage(systemName: "wifi")
	}

	/// wifi.circle
	static var wifi_circle: UIImage? {
		return UIImage(systemName: "wifi.circle")
	}

	/// wifi.circle.fill
	static var wifi_circle_fill: UIImage? {
		return UIImage(systemName: "wifi.circle.fill")
	}

	/// wifi.square
	static var wifi_square: UIImage? {
		return UIImage(systemName: "wifi.square")
	}

	/// wifi.square.fill
	static var wifi_square_fill: UIImage? {
		return UIImage(systemName: "wifi.square.fill")
	}

	/// wifi.slash
	static var wifi_slash: UIImage? {
		return UIImage(systemName: "wifi.slash")
	}

	/// wifi.exclamationmark
	static var wifi_exclamationmark: UIImage? {
		return UIImage(systemName: "wifi.exclamationmark")
	}

	/// pin
	static var pin: UIImage? {
		return UIImage(systemName: "pin")
	}

	/// pin.fill
	static var pin_fill: UIImage? {
		return UIImage(systemName: "pin.fill")
	}

	/// pin.circle
	static var pin_circle: UIImage? {
		return UIImage(systemName: "pin.circle")
	}

	/// pin.circle.fill
	static var pin_circle_fill: UIImage? {
		return UIImage(systemName: "pin.circle.fill")
	}

	/// pin.square
	static var pin_square: UIImage? {
		return UIImage(systemName: "pin.square")
	}

	/// pin.square.fill
	static var pin_square_fill: UIImage? {
		return UIImage(systemName: "pin.square.fill")
	}

	/// pin.slash
	static var pin_slash: UIImage? {
		return UIImage(systemName: "pin.slash")
	}

	/// pin.slash.fill
	static var pin_slash_fill: UIImage? {
		return UIImage(systemName: "pin.slash.fill")
	}

	/// mappin
	static var mappin: UIImage? {
		return UIImage(systemName: "mappin")
	}

	/// mappin.circle
	static var mappin_circle: UIImage? {
		return UIImage(systemName: "mappin.circle")
	}

	/// mappin.circle.fill
	static var mappin_circle_fill: UIImage? {
		return UIImage(systemName: "mappin.circle.fill")
	}

	/// mappin.square
	static var mappin_square: UIImage? {
		return UIImage(systemName: "mappin.square")
	}

	/// mappin.square.fill
	static var mappin_square_fill: UIImage? {
		return UIImage(systemName: "mappin.square.fill")
	}

	/// mappin.slash
	static var mappin_slash: UIImage? {
		return UIImage(systemName: "mappin.slash")
	}

	/// mappin.and.ellipse
	static var mappin_and_ellipse: UIImage? {
		return UIImage(systemName: "mappin.and.ellipse")
	}

	/// map
	static var map: UIImage? {
		return UIImage(systemName: "map")
	}

	/// map.fill
	static var map_fill: UIImage? {
		return UIImage(systemName: "map.fill")
	}

	/// map.circle
	static var map_circle: UIImage? {
		return UIImage(systemName: "map.circle")
	}

	/// map.circle.fill
	static var map_circle_fill: UIImage? {
		return UIImage(systemName: "map.circle.fill")
	}

	/// safari
	static var safari: UIImage? {
		return UIImage(systemName: "safari")
	}

	/// safari.fill
	static var safari_fill: UIImage? {
		return UIImage(systemName: "safari.fill")
	}

	/// move.3d
	static var move_3d: UIImage? {
		return UIImage(systemName: "move.3d")
	}

	/// scale.3d
	static var scale_3d: UIImage? {
		return UIImage(systemName: "scale.3d")
	}

	/// rotate.3d
	static var rotate_3d: UIImage? {
		return UIImage(systemName: "rotate.3d")
	}

	/// torus
	static var torus: UIImage? {
		return UIImage(systemName: "torus")
	}

	/// rotate.left
	static var rotate_left: UIImage? {
		return UIImage(systemName: "rotate.left")
	}

	/// rotate.left.fill
	static var rotate_left_fill: UIImage? {
		return UIImage(systemName: "rotate.left.fill")
	}

	/// rotate.right
	static var rotate_right: UIImage? {
		return UIImage(systemName: "rotate.right")
	}

	/// rotate.right.fill
	static var rotate_right_fill: UIImage? {
		return UIImage(systemName: "rotate.right.fill")
	}

	/// selection.pin.in.out
	static var selection_pin_in_out: UIImage? {
		return UIImage(systemName: "selection.pin.in.out")
	}

	/// powerplug
	static var powerplug: UIImage? {
		return UIImage(systemName: "powerplug")
	}

	/// powerplug.fill
	static var powerplug_fill: UIImage? {
		return UIImage(systemName: "powerplug.fill")
	}

	/// timeline.selection
	static var timeline_selection: UIImage? {
		return UIImage(systemName: "timeline.selection")
	}

	/// cpu
	static var cpu: UIImage? {
		return UIImage(systemName: "cpu")
	}

	/// cpu.fill
	static var cpu_fill: UIImage? {
		return UIImage(systemName: "cpu.fill")
	}

	/// memorychip
	static var memorychip: UIImage? {
		return UIImage(systemName: "memorychip")
	}

	/// memorychip.fill
	static var memorychip_fill: UIImage? {
		return UIImage(systemName: "memorychip.fill")
	}

	/// opticaldisc
	static var opticaldisc: UIImage? {
		return UIImage(systemName: "opticaldisc")
	}

	/// display
	static var display: UIImage? {
		return UIImage(systemName: "display")
	}

	/// lock.display
	static var lock_display: UIImage? {
		return UIImage(systemName: "lock.display")
	}

	/// lock.open.display
	static var lock_open_display: UIImage? {
		return UIImage(systemName: "lock.open.display")
	}

	/// display.and.arrow.down
	static var display_and_arrow_down: UIImage? {
		return UIImage(systemName: "display.and.arrow.down")
	}

	/// display.trianglebadge.exclamationmark
	static var display_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "display.trianglebadge.exclamationmark")
	}

	/// display.2
	static var display_2: UIImage? {
		return UIImage(systemName: "display.2")
	}

	/// desktopcomputer
	static var desktopcomputer: UIImage? {
		return UIImage(systemName: "desktopcomputer")
	}

	/// lock.desktopcomputer
	static var lock_desktopcomputer: UIImage? {
		return UIImage(systemName: "lock.desktopcomputer")
	}

	/// lock.open.desktopcomputer
	static var lock_open_desktopcomputer: UIImage? {
		return UIImage(systemName: "lock.open.desktopcomputer")
	}

	/// desktopcomputer.and.arrow.down
	static var desktopcomputer_and_arrow_down: UIImage? {
		return UIImage(systemName: "desktopcomputer.and.arrow.down")
	}

	/// desktopcomputer.trianglebadge.exclamationmark
	static var desktopcomputer_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "desktopcomputer.trianglebadge.exclamationmark")
	}

	/// pc
	static var pc: UIImage? {
		return UIImage(systemName: "pc")
	}

	/// macpro.gen1
	static var macpro_gen1: UIImage? {
		return UIImage(systemName: "macpro.gen1")
	}

	/// macpro.gen1.fill
	static var macpro_gen1_fill: UIImage? {
		return UIImage(systemName: "macpro.gen1.fill")
	}

	/// macpro.gen2
	static var macpro_gen2: UIImage? {
		return UIImage(systemName: "macpro.gen2")
	}

	/// macpro.gen2.fill
	static var macpro_gen2_fill: UIImage? {
		return UIImage(systemName: "macpro.gen2.fill")
	}

	/// macpro.gen3
	static var macpro_gen3: UIImage? {
		return UIImage(systemName: "macpro.gen3")
	}

	/// macpro.gen3.fill
	static var macpro_gen3_fill: UIImage? {
		return UIImage(systemName: "macpro.gen3.fill")
	}

	/// macpro.gen3.server
	static var macpro_gen3_server: UIImage? {
		return UIImage(systemName: "macpro.gen3.server")
	}

	/// server.rack
	static var server_rack: UIImage? {
		return UIImage(systemName: "server.rack")
	}

	/// xserve
	static var xserve: UIImage? {
		return UIImage(systemName: "xserve")
	}

	/// laptopcomputer
	static var laptopcomputer: UIImage? {
		return UIImage(systemName: "laptopcomputer")
	}

	/// lock.laptopcomputer
	static var lock_laptopcomputer: UIImage? {
		return UIImage(systemName: "lock.laptopcomputer")
	}

	/// lock.open.laptopcomputer
	static var lock_open_laptopcomputer: UIImage? {
		return UIImage(systemName: "lock.open.laptopcomputer")
	}

	/// laptopcomputer.and.arrow.down
	static var laptopcomputer_and_arrow_down: UIImage? {
		return UIImage(systemName: "laptopcomputer.and.arrow.down")
	}

	/// laptopcomputer.trianglebadge.exclamationmark
	static var laptopcomputer_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "laptopcomputer.trianglebadge.exclamationmark")
	}

	/// laptopcomputer.and.iphone
	static var laptopcomputer_and_iphone: UIImage? {
		return UIImage(systemName: "laptopcomputer.and.iphone")
	}

	/// ipad.and.iphone
	static var ipad_and_iphone: UIImage? {
		return UIImage(systemName: "ipad.and.iphone")
	}

	/// macmini
	static var macmini: UIImage? {
		return UIImage(systemName: "macmini")
	}

	/// macmini.fill
	static var macmini_fill: UIImage? {
		return UIImage(systemName: "macmini.fill")
	}

	/// airport.express
	static var airport_express: UIImage? {
		return UIImage(systemName: "airport.express")
	}

	/// airport.extreme
	static var airport_extreme: UIImage? {
		return UIImage(systemName: "airport.extreme")
	}

	/// airport.extreme.tower
	static var airport_extreme_tower: UIImage? {
		return UIImage(systemName: "airport.extreme.tower")
	}

	/// ipod
	static var ipod: UIImage? {
		return UIImage(systemName: "ipod")
	}

	/// ipodshuffle.gen1
	static var ipodshuffle_gen1: UIImage? {
		return UIImage(systemName: "ipodshuffle.gen1")
	}

	/// ipodshuffle.gen2
	static var ipodshuffle_gen2: UIImage? {
		return UIImage(systemName: "ipodshuffle.gen2")
	}

	/// ipodshuffle.gen3
	static var ipodshuffle_gen3: UIImage? {
		return UIImage(systemName: "ipodshuffle.gen3")
	}

	/// ipodshuffle.gen4
	static var ipodshuffle_gen4: UIImage? {
		return UIImage(systemName: "ipodshuffle.gen4")
	}

	/// ipodtouch
	static var ipodtouch: UIImage? {
		return UIImage(systemName: "ipodtouch")
	}

	/// ipodtouch.slash
	static var ipodtouch_slash: UIImage? {
		return UIImage(systemName: "ipodtouch.slash")
	}

	/// ipodtouch.landscape
	static var ipodtouch_landscape: UIImage? {
		return UIImage(systemName: "ipodtouch.landscape")
	}

	/// flipphone
	static var flipphone: UIImage? {
		return UIImage(systemName: "flipphone")
	}

	/// candybarphone
	static var candybarphone: UIImage? {
		return UIImage(systemName: "candybarphone")
	}

	/// iphone.homebutton
	static var iphone_homebutton: UIImage? {
		return UIImage(systemName: "iphone.homebutton")
	}

	/// iphone.homebutton.circle
	static var iphone_homebutton_circle: UIImage? {
		return UIImage(systemName: "iphone.homebutton.circle")
	}

	/// iphone.homebutton.circle.fill
	static var iphone_homebutton_circle_fill: UIImage? {
		return UIImage(systemName: "iphone.homebutton.circle.fill")
	}

	/// iphone.homebutton.landscape
	static var iphone_homebutton_landscape: UIImage? {
		return UIImage(systemName: "iphone.homebutton.landscape")
	}

	/// iphone.homebutton.radiowaves.left.and.right
	static var iphone_homebutton_radiowaves_left_and_right: UIImage? {
		return UIImage(systemName: "iphone.homebutton.radiowaves.left.and.right")
	}

	/// iphone.homebutton.slash
	static var iphone_homebutton_slash: UIImage? {
		return UIImage(systemName: "iphone.homebutton.slash")
	}

	/// iphone.homebutton.slash.circle
	static var iphone_homebutton_slash_circle: UIImage? {
		return UIImage(systemName: "iphone.homebutton.slash.circle")
	}

	/// iphone.homebutton.slash.circle.fill
	static var iphone_homebutton_slash_circle_fill: UIImage? {
		return UIImage(systemName: "iphone.homebutton.slash.circle.fill")
	}

	/// iphone.homebutton.badge.play
	static var iphone_homebutton_badge_play: UIImage? {
		return UIImage(systemName: "iphone.homebutton.badge.play")
	}

	/// iphone
	static var iphone: UIImage? {
		return UIImage(systemName: "iphone")
	}

	/// iphone.circle
	static var iphone_circle: UIImage? {
		return UIImage(systemName: "iphone.circle")
	}

	/// iphone.circle.fill
	static var iphone_circle_fill: UIImage? {
		return UIImage(systemName: "iphone.circle.fill")
	}

	/// iphone.landscape
	static var iphone_landscape: UIImage? {
		return UIImage(systemName: "iphone.landscape")
	}

	/// iphone.radiowaves.left.and.right
	static var iphone_radiowaves_left_and_right: UIImage? {
		return UIImage(systemName: "iphone.radiowaves.left.and.right")
	}

	/// iphone.slash
	static var iphone_slash: UIImage? {
		return UIImage(systemName: "iphone.slash")
	}

	/// iphone.slash.circle
	static var iphone_slash_circle: UIImage? {
		return UIImage(systemName: "iphone.slash.circle")
	}

	/// iphone.slash.circle.fill
	static var iphone_slash_circle_fill: UIImage? {
		return UIImage(systemName: "iphone.slash.circle.fill")
	}

	/// iphone.badge.play
	static var iphone_badge_play: UIImage? {
		return UIImage(systemName: "iphone.badge.play")
	}

	/// lock.iphone
	static var lock_iphone: UIImage? {
		return UIImage(systemName: "lock.iphone")
	}

	/// lock.open.iphone
	static var lock_open_iphone: UIImage? {
		return UIImage(systemName: "lock.open.iphone")
	}

	/// iphone.and.arrow.forward
	static var iphone_and_arrow_forward: UIImage? {
		return UIImage(systemName: "iphone.and.arrow.forward")
	}

	/// arrow.turn.up.forward.iphone
	static var arrow_turn_up_forward_iphone: UIImage? {
		return UIImage(systemName: "arrow.turn.up.forward.iphone")
	}

	/// arrow.turn.up.forward.iphone.fill
	static var arrow_turn_up_forward_iphone_fill: UIImage? {
		return UIImage(systemName: "arrow.turn.up.forward.iphone.fill")
	}

	/// iphone.rear.camera
	static var iphone_rear_camera: UIImage? {
		return UIImage(systemName: "iphone.rear.camera")
	}

	/// apps.iphone
	static var apps_iphone: UIImage? {
		return UIImage(systemName: "apps.iphone")
	}

	/// apps.iphone.badge.plus
	static var apps_iphone_badge_plus: UIImage? {
		return UIImage(systemName: "apps.iphone.badge.plus")
	}

	/// apps.iphone.landscape
	static var apps_iphone_landscape: UIImage? {
		return UIImage(systemName: "apps.iphone.landscape")
	}

	/// platter.2.filled.iphone
	static var platter_2_filled_iphone: UIImage? {
		return UIImage(systemName: "platter.2.filled.iphone")
	}

	/// platter.2.filled.iphone.landscape
	static var platter_2_filled_iphone_landscape: UIImage? {
		return UIImage(systemName: "platter.2.filled.iphone.landscape")
	}

	/// iphone.smartbatterycase.gen2
	static var iphone_smartbatterycase_gen2: UIImage? {
		return UIImage(systemName: "iphone.smartbatterycase.gen2")
	}

	/// iphone.smartbatterycase.gen1
	static var iphone_smartbatterycase_gen1: UIImage? {
		return UIImage(systemName: "iphone.smartbatterycase.gen1")
	}

	/// ipad.homebutton
	static var ipad_homebutton: UIImage? {
		return UIImage(systemName: "ipad.homebutton")
	}

	/// ipad.homebutton.badge.play
	static var ipad_homebutton_badge_play: UIImage? {
		return UIImage(systemName: "ipad.homebutton.badge.play")
	}

	/// ipad.homebutton.landscape
	static var ipad_homebutton_landscape: UIImage? {
		return UIImage(systemName: "ipad.homebutton.landscape")
	}

	/// ipad.homebutton.landscape.badge.play
	static var ipad_homebutton_landscape_badge_play: UIImage? {
		return UIImage(systemName: "ipad.homebutton.landscape.badge.play")
	}

	/// ipad
	static var ipad: UIImage? {
		return UIImage(systemName: "ipad")
	}

	/// ipad.badge.play
	static var ipad_badge_play: UIImage? {
		return UIImage(systemName: "ipad.badge.play")
	}

	/// lock.ipad
	static var lock_ipad: UIImage? {
		return UIImage(systemName: "lock.ipad")
	}

	/// lock.open.ipad
	static var lock_open_ipad: UIImage? {
		return UIImage(systemName: "lock.open.ipad")
	}

	/// ipad.and.arrow.forward
	static var ipad_and_arrow_forward: UIImage? {
		return UIImage(systemName: "ipad.and.arrow.forward")
	}

	/// ipad.landscape
	static var ipad_landscape: UIImage? {
		return UIImage(systemName: "ipad.landscape")
	}

	/// ipad.landscape.badge.play
	static var ipad_landscape_badge_play: UIImage? {
		return UIImage(systemName: "ipad.landscape.badge.play")
	}

	/// ipad.rear.camera
	static var ipad_rear_camera: UIImage? {
		return UIImage(systemName: "ipad.rear.camera")
	}

	/// apps.ipad
	static var apps_ipad: UIImage? {
		return UIImage(systemName: "apps.ipad")
	}

	/// apps.ipad.landscape
	static var apps_ipad_landscape: UIImage? {
		return UIImage(systemName: "apps.ipad.landscape")
	}

	/// platter.2.filled.ipad
	static var platter_2_filled_ipad: UIImage? {
		return UIImage(systemName: "platter.2.filled.ipad")
	}

	/// platter.2.filled.ipad.landscape
	static var platter_2_filled_ipad_landscape: UIImage? {
		return UIImage(systemName: "platter.2.filled.ipad.landscape")
	}

	/// applepencil
	static var applepencil: UIImage? {
		return UIImage(systemName: "applepencil")
	}

	/// magicmouse
	static var magicmouse: UIImage? {
		return UIImage(systemName: "magicmouse")
	}

	/// magicmouse.fill
	static var magicmouse_fill: UIImage? {
		return UIImage(systemName: "magicmouse.fill")
	}

	/// computermouse
	static var computermouse: UIImage? {
		return UIImage(systemName: "computermouse")
	}

	/// computermouse.fill
	static var computermouse_fill: UIImage? {
		return UIImage(systemName: "computermouse.fill")
	}

	/// applewatch
	static var applewatch: UIImage? {
		return UIImage(systemName: "applewatch")
	}

	/// applewatch.watchface
	static var applewatch_watchface: UIImage? {
		return UIImage(systemName: "applewatch.watchface")
	}

	/// exclamationmark.applewatch
	static var exclamationmark_applewatch: UIImage? {
		return UIImage(systemName: "exclamationmark.applewatch")
	}

	/// lock.applewatch
	static var lock_applewatch: UIImage? {
		return UIImage(systemName: "lock.applewatch")
	}

	/// lock.open.applewatch
	static var lock_open_applewatch: UIImage? {
		return UIImage(systemName: "lock.open.applewatch")
	}

	/// applewatch.radiowaves.left.and.right
	static var applewatch_radiowaves_left_and_right: UIImage? {
		return UIImage(systemName: "applewatch.radiowaves.left.and.right")
	}

	/// applewatch.slash
	static var applewatch_slash: UIImage? {
		return UIImage(systemName: "applewatch.slash")
	}

	/// applewatch.side.right
	static var applewatch_side_right: UIImage? {
		return UIImage(systemName: "applewatch.side.right")
	}

	/// watchface.applewatch.case
	static var watchface_applewatch_case: UIImage? {
		return UIImage(systemName: "watchface.applewatch.case")
	}

	/// platter.filled.top.applewatch.case
	static var platter_filled_top_applewatch_case: UIImage? {
		return UIImage(systemName: "platter.filled.top.applewatch.case")
	}

	/// platter.filled.bottom.applewatch.case
	static var platter_filled_bottom_applewatch_case: UIImage? {
		return UIImage(systemName: "platter.filled.bottom.applewatch.case")
	}

	/// platter.top.applewatch.case
	static var platter_top_applewatch_case: UIImage? {
		return UIImage(systemName: "platter.top.applewatch.case")
	}

	/// platter.bottom.applewatch.case
	static var platter_bottom_applewatch_case: UIImage? {
		return UIImage(systemName: "platter.bottom.applewatch.case")
	}

	/// digitalcrown.arrow.clockwise
	static var digitalcrown_arrow_clockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.arrow.clockwise")
	}

	/// digitalcrown.fill.arrow.clockwise
	static var digitalcrown_fill_arrow_clockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.fill.arrow.clockwise")
	}

	/// digitalcrown.arrow.counterclockwise
	static var digitalcrown_arrow_counterclockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.arrow.counterclockwise")
	}

	/// digitalcrown.fill.arrow.counterclockwise
	static var digitalcrown_fill_arrow_counterclockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.fill.arrow.counterclockwise")
	}

	/// digitalcrown.horizontal.arrow.clockwise
	static var digitalcrown_horizontal_arrow_clockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.horizontal.arrow.clockwise")
	}

	/// digitalcrown.horizontal.fill.arrow.clockwise
	static var digitalcrown_horizontal_fill_arrow_clockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.horizontal.fill.arrow.clockwise")
	}

	/// digitalcrown.horizontal.arrow.counterclockwise
	static var digitalcrown_horizontal_arrow_counterclockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.horizontal.arrow.counterclockwise")
	}

	/// digitalcrown.horizontal.fill.arrow.counterclockwise
	static var digitalcrown_horizontal_fill_arrow_counterclockwise: UIImage? {
		return UIImage(systemName: "digitalcrown.horizontal.fill.arrow.counterclockwise")
	}

	/// airpodsmax
	static var airpodsmax: UIImage? {
		return UIImage(systemName: "airpodsmax")
	}

	/// beats.headphones
	static var beats_headphones: UIImage? {
		return UIImage(systemName: "beats.headphones")
	}

	/// headphones
	static var headphones: UIImage? {
		return UIImage(systemName: "headphones")
	}

	/// headphones.circle
	static var headphones_circle: UIImage? {
		return UIImage(systemName: "headphones.circle")
	}

	/// headphones.circle.fill
	static var headphones_circle_fill: UIImage? {
		return UIImage(systemName: "headphones.circle.fill")
	}

	/// earbuds
	static var earbuds: UIImage? {
		return UIImage(systemName: "earbuds")
	}

	/// earbuds.case
	static var earbuds_case: UIImage? {
		return UIImage(systemName: "earbuds.case")
	}

	/// earbuds.case.fill
	static var earbuds_case_fill: UIImage? {
		return UIImage(systemName: "earbuds.case.fill")
	}

	/// earpods
	static var earpods: UIImage? {
		return UIImage(systemName: "earpods")
	}

	/// airpods
	static var airpods: UIImage? {
		return UIImage(systemName: "airpods")
	}

	/// airpod.right
	static var airpod_right: UIImage? {
		return UIImage(systemName: "airpod.right")
	}

	/// airpod.left
	static var airpod_left: UIImage? {
		return UIImage(systemName: "airpod.left")
	}

	/// airpods.chargingcase
	static var airpods_chargingcase: UIImage? {
		return UIImage(systemName: "airpods.chargingcase")
	}

	/// airpods.chargingcase.fill
	static var airpods_chargingcase_fill: UIImage? {
		return UIImage(systemName: "airpods.chargingcase.fill")
	}

	/// airpods.chargingcase.wireless
	static var airpods_chargingcase_wireless: UIImage? {
		return UIImage(systemName: "airpods.chargingcase.wireless")
	}

	/// airpods.chargingcase.wireless.fill
	static var airpods_chargingcase_wireless_fill: UIImage? {
		return UIImage(systemName: "airpods.chargingcase.wireless.fill")
	}

	/// airpodspro
	static var airpodspro: UIImage? {
		return UIImage(systemName: "airpodspro")
	}

	/// airpodpro.right
	static var airpodpro_right: UIImage? {
		return UIImage(systemName: "airpodpro.right")
	}

	/// airpodpro.left
	static var airpodpro_left: UIImage? {
		return UIImage(systemName: "airpodpro.left")
	}

	/// airpodspro.chargingcase.wireless
	static var airpodspro_chargingcase_wireless: UIImage? {
		return UIImage(systemName: "airpodspro.chargingcase.wireless")
	}

	/// airpodspro.chargingcase.wireless.fill
	static var airpodspro_chargingcase_wireless_fill: UIImage? {
		return UIImage(systemName: "airpodspro.chargingcase.wireless.fill")
	}

	/// beats.earphones
	static var beats_earphones: UIImage? {
		return UIImage(systemName: "beats.earphones")
	}

	/// beats.powerbeatspro
	static var beats_powerbeatspro: UIImage? {
		return UIImage(systemName: "beats.powerbeatspro")
	}

	/// beats.powerbeatspro.right
	static var beats_powerbeatspro_right: UIImage? {
		return UIImage(systemName: "beats.powerbeatspro.right")
	}

	/// beats.powerbeatspro.left
	static var beats_powerbeatspro_left: UIImage? {
		return UIImage(systemName: "beats.powerbeatspro.left")
	}

	/// beats.powerbeats
	static var beats_powerbeats: UIImage? {
		return UIImage(systemName: "beats.powerbeats")
	}

	/// beats.powerbeats3
	static var beats_powerbeats3: UIImage? {
		return UIImage(systemName: "beats.powerbeats3")
	}

	/// beats.powerbeatspro.chargingcase
	static var beats_powerbeatspro_chargingcase: UIImage? {
		return UIImage(systemName: "beats.powerbeatspro.chargingcase")
	}

	/// beats.powerbeatspro.chargingcase.fill
	static var beats_powerbeatspro_chargingcase_fill: UIImage? {
		return UIImage(systemName: "beats.powerbeatspro.chargingcase.fill")
	}

	/// homepodmini
	static var homepodmini: UIImage? {
		return UIImage(systemName: "homepodmini")
	}

	/// homepodmini.fill
	static var homepodmini_fill: UIImage? {
		return UIImage(systemName: "homepodmini.fill")
	}

	/// homepodmini.2
	static var homepodmini_2: UIImage? {
		return UIImage(systemName: "homepodmini.2")
	}

	/// homepodmini.2.fill
	static var homepodmini_2_fill: UIImage? {
		return UIImage(systemName: "homepodmini.2.fill")
	}

	/// homepod.and.homepodmini
	static var homepod_and_homepodmini: UIImage? {
		return UIImage(systemName: "homepod.and.homepodmini")
	}

	/// homepod.and.homepodmini.fill
	static var homepod_and_homepodmini_fill: UIImage? {
		return UIImage(systemName: "homepod.and.homepodmini.fill")
	}

	/// hifispeaker.and.homepodmini
	static var hifispeaker_and_homepodmini: UIImage? {
		return UIImage(systemName: "hifispeaker.and.homepodmini")
	}

	/// hifispeaker.and.homepodmini.fill
	static var hifispeaker_and_homepodmini_fill: UIImage? {
		return UIImage(systemName: "hifispeaker.and.homepodmini.fill")
	}

	/// homepod
	static var homepod: UIImage? {
		return UIImage(systemName: "homepod")
	}

	/// homepod.fill
	static var homepod_fill: UIImage? {
		return UIImage(systemName: "homepod.fill")
	}

	/// homepod.2
	static var homepod_2: UIImage? {
		return UIImage(systemName: "homepod.2")
	}

	/// homepod.2.fill
	static var homepod_2_fill: UIImage? {
		return UIImage(systemName: "homepod.2.fill")
	}

	/// hifispeaker.and.homepod
	static var hifispeaker_and_homepod: UIImage? {
		return UIImage(systemName: "hifispeaker.and.homepod")
	}

	/// hifispeaker.and.homepod.fill
	static var hifispeaker_and_homepod_fill: UIImage? {
		return UIImage(systemName: "hifispeaker.and.homepod.fill")
	}

	/// hifispeaker
	static var hifispeaker: UIImage? {
		return UIImage(systemName: "hifispeaker")
	}

	/// hifispeaker.fill
	static var hifispeaker_fill: UIImage? {
		return UIImage(systemName: "hifispeaker.fill")
	}

	/// hifispeaker.2
	static var hifispeaker_2: UIImage? {
		return UIImage(systemName: "hifispeaker.2")
	}

	/// hifispeaker.2.fill
	static var hifispeaker_2_fill: UIImage? {
		return UIImage(systemName: "hifispeaker.2.fill")
	}

	/// appletv
	static var appletv: UIImage? {
		return UIImage(systemName: "appletv")
	}

	/// appletv.fill
	static var appletv_fill: UIImage? {
		return UIImage(systemName: "appletv.fill")
	}

	/// homepod.and.appletv
	static var homepod_and_appletv: UIImage? {
		return UIImage(systemName: "homepod.and.appletv")
	}

	/// homepod.and.appletv.fill
	static var homepod_and_appletv_fill: UIImage? {
		return UIImage(systemName: "homepod.and.appletv.fill")
	}

	/// homepodmini.and.appletv
	static var homepodmini_and_appletv: UIImage? {
		return UIImage(systemName: "homepodmini.and.appletv")
	}

	/// homepodmini.and.appletv.fill
	static var homepodmini_and_appletv_fill: UIImage? {
		return UIImage(systemName: "homepodmini.and.appletv.fill")
	}

	/// hifispeaker.and.appletv
	static var hifispeaker_and_appletv: UIImage? {
		return UIImage(systemName: "hifispeaker.and.appletv")
	}

	/// hifispeaker.and.appletv.fill
	static var hifispeaker_and_appletv_fill: UIImage? {
		return UIImage(systemName: "hifispeaker.and.appletv.fill")
	}

	/// appletvremote.gen1
	static var appletvremote_gen1: UIImage? {
		return UIImage(systemName: "appletvremote.gen1")
	}

	/// appletvremote.gen1.fill
	static var appletvremote_gen1_fill: UIImage? {
		return UIImage(systemName: "appletvremote.gen1.fill")
	}

	/// appletvremote.gen2
	static var appletvremote_gen2: UIImage? {
		return UIImage(systemName: "appletvremote.gen2")
	}

	/// appletvremote.gen2.fill
	static var appletvremote_gen2_fill: UIImage? {
		return UIImage(systemName: "appletvremote.gen2.fill")
	}

	/// appletvremote.gen3
	static var appletvremote_gen3: UIImage? {
		return UIImage(systemName: "appletvremote.gen3")
	}

	/// appletvremote.gen3.fill
	static var appletvremote_gen3_fill: UIImage? {
		return UIImage(systemName: "appletvremote.gen3.fill")
	}

	/// appletvremote.gen4
	static var appletvremote_gen4: UIImage? {
		return UIImage(systemName: "appletvremote.gen4")
	}

	/// appletvremote.gen4.fill
	static var appletvremote_gen4_fill: UIImage? {
		return UIImage(systemName: "appletvremote.gen4.fill")
	}

	/// mediastick
	static var mediastick: UIImage? {
		return UIImage(systemName: "mediastick")
	}

	/// cable.connector
	static var cable_connector: UIImage? {
		return UIImage(systemName: "cable.connector")
	}

	/// radio
	static var radio: UIImage? {
		return UIImage(systemName: "radio")
	}

	/// radio.fill
	static var radio_fill: UIImage? {
		return UIImage(systemName: "radio.fill")
	}

	/// tv
	static var tv: UIImage? {
		return UIImage(systemName: "tv")
	}

	/// tv.fill
	static var tv_fill: UIImage? {
		return UIImage(systemName: "tv.fill")
	}

	/// tv.inset.filled
	static var tv_inset_filled: UIImage? {
		return UIImage(systemName: "tv.inset.filled")
	}

	/// tv.circle
	static var tv_circle: UIImage? {
		return UIImage(systemName: "tv.circle")
	}

	/// tv.circle.fill
	static var tv_circle_fill: UIImage? {
		return UIImage(systemName: "tv.circle.fill")
	}

	/// 4k.tv
	static var tv_4k: UIImage? {
		return UIImage(systemName: "4k.tv")
	}

	/// 4k.tv.fill
	static var tv_fill_4k: UIImage? {
		return UIImage(systemName: "4k.tv.fill")
	}

	/// music.note.tv
	static var music_note_tv: UIImage? {
		return UIImage(systemName: "music.note.tv")
	}

	/// music.note.tv.fill
	static var music_note_tv_fill: UIImage? {
		return UIImage(systemName: "music.note.tv.fill")
	}

	/// play.tv
	static var play_tv: UIImage? {
		return UIImage(systemName: "play.tv")
	}

	/// play.tv.fill
	static var play_tv_fill: UIImage? {
		return UIImage(systemName: "play.tv.fill")
	}

	/// photo.tv
	static var photo_tv: UIImage? {
		return UIImage(systemName: "photo.tv")
	}

	/// tv.and.hifispeaker.fill
	static var tv_and_hifispeaker_fill: UIImage? {
		return UIImage(systemName: "tv.and.hifispeaker.fill")
	}

	/// tv.and.mediabox
	static var tv_and_mediabox: UIImage? {
		return UIImage(systemName: "tv.and.mediabox")
	}

	/// airplayvideo
	static var airplayvideo: UIImage? {
		return UIImage(systemName: "airplayvideo")
	}

	/// airplayvideo.circle
	static var airplayvideo_circle: UIImage? {
		return UIImage(systemName: "airplayvideo.circle")
	}

	/// airplayvideo.circle.fill
	static var airplayvideo_circle_fill: UIImage? {
		return UIImage(systemName: "airplayvideo.circle.fill")
	}

	/// airplayvideo.badge.exclamationmark
	static var airplayvideo_badge_exclamationmark: UIImage? {
		return UIImage(systemName: "airplayvideo.badge.exclamationmark")
	}

	/// airplayaudio
	static var airplayaudio: UIImage? {
		return UIImage(systemName: "airplayaudio")
	}

	/// airplayaudio.circle
	static var airplayaudio_circle: UIImage? {
		return UIImage(systemName: "airplayaudio.circle")
	}

	/// airplayaudio.circle.fill
	static var airplayaudio_circle_fill: UIImage? {
		return UIImage(systemName: "airplayaudio.circle.fill")
	}

	/// airplayaudio.badge.exclamationmark
	static var airplayaudio_badge_exclamationmark: UIImage? {
		return UIImage(systemName: "airplayaudio.badge.exclamationmark")
	}

	/// dot.radiowaves.left.and.right
	static var dot_radiowaves_left_and_right: UIImage? {
		return UIImage(systemName: "dot.radiowaves.left.and.right")
	}

	/// dot.radiowaves.right
	static var dot_radiowaves_right: UIImage? {
		return UIImage(systemName: "dot.radiowaves.right")
	}

	/// dot.radiowaves.forward
	static var dot_radiowaves_forward: UIImage? {
		return UIImage(systemName: "dot.radiowaves.forward")
	}

	/// wave.3.left
	static var wave_3_left: UIImage? {
		return UIImage(systemName: "wave.3.left")
	}

	/// wave.3.left.circle
	static var wave_3_left_circle: UIImage? {
		return UIImage(systemName: "wave.3.left.circle")
	}

	/// wave.3.left.circle.fill
	static var wave_3_left_circle_fill: UIImage? {
		return UIImage(systemName: "wave.3.left.circle.fill")
	}

	/// wave.3.backward
	static var wave_3_backward: UIImage? {
		return UIImage(systemName: "wave.3.backward")
	}

	/// wave.3.backward.circle
	static var wave_3_backward_circle: UIImage? {
		return UIImage(systemName: "wave.3.backward.circle")
	}

	/// wave.3.backward.circle.fill
	static var wave_3_backward_circle_fill: UIImage? {
		return UIImage(systemName: "wave.3.backward.circle.fill")
	}

	/// wave.3.right
	static var wave_3_right: UIImage? {
		return UIImage(systemName: "wave.3.right")
	}

	/// wave.3.right.circle
	static var wave_3_right_circle: UIImage? {
		return UIImage(systemName: "wave.3.right.circle")
	}

	/// wave.3.right.circle.fill
	static var wave_3_right_circle_fill: UIImage? {
		return UIImage(systemName: "wave.3.right.circle.fill")
	}

	/// wave.3.forward
	static var wave_3_forward: UIImage? {
		return UIImage(systemName: "wave.3.forward")
	}

	/// wave.3.forward.circle
	static var wave_3_forward_circle: UIImage? {
		return UIImage(systemName: "wave.3.forward.circle")
	}

	/// wave.3.forward.circle.fill
	static var wave_3_forward_circle_fill: UIImage? {
		return UIImage(systemName: "wave.3.forward.circle.fill")
	}

	/// dot.radiowaves.up.forward
	static var dot_radiowaves_up_forward: UIImage? {
		return UIImage(systemName: "dot.radiowaves.up.forward")
	}

	/// antenna.radiowaves.left.and.right
	static var antenna_radiowaves_left_and_right: UIImage? {
		return UIImage(systemName: "antenna.radiowaves.left.and.right")
	}

	/// antenna.radiowaves.left.and.right.circle
	static var antenna_radiowaves_left_and_right_circle: UIImage? {
		return UIImage(systemName: "antenna.radiowaves.left.and.right.circle")
	}

	/// antenna.radiowaves.left.and.right.circle.fill
	static var antenna_radiowaves_left_and_right_circle_fill: UIImage? {
		return UIImage(systemName: "antenna.radiowaves.left.and.right.circle.fill")
	}

	/// pip
	static var pip: UIImage? {
		return UIImage(systemName: "pip")
	}

	/// pip.fill
	static var pip_fill: UIImage? {
		return UIImage(systemName: "pip.fill")
	}

	/// pip.exit
	static var pip_exit: UIImage? {
		return UIImage(systemName: "pip.exit")
	}

	/// pip.enter
	static var pip_enter: UIImage? {
		return UIImage(systemName: "pip.enter")
	}

	/// pip.swap
	static var pip_swap: UIImage? {
		return UIImage(systemName: "pip.swap")
	}

	/// pip.remove
	static var pip_remove: UIImage? {
		return UIImage(systemName: "pip.remove")
	}

	/// rectangle.arrowtriangle.2.outward
	static var rectangle_arrowtriangle_2_outward: UIImage? {
		return UIImage(systemName: "rectangle.arrowtriangle.2.outward")
	}

	/// rectangle.arrowtriangle.2.inward
	static var rectangle_arrowtriangle_2_inward: UIImage? {
		return UIImage(systemName: "rectangle.arrowtriangle.2.inward")
	}

	/// rectangle.portrait.arrowtriangle.2.outward
	static var rectangle_portrait_arrowtriangle_2_outward: UIImage? {
		return UIImage(systemName: "rectangle.portrait.arrowtriangle.2.outward")
	}

	/// rectangle.portrait.arrowtriangle.2.inward
	static var rectangle_portrait_arrowtriangle_2_inward: UIImage? {
		return UIImage(systemName: "rectangle.portrait.arrowtriangle.2.inward")
	}

	/// rectangle.2.swap
	static var rectangle_2_swap: UIImage? {
		return UIImage(systemName: "rectangle.2.swap")
	}

	/// guitars
	static var guitars: UIImage? {
		return UIImage(systemName: "guitars")
	}

	/// guitars.fill
	static var guitars_fill: UIImage? {
		return UIImage(systemName: "guitars.fill")
	}

	/// airplane
	static var airplane: UIImage? {
		return UIImage(systemName: "airplane")
	}

	/// airplane.circle
	static var airplane_circle: UIImage? {
		return UIImage(systemName: "airplane.circle")
	}

	/// airplane.circle.fill
	static var airplane_circle_fill: UIImage? {
		return UIImage(systemName: "airplane.circle.fill")
	}

	/// airplane.arrival
	static var airplane_arrival: UIImage? {
		return UIImage(systemName: "airplane.arrival")
	}

	/// airplane.departure
	static var airplane_departure: UIImage? {
		return UIImage(systemName: "airplane.departure")
	}

	/// car
	static var car: UIImage? {
		return UIImage(systemName: "car")
	}

	/// car.fill
	static var car_fill: UIImage? {
		return UIImage(systemName: "car.fill")
	}

	/// car.circle
	static var car_circle: UIImage? {
		return UIImage(systemName: "car.circle")
	}

	/// car.circle.fill
	static var car_circle_fill: UIImage? {
		return UIImage(systemName: "car.circle.fill")
	}

	/// bolt.car
	static var bolt_car: UIImage? {
		return UIImage(systemName: "bolt.car")
	}

	/// bolt.car.fill
	static var bolt_car_fill: UIImage? {
		return UIImage(systemName: "bolt.car.fill")
	}

	/// bolt.car.circle
	static var bolt_car_circle: UIImage? {
		return UIImage(systemName: "bolt.car.circle")
	}

	/// bolt.car.circle.fill
	static var bolt_car_circle_fill: UIImage? {
		return UIImage(systemName: "bolt.car.circle.fill")
	}

	/// car.2
	static var car_2: UIImage? {
		return UIImage(systemName: "car.2")
	}

	/// car.2.fill
	static var car_2_fill: UIImage? {
		return UIImage(systemName: "car.2.fill")
	}

	/// bus
	static var bus: UIImage? {
		return UIImage(systemName: "bus")
	}

	/// bus.fill
	static var bus_fill: UIImage? {
		return UIImage(systemName: "bus.fill")
	}

	/// bus.doubledecker
	static var bus_doubledecker: UIImage? {
		return UIImage(systemName: "bus.doubledecker")
	}

	/// bus.doubledecker.fill
	static var bus_doubledecker_fill: UIImage? {
		return UIImage(systemName: "bus.doubledecker.fill")
	}

	/// tram
	static var tram: UIImage? {
		return UIImage(systemName: "tram")
	}

	/// tram.fill
	static var tram_fill: UIImage? {
		return UIImage(systemName: "tram.fill")
	}

	/// tram.circle
	static var tram_circle: UIImage? {
		return UIImage(systemName: "tram.circle")
	}

	/// tram.circle.fill
	static var tram_circle_fill: UIImage? {
		return UIImage(systemName: "tram.circle.fill")
	}

	/// tram.fill.tunnel
	static var tram_fill_tunnel: UIImage? {
		return UIImage(systemName: "tram.fill.tunnel")
	}

	/// cablecar
	static var cablecar: UIImage? {
		return UIImage(systemName: "cablecar")
	}

	/// cablecar.fill
	static var cablecar_fill: UIImage? {
		return UIImage(systemName: "cablecar.fill")
	}

	/// ferry
	static var ferry: UIImage? {
		return UIImage(systemName: "ferry")
	}

	/// ferry.fill
	static var ferry_fill: UIImage? {
		return UIImage(systemName: "ferry.fill")
	}

	/// car.ferry
	static var car_ferry: UIImage? {
		return UIImage(systemName: "car.ferry")
	}

	/// car.ferry.fill
	static var car_ferry_fill: UIImage? {
		return UIImage(systemName: "car.ferry.fill")
	}

	/// train.side.front.car
	static var train_side_front_car: UIImage? {
		return UIImage(systemName: "train.side.front.car")
	}

	/// train.side.middle.car
	static var train_side_middle_car: UIImage? {
		return UIImage(systemName: "train.side.middle.car")
	}

	/// train.side.rear.car
	static var train_side_rear_car: UIImage? {
		return UIImage(systemName: "train.side.rear.car")
	}

	/// bicycle
	static var bicycle: UIImage? {
		return UIImage(systemName: "bicycle")
	}

	/// bicycle.circle
	static var bicycle_circle: UIImage? {
		return UIImage(systemName: "bicycle.circle")
	}

	/// bicycle.circle.fill
	static var bicycle_circle_fill: UIImage? {
		return UIImage(systemName: "bicycle.circle.fill")
	}

	/// parkingsign
	static var parkingsign: UIImage? {
		return UIImage(systemName: "parkingsign")
	}

	/// parkingsign.circle
	static var parkingsign_circle: UIImage? {
		return UIImage(systemName: "parkingsign.circle")
	}

	/// parkingsign.circle.fill
	static var parkingsign_circle_fill: UIImage? {
		return UIImage(systemName: "parkingsign.circle.fill")
	}

	/// fuelpump
	static var fuelpump: UIImage? {
		return UIImage(systemName: "fuelpump")
	}

	/// fuelpump.fill
	static var fuelpump_fill: UIImage? {
		return UIImage(systemName: "fuelpump.fill")
	}

	/// fuelpump.circle
	static var fuelpump_circle: UIImage? {
		return UIImage(systemName: "fuelpump.circle")
	}

	/// fuelpump.circle.fill
	static var fuelpump_circle_fill: UIImage? {
		return UIImage(systemName: "fuelpump.circle.fill")
	}

	/// fanblades
	static var fanblades: UIImage? {
		return UIImage(systemName: "fanblades")
	}

	/// fanblades.fill
	static var fanblades_fill: UIImage? {
		return UIImage(systemName: "fanblades.fill")
	}

	/// bed.double
	static var bed_double: UIImage? {
		return UIImage(systemName: "bed.double")
	}

	/// bed.double.fill
	static var bed_double_fill: UIImage? {
		return UIImage(systemName: "bed.double.fill")
	}

	/// bed.double.circle
	static var bed_double_circle: UIImage? {
		return UIImage(systemName: "bed.double.circle")
	}

	/// bed.double.circle.fill
	static var bed_double_circle_fill: UIImage? {
		return UIImage(systemName: "bed.double.circle.fill")
	}

	/// lungs
	static var lungs: UIImage? {
		return UIImage(systemName: "lungs")
	}

	/// lungs.fill
	static var lungs_fill: UIImage? {
		return UIImage(systemName: "lungs.fill")
	}

	/// allergens
	static var allergens: UIImage? {
		return UIImage(systemName: "allergens")
	}

	/// pills
	static var pills: UIImage? {
		return UIImage(systemName: "pills")
	}

	/// pills.fill
	static var pills_fill: UIImage? {
		return UIImage(systemName: "pills.fill")
	}

	/// testtube.2
	static var testtube_2: UIImage? {
		return UIImage(systemName: "testtube.2")
	}

	/// ivfluid.bag
	static var ivfluid_bag: UIImage? {
		return UIImage(systemName: "ivfluid.bag")
	}

	/// ivfluid.bag.fill
	static var ivfluid_bag_fill: UIImage? {
		return UIImage(systemName: "ivfluid.bag.fill")
	}

	/// cross.vial
	static var cross_vial: UIImage? {
		return UIImage(systemName: "cross.vial")
	}

	/// cross.vial.fill
	static var cross_vial_fill: UIImage? {
		return UIImage(systemName: "cross.vial.fill")
	}

	/// cross
	static var cross: UIImage? {
		return UIImage(systemName: "cross")
	}

	/// cross.fill
	static var cross_fill: UIImage? {
		return UIImage(systemName: "cross.fill")
	}

	/// cross.circle
	static var cross_circle: UIImage? {
		return UIImage(systemName: "cross.circle")
	}

	/// cross.circle.fill
	static var cross_circle_fill: UIImage? {
		return UIImage(systemName: "cross.circle.fill")
	}

	/// hare
	static var hare: UIImage? {
		return UIImage(systemName: "hare")
	}

	/// hare.fill
	static var hare_fill: UIImage? {
		return UIImage(systemName: "hare.fill")
	}

	/// tortoise
	static var tortoise: UIImage? {
		return UIImage(systemName: "tortoise")
	}

	/// tortoise.fill
	static var tortoise_fill: UIImage? {
		return UIImage(systemName: "tortoise.fill")
	}

	/// pawprint
	static var pawprint: UIImage? {
		return UIImage(systemName: "pawprint")
	}

	/// pawprint.fill
	static var pawprint_fill: UIImage? {
		return UIImage(systemName: "pawprint.fill")
	}

	/// pawprint.circle
	static var pawprint_circle: UIImage? {
		return UIImage(systemName: "pawprint.circle")
	}

	/// pawprint.circle.fill
	static var pawprint_circle_fill: UIImage? {
		return UIImage(systemName: "pawprint.circle.fill")
	}

	/// ant
	static var ant: UIImage? {
		return UIImage(systemName: "ant")
	}

	/// ant.fill
	static var ant_fill: UIImage? {
		return UIImage(systemName: "ant.fill")
	}

	/// ant.circle
	static var ant_circle: UIImage? {
		return UIImage(systemName: "ant.circle")
	}

	/// ant.circle.fill
	static var ant_circle_fill: UIImage? {
		return UIImage(systemName: "ant.circle.fill")
	}

	/// ladybug
	static var ladybug: UIImage? {
		return UIImage(systemName: "ladybug")
	}

	/// ladybug.fill
	static var ladybug_fill: UIImage? {
		return UIImage(systemName: "ladybug.fill")
	}

	/// leaf
	static var leaf: UIImage? {
		return UIImage(systemName: "leaf")
	}

	/// leaf.fill
	static var leaf_fill: UIImage? {
		return UIImage(systemName: "leaf.fill")
	}

	/// leaf.circle
	static var leaf_circle: UIImage? {
		return UIImage(systemName: "leaf.circle")
	}

	/// leaf.circle.fill
	static var leaf_circle_fill: UIImage? {
		return UIImage(systemName: "leaf.circle.fill")
	}

	/// leaf.arrow.triangle.circlepath
	static var leaf_arrow_triangle_circlepath: UIImage? {
		return UIImage(systemName: "leaf.arrow.triangle.circlepath")
	}

	/// film
	static var film: UIImage? {
		return UIImage(systemName: "film")
	}

	/// film.fill
	static var film_fill: UIImage? {
		return UIImage(systemName: "film.fill")
	}

	/// film.circle
	static var film_circle: UIImage? {
		return UIImage(systemName: "film.circle")
	}

	/// film.circle.fill
	static var film_circle_fill: UIImage? {
		return UIImage(systemName: "film.circle.fill")
	}

	/// sportscourt
	static var sportscourt: UIImage? {
		return UIImage(systemName: "sportscourt")
	}

	/// sportscourt.fill
	static var sportscourt_fill: UIImage? {
		return UIImage(systemName: "sportscourt.fill")
	}

	/// face.smiling
	static var face_smiling: UIImage? {
		return UIImage(systemName: "face.smiling")
	}

	/// face.smiling.fill
	static var face_smiling_fill: UIImage? {
		return UIImage(systemName: "face.smiling.fill")
	}

	/// face.dashed
	static var face_dashed: UIImage? {
		return UIImage(systemName: "face.dashed")
	}

	/// face.dashed.fill
	static var face_dashed_fill: UIImage? {
		return UIImage(systemName: "face.dashed.fill")
	}

	/// crown
	static var crown: UIImage? {
		return UIImage(systemName: "crown")
	}

	/// crown.fill
	static var crown_fill: UIImage? {
		return UIImage(systemName: "crown.fill")
	}

	/// comb
	static var comb: UIImage? {
		return UIImage(systemName: "comb")
	}

	/// comb.fill
	static var comb_fill: UIImage? {
		return UIImage(systemName: "comb.fill")
	}

	/// qrcode
	static var qrcode: UIImage? {
		return UIImage(systemName: "qrcode")
	}

	/// barcode
	static var barcode: UIImage? {
		return UIImage(systemName: "barcode")
	}

	/// viewfinder
	static var viewfinder: UIImage? {
		return UIImage(systemName: "viewfinder")
	}

	/// viewfinder.circle
	static var viewfinder_circle: UIImage? {
		return UIImage(systemName: "viewfinder.circle")
	}

	/// viewfinder.circle.fill
	static var viewfinder_circle_fill: UIImage? {
		return UIImage(systemName: "viewfinder.circle.fill")
	}

	/// barcode.viewfinder
	static var barcode_viewfinder: UIImage? {
		return UIImage(systemName: "barcode.viewfinder")
	}

	/// qrcode.viewfinder
	static var qrcode_viewfinder: UIImage? {
		return UIImage(systemName: "qrcode.viewfinder")
	}

	/// plus.viewfinder
	static var plus_viewfinder: UIImage? {
		return UIImage(systemName: "plus.viewfinder")
	}

	/// camera.viewfinder
	static var camera_viewfinder: UIImage? {
		return UIImage(systemName: "camera.viewfinder")
	}

	/// faceid
	static var faceid: UIImage? {
		return UIImage(systemName: "faceid")
	}

	/// doc.text.viewfinder
	static var doc_text_viewfinder: UIImage? {
		return UIImage(systemName: "doc.text.viewfinder")
	}

	/// doc.text.fill.viewfinder
	static var doc_text_fill_viewfinder: UIImage? {
		return UIImage(systemName: "doc.text.fill.viewfinder")
	}

	/// location.viewfinder
	static var location_viewfinder: UIImage? {
		return UIImage(systemName: "location.viewfinder")
	}

	/// location.fill.viewfinder
	static var location_fill_viewfinder: UIImage? {
		return UIImage(systemName: "location.fill.viewfinder")
	}

	/// person.fill.viewfinder
	static var person_fill_viewfinder: UIImage? {
		return UIImage(systemName: "person.fill.viewfinder")
	}

	/// text.viewfinder
	static var text_viewfinder: UIImage? {
		return UIImage(systemName: "text.viewfinder")
	}

	/// photo
	static var photo: UIImage? {
		return UIImage(systemName: "photo")
	}

	/// photo.fill
	static var photo_fill: UIImage? {
		return UIImage(systemName: "photo.fill")
	}

	/// photo.circle
	static var photo_circle: UIImage? {
		return UIImage(systemName: "photo.circle")
	}

	/// photo.circle.fill
	static var photo_circle_fill: UIImage? {
		return UIImage(systemName: "photo.circle.fill")
	}

	/// text.below.photo
	static var text_below_photo: UIImage? {
		return UIImage(systemName: "text.below.photo")
	}

	/// text.below.photo.fill
	static var text_below_photo_fill: UIImage? {
		return UIImage(systemName: "text.below.photo.fill")
	}

	/// checkerboard.rectangle
	static var checkerboard_rectangle: UIImage? {
		return UIImage(systemName: "checkerboard.rectangle")
	}

	/// camera.metering.center.weighted.average
	static var camera_metering_center_weighted_average: UIImage? {
		return UIImage(systemName: "camera.metering.center.weighted.average")
	}

	/// camera.metering.center.weighted
	static var camera_metering_center_weighted: UIImage? {
		return UIImage(systemName: "camera.metering.center.weighted")
	}

	/// camera.metering.matrix
	static var camera_metering_matrix: UIImage? {
		return UIImage(systemName: "camera.metering.matrix")
	}

	/// camera.metering.multispot
	static var camera_metering_multispot: UIImage? {
		return UIImage(systemName: "camera.metering.multispot")
	}

	/// camera.metering.none
	static var camera_metering_none: UIImage? {
		return UIImage(systemName: "camera.metering.none")
	}

	/// camera.metering.partial
	static var camera_metering_partial: UIImage? {
		return UIImage(systemName: "camera.metering.partial")
	}

	/// camera.metering.spot
	static var camera_metering_spot: UIImage? {
		return UIImage(systemName: "camera.metering.spot")
	}

	/// camera.metering.unknown
	static var camera_metering_unknown: UIImage? {
		return UIImage(systemName: "camera.metering.unknown")
	}

	/// camera.aperture
	static var camera_aperture: UIImage? {
		return UIImage(systemName: "camera.aperture")
	}

	/// rectangle.dashed
	static var rectangle_dashed: UIImage? {
		return UIImage(systemName: "rectangle.dashed")
	}

	/// rectangle.dashed.badge.record
	static var rectangle_dashed_badge_record: UIImage? {
		return UIImage(systemName: "rectangle.dashed.badge.record")
	}

	/// rectangle.badge.plus
	static var rectangle_badge_plus: UIImage? {
		return UIImage(systemName: "rectangle.badge.plus")
	}

	/// rectangle.fill.badge.plus
	static var rectangle_fill_badge_plus: UIImage? {
		return UIImage(systemName: "rectangle.fill.badge.plus")
	}

	/// rectangle.badge.minus
	static var rectangle_badge_minus: UIImage? {
		return UIImage(systemName: "rectangle.badge.minus")
	}

	/// rectangle.fill.badge.minus
	static var rectangle_fill_badge_minus: UIImage? {
		return UIImage(systemName: "rectangle.fill.badge.minus")
	}

	/// rectangle.badge.checkmark
	static var rectangle_badge_checkmark: UIImage? {
		return UIImage(systemName: "rectangle.badge.checkmark")
	}

	/// rectangle.fill.badge.checkmark
	static var rectangle_fill_badge_checkmark: UIImage? {
		return UIImage(systemName: "rectangle.fill.badge.checkmark")
	}

	/// rectangle.badge.xmark
	static var rectangle_badge_xmark: UIImage? {
		return UIImage(systemName: "rectangle.badge.xmark")
	}

	/// rectangle.fill.badge.xmark
	static var rectangle_fill_badge_xmark: UIImage? {
		return UIImage(systemName: "rectangle.fill.badge.xmark")
	}

	/// rectangle.badge.person.crop
	static var rectangle_badge_person_crop: UIImage? {
		return UIImage(systemName: "rectangle.badge.person.crop")
	}

	/// rectangle.fill.badge.person.crop
	static var rectangle_fill_badge_person_crop: UIImage? {
		return UIImage(systemName: "rectangle.fill.badge.person.crop")
	}

	/// photo.on.rectangle
	static var photo_on_rectangle: UIImage? {
		return UIImage(systemName: "photo.on.rectangle")
	}

	/// photo.fill.on.rectangle.fill
	static var photo_fill_on_rectangle_fill: UIImage? {
		return UIImage(systemName: "photo.fill.on.rectangle.fill")
	}

	/// rectangle.on.rectangle.angled
	static var rectangle_on_rectangle_angled: UIImage? {
		return UIImage(systemName: "rectangle.on.rectangle.angled")
	}

	/// rectangle.fill.on.rectangle.angled.fill
	static var rectangle_fill_on_rectangle_angled_fill: UIImage? {
		return UIImage(systemName: "rectangle.fill.on.rectangle.angled.fill")
	}

	/// photo.on.rectangle.angled
	static var photo_on_rectangle_angled: UIImage? {
		return UIImage(systemName: "photo.on.rectangle.angled")
	}

	/// rectangle.stack
	static var rectangle_stack: UIImage? {
		return UIImage(systemName: "rectangle.stack")
	}

	/// rectangle.stack.fill
	static var rectangle_stack_fill: UIImage? {
		return UIImage(systemName: "rectangle.stack.fill")
	}

	/// rectangle.stack.badge.plus
	static var rectangle_stack_badge_plus: UIImage? {
		return UIImage(systemName: "rectangle.stack.badge.plus")
	}

	/// rectangle.stack.fill.badge.plus
	static var rectangle_stack_fill_badge_plus: UIImage? {
		return UIImage(systemName: "rectangle.stack.fill.badge.plus")
	}

	/// rectangle.stack.badge.minus
	static var rectangle_stack_badge_minus: UIImage? {
		return UIImage(systemName: "rectangle.stack.badge.minus")
	}

	/// rectangle.stack.fill.badge.minus
	static var rectangle_stack_fill_badge_minus: UIImage? {
		return UIImage(systemName: "rectangle.stack.fill.badge.minus")
	}

	/// rectangle.stack.badge.person.crop
	static var rectangle_stack_badge_person_crop: UIImage? {
		return UIImage(systemName: "rectangle.stack.badge.person.crop")
	}

	/// rectangle.stack.fill.badge.person.crop
	static var rectangle_stack_fill_badge_person_crop: UIImage? {
		return UIImage(systemName: "rectangle.stack.fill.badge.person.crop")
	}

	/// rectangle.stack.badge.play.crop
	static var rectangle_stack_badge_play_crop: UIImage? {
		return UIImage(systemName: "rectangle.stack.badge.play.crop")
	}

	/// rectangle.stack.fill.badge.play.crop.fill
	static var rectangle_stack_fill_badge_play_crop_fill: UIImage? {
		return UIImage(systemName: "rectangle.stack.fill.badge.play.crop.fill")
	}

	/// sparkles.rectangle.stack
	static var sparkles_rectangle_stack: UIImage? {
		return UIImage(systemName: "sparkles.rectangle.stack")
	}

	/// sparkles.rectangle.stack.fill
	static var sparkles_rectangle_stack_fill: UIImage? {
		return UIImage(systemName: "sparkles.rectangle.stack.fill")
	}

	/// sidebar.left
	static var sidebar_left: UIImage? {
		return UIImage(systemName: "sidebar.left")
	}

	/// sidebar.right
	static var sidebar_right: UIImage? {
		return UIImage(systemName: "sidebar.right")
	}

	/// sidebar.leading
	static var sidebar_leading: UIImage? {
		return UIImage(systemName: "sidebar.leading")
	}

	/// sidebar.trailing
	static var sidebar_trailing: UIImage? {
		return UIImage(systemName: "sidebar.trailing")
	}

	/// sidebar.squares.left
	static var sidebar_squares_left: UIImage? {
		return UIImage(systemName: "sidebar.squares.left")
	}

	/// sidebar.squares.right
	static var sidebar_squares_right: UIImage? {
		return UIImage(systemName: "sidebar.squares.right")
	}

	/// sidebar.squares.leading
	static var sidebar_squares_leading: UIImage? {
		return UIImage(systemName: "sidebar.squares.leading")
	}

	/// sidebar.squares.trailing
	static var sidebar_squares_trailing: UIImage? {
		return UIImage(systemName: "sidebar.squares.trailing")
	}

	/// macwindow
	static var macwindow: UIImage? {
		return UIImage(systemName: "macwindow")
	}

	/// macwindow.badge.plus
	static var macwindow_badge_plus: UIImage? {
		return UIImage(systemName: "macwindow.badge.plus")
	}

	/// dock.rectangle
	static var dock_rectangle: UIImage? {
		return UIImage(systemName: "dock.rectangle")
	}

	/// dock.arrow.up.rectangle
	static var dock_arrow_up_rectangle: UIImage? {
		return UIImage(systemName: "dock.arrow.up.rectangle")
	}

	/// dock.arrow.down.rectangle
	static var dock_arrow_down_rectangle: UIImage? {
		return UIImage(systemName: "dock.arrow.down.rectangle")
	}

	/// menubar.rectangle
	static var menubar_rectangle: UIImage? {
		return UIImage(systemName: "menubar.rectangle")
	}

	/// menubar.dock.rectangle
	static var menubar_dock_rectangle: UIImage? {
		return UIImage(systemName: "menubar.dock.rectangle")
	}

	/// menubar.dock.rectangle.badge.record
	static var menubar_dock_rectangle_badge_record: UIImage? {
		return UIImage(systemName: "menubar.dock.rectangle.badge.record")
	}

	/// menubar.arrow.up.rectangle
	static var menubar_arrow_up_rectangle: UIImage? {
		return UIImage(systemName: "menubar.arrow.up.rectangle")
	}

	/// menubar.arrow.down.rectangle
	static var menubar_arrow_down_rectangle: UIImage? {
		return UIImage(systemName: "menubar.arrow.down.rectangle")
	}

	/// macwindow.on.rectangle
	static var macwindow_on_rectangle: UIImage? {
		return UIImage(systemName: "macwindow.on.rectangle")
	}

	/// text.and.command.macwindow
	static var text_and_command_macwindow: UIImage? {
		return UIImage(systemName: "text.and.command.macwindow")
	}

	/// keyboard.macwindow
	static var keyboard_macwindow: UIImage? {
		return UIImage(systemName: "keyboard.macwindow")
	}

	/// uiwindow.split.2x1
	static var uiwindow_split_2x1: UIImage? {
		return UIImage(systemName: "uiwindow.split.2x1")
	}

	/// mosaic
	static var mosaic: UIImage? {
		return UIImage(systemName: "mosaic")
	}

	/// mosaic.fill
	static var mosaic_fill: UIImage? {
		return UIImage(systemName: "mosaic.fill")
	}

	/// squares.below.rectangle
	static var squares_below_rectangle: UIImage? {
		return UIImage(systemName: "squares.below.rectangle")
	}

	/// rectangle.split.3x3.fill
	static var rectangle_split_3x3_fill: UIImage? {
		return UIImage(systemName: "rectangle.split.3x3.fill")
	}

	/// square.on.square.squareshape.controlhandles
	static var square_on_square_squareshape_controlhandles: UIImage? {
		return UIImage(systemName: "square.on.square.squareshape.controlhandles")
	}

	/// squareshape.controlhandles.on.squareshape.controlhandles
	static var squareshape_controlhandles_on_squareshape_controlhandles: UIImage? {
		return UIImage(systemName: "squareshape.controlhandles.on.squareshape.controlhandles")
	}

	/// pano
	static var pano: UIImage? {
		return UIImage(systemName: "pano")
	}

	/// pano.fill
	static var pano_fill: UIImage? {
		return UIImage(systemName: "pano.fill")
	}

	/// circle.grid.2x1
	static var circle_grid_2x1: UIImage? {
		return UIImage(systemName: "circle.grid.2x1")
	}

	/// circle.grid.2x1.fill
	static var circle_grid_2x1_fill: UIImage? {
		return UIImage(systemName: "circle.grid.2x1.fill")
	}

	/// circle.grid.2x1.left.filled
	static var circle_grid_2x1_left_filled: UIImage? {
		return UIImage(systemName: "circle.grid.2x1.left.filled")
	}

	/// circle.grid.2x1.right.filled
	static var circle_grid_2x1_right_filled: UIImage? {
		return UIImage(systemName: "circle.grid.2x1.right.filled")
	}

	/// square.and.line.vertical.and.square
	static var square_and_line_vertical_and_square: UIImage? {
		return UIImage(systemName: "square.and.line.vertical.and.square")
	}

	/// square.fill.and.line.vertical.and.square.fill
	static var square_fill_and_line_vertical_and_square_fill: UIImage? {
		return UIImage(systemName: "square.fill.and.line.vertical.and.square.fill")
	}

	/// square.fill.and.line.vertical.and.square
	static var square_fill_and_line_vertical_and_square: UIImage? {
		return UIImage(systemName: "square.fill.and.line.vertical.and.square")
	}

	/// square.and.line.vertical.and.square.fill
	static var square_and_line_vertical_and_square_fill: UIImage? {
		return UIImage(systemName: "square.and.line.vertical.and.square.fill")
	}

	/// flowchart
	static var flowchart: UIImage? {
		return UIImage(systemName: "flowchart")
	}

	/// flowchart.fill
	static var flowchart_fill: UIImage? {
		return UIImage(systemName: "flowchart.fill")
	}

	/// rectangle.connected.to.line.below
	static var rectangle_connected_to_line_below: UIImage? {
		return UIImage(systemName: "rectangle.connected.to.line.below")
	}

	/// shield
	static var shield: UIImage? {
		return UIImage(systemName: "shield")
	}

	/// shield.fill
	static var shield_fill: UIImage? {
		return UIImage(systemName: "shield.fill")
	}

	/// shield.lefthalf.filled
	static var shield_lefthalf_filled: UIImage? {
		return UIImage(systemName: "shield.lefthalf.filled")
	}

	/// shield.righthalf.filled
	static var shield_righthalf_filled: UIImage? {
		return UIImage(systemName: "shield.righthalf.filled")
	}

	/// shield.slash
	static var shield_slash: UIImage? {
		return UIImage(systemName: "shield.slash")
	}

	/// shield.slash.fill
	static var shield_slash_fill: UIImage? {
		return UIImage(systemName: "shield.slash.fill")
	}

	/// shield.lefthalf.filled.slash
	static var shield_lefthalf_filled_slash: UIImage? {
		return UIImage(systemName: "shield.lefthalf.filled.slash")
	}

	/// checkerboard.shield
	static var checkerboard_shield: UIImage? {
		return UIImage(systemName: "checkerboard.shield")
	}

	/// switch.2
	static var switch_2: UIImage? {
		return UIImage(systemName: "switch.2")
	}

	/// point.topleft.down.curvedto.point.bottomright.up
	static var point_topleft_down_curvedto_point_bottomright_up: UIImage? {
		return UIImage(systemName: "point.topleft.down.curvedto.point.bottomright.up")
	}

	/// point.topleft.down.curvedto.point.bottomright.up.fill
	static var point_topleft_down_curvedto_point_bottomright_up_fill: UIImage? {
		return UIImage(systemName: "point.topleft.down.curvedto.point.bottomright.up.fill")
	}

	/// point.topleft.down.curvedto.point.filled.bottomright.up
	static var point_topleft_down_curvedto_point_filled_bottomright_up: UIImage? {
		return UIImage(systemName: "point.topleft.down.curvedto.point.filled.bottomright.up")
	}

	/// point.filled.topleft.down.curvedto.point.bottomright.up
	static var point_filled_topleft_down_curvedto_point_bottomright_up: UIImage? {
		return UIImage(systemName: "point.filled.topleft.down.curvedto.point.bottomright.up")
	}

	/// app.connected.to.app.below.fill
	static var app_connected_to_app_below_fill: UIImage? {
		return UIImage(systemName: "app.connected.to.app.below.fill")
	}

	/// slider.horizontal.3
	static var slider_horizontal_3: UIImage? {
		return UIImage(systemName: "slider.horizontal.3")
	}

	/// slider.horizontal.below.rectangle
	static var slider_horizontal_below_rectangle: UIImage? {
		return UIImage(systemName: "slider.horizontal.below.rectangle")
	}

	/// slider.horizontal.below.square.fill.and.square
	static var slider_horizontal_below_square_fill_and_square: UIImage? {
		return UIImage(systemName: "slider.horizontal.below.square.fill.and.square")
	}

	/// slider.vertical.3
	static var slider_vertical_3: UIImage? {
		return UIImage(systemName: "slider.vertical.3")
	}

	/// cube
	static var cube: UIImage? {
		return UIImage(systemName: "cube")
	}

	/// cube.fill
	static var cube_fill: UIImage? {
		return UIImage(systemName: "cube.fill")
	}

	/// cube.transparent
	static var cube_transparent: UIImage? {
		return UIImage(systemName: "cube.transparent")
	}

	/// cube.transparent.fill
	static var cube_transparent_fill: UIImage? {
		return UIImage(systemName: "cube.transparent.fill")
	}

	/// shippingbox
	static var shippingbox: UIImage? {
		return UIImage(systemName: "shippingbox")
	}

	/// shippingbox.fill
	static var shippingbox_fill: UIImage? {
		return UIImage(systemName: "shippingbox.fill")
	}

	/// arkit
	static var arkit: UIImage? {
		return UIImage(systemName: "arkit")
	}

	/// arkit.badge.xmark
	static var arkit_badge_xmark: UIImage? {
		return UIImage(systemName: "arkit.badge.xmark")
	}

	/// cone
	static var cone: UIImage? {
		return UIImage(systemName: "cone")
	}

	/// cone.fill
	static var cone_fill: UIImage? {
		return UIImage(systemName: "cone.fill")
	}

	/// pyramid
	static var pyramid: UIImage? {
		return UIImage(systemName: "pyramid")
	}

	/// pyramid.fill
	static var pyramid_fill: UIImage? {
		return UIImage(systemName: "pyramid.fill")
	}

	/// square.stack.3d.down.right
	static var square_stack_3d_down_right: UIImage? {
		return UIImage(systemName: "square.stack.3d.down.right")
	}

	/// square.stack.3d.down.right.fill
	static var square_stack_3d_down_right_fill: UIImage? {
		return UIImage(systemName: "square.stack.3d.down.right.fill")
	}

	/// square.stack.3d.down.forward
	static var square_stack_3d_down_forward: UIImage? {
		return UIImage(systemName: "square.stack.3d.down.forward")
	}

	/// square.stack.3d.down.forward.fill
	static var square_stack_3d_down_forward_fill: UIImage? {
		return UIImage(systemName: "square.stack.3d.down.forward.fill")
	}

	/// square.stack.3d.up
	static var square_stack_3d_up: UIImage? {
		return UIImage(systemName: "square.stack.3d.up")
	}

	/// square.stack.3d.up.fill
	static var square_stack_3d_up_fill: UIImage? {
		return UIImage(systemName: "square.stack.3d.up.fill")
	}

	/// square.stack.3d.up.slash
	static var square_stack_3d_up_slash: UIImage? {
		return UIImage(systemName: "square.stack.3d.up.slash")
	}

	/// square.stack.3d.up.slash.fill
	static var square_stack_3d_up_slash_fill: UIImage? {
		return UIImage(systemName: "square.stack.3d.up.slash.fill")
	}

	/// square.stack.3d.up.badge.a
	static var square_stack_3d_up_badge_a: UIImage? {
		return UIImage(systemName: "square.stack.3d.up.badge.a")
	}

	/// square.stack.3d.up.badge.a.fill
	static var square_stack_3d_up_badge_a_fill: UIImage? {
		return UIImage(systemName: "square.stack.3d.up.badge.a.fill")
	}

	/// square.stack.3d.forward.dottedline
	static var square_stack_3d_forward_dottedline: UIImage? {
		return UIImage(systemName: "square.stack.3d.forward.dottedline")
	}

	/// square.stack.3d.forward.dottedline.fill
	static var square_stack_3d_forward_dottedline_fill: UIImage? {
		return UIImage(systemName: "square.stack.3d.forward.dottedline.fill")
	}

	/// livephoto
	static var livephoto: UIImage? {
		return UIImage(systemName: "livephoto")
	}

	/// livephoto.slash
	static var livephoto_slash: UIImage? {
		return UIImage(systemName: "livephoto.slash")
	}

	/// livephoto.badge.a
	static var livephoto_badge_a: UIImage? {
		return UIImage(systemName: "livephoto.badge.a")
	}

	/// livephoto.play
	static var livephoto_play: UIImage? {
		return UIImage(systemName: "livephoto.play")
	}

	/// scope
	static var scope: UIImage? {
		return UIImage(systemName: "scope")
	}

	/// helm
	static var helm: UIImage? {
		return UIImage(systemName: "helm")
	}

	/// clock
	static var clock: UIImage? {
		return UIImage(systemName: "clock")
	}

	/// clock.fill
	static var clock_fill: UIImage? {
		return UIImage(systemName: "clock.fill")
	}

	/// clock.badge.checkmark
	static var clock_badge_checkmark: UIImage? {
		return UIImage(systemName: "clock.badge.checkmark")
	}

	/// clock.badge.checkmark.fill
	static var clock_badge_checkmark_fill: UIImage? {
		return UIImage(systemName: "clock.badge.checkmark.fill")
	}

	/// clock.badge.exclamationmark
	static var clock_badge_exclamationmark: UIImage? {
		return UIImage(systemName: "clock.badge.exclamationmark")
	}

	/// clock.badge.exclamationmark.fill
	static var clock_badge_exclamationmark_fill: UIImage? {
		return UIImage(systemName: "clock.badge.exclamationmark.fill")
	}

	/// deskclock
	static var deskclock: UIImage? {
		return UIImage(systemName: "deskclock")
	}

	/// deskclock.fill
	static var deskclock_fill: UIImage? {
		return UIImage(systemName: "deskclock.fill")
	}

	/// alarm
	static var alarm: UIImage? {
		return UIImage(systemName: "alarm")
	}

	/// alarm.fill
	static var alarm_fill: UIImage? {
		return UIImage(systemName: "alarm.fill")
	}

	/// stopwatch
	static var stopwatch: UIImage? {
		return UIImage(systemName: "stopwatch")
	}

	/// stopwatch.fill
	static var stopwatch_fill: UIImage? {
		return UIImage(systemName: "stopwatch.fill")
	}

	/// chart.xyaxis.line
	static var chart_xyaxis_line: UIImage? {
		return UIImage(systemName: "chart.xyaxis.line")
	}

	/// timer
	static var timer: UIImage? {
		return UIImage(systemName: "timer")
	}

	/// timer.square
	static var timer_square: UIImage? {
		return UIImage(systemName: "timer.square")
	}

	/// clock.arrow.circlepath
	static var clock_arrow_circlepath: UIImage? {
		return UIImage(systemName: "clock.arrow.circlepath")
	}

	/// exclamationmark.arrow.circlepath
	static var exclamationmark_arrow_circlepath: UIImage? {
		return UIImage(systemName: "exclamationmark.arrow.circlepath")
	}

	/// clock.arrow.2.circlepath
	static var clock_arrow_2_circlepath: UIImage? {
		return UIImage(systemName: "clock.arrow.2.circlepath")
	}

	/// gamecontroller
	static var gamecontroller: UIImage? {
		return UIImage(systemName: "gamecontroller")
	}

	/// gamecontroller.fill
	static var gamecontroller_fill: UIImage? {
		return UIImage(systemName: "gamecontroller.fill")
	}

	/// l.joystick
	static var l_joystick: UIImage? {
		return UIImage(systemName: "l.joystick")
	}

	/// l.joystick.fill
	static var l_joystick_fill: UIImage? {
		return UIImage(systemName: "l.joystick.fill")
	}

	/// r.joystick
	static var r_joystick: UIImage? {
		return UIImage(systemName: "r.joystick")
	}

	/// r.joystick.fill
	static var r_joystick_fill: UIImage? {
		return UIImage(systemName: "r.joystick.fill")
	}

	/// l.joystick.press.down
	static var l_joystick_press_down: UIImage? {
		return UIImage(systemName: "l.joystick.press.down")
	}

	/// l.joystick.press.down.fill
	static var l_joystick_press_down_fill: UIImage? {
		return UIImage(systemName: "l.joystick.press.down.fill")
	}

	/// r.joystick.press.down
	static var r_joystick_press_down: UIImage? {
		return UIImage(systemName: "r.joystick.press.down")
	}

	/// r.joystick.press.down.fill
	static var r_joystick_press_down_fill: UIImage? {
		return UIImage(systemName: "r.joystick.press.down.fill")
	}

	/// l.joystick.tilt.left
	static var l_joystick_tilt_left: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.left")
	}

	/// l.joystick.tilt.left.fill
	static var l_joystick_tilt_left_fill: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.left.fill")
	}

	/// l.joystick.tilt.right
	static var l_joystick_tilt_right: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.right")
	}

	/// l.joystick.tilt.right.fill
	static var l_joystick_tilt_right_fill: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.right.fill")
	}

	/// l.joystick.tilt.up
	static var l_joystick_tilt_up: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.up")
	}

	/// l.joystick.tilt.up.fill
	static var l_joystick_tilt_up_fill: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.up.fill")
	}

	/// l.joystick.tilt.down
	static var l_joystick_tilt_down: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.down")
	}

	/// l.joystick.tilt.down.fill
	static var l_joystick_tilt_down_fill: UIImage? {
		return UIImage(systemName: "l.joystick.tilt.down.fill")
	}

	/// r.joystick.tilt.left
	static var r_joystick_tilt_left: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.left")
	}

	/// r.joystick.tilt.left.fill
	static var r_joystick_tilt_left_fill: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.left.fill")
	}

	/// r.joystick.tilt.right
	static var r_joystick_tilt_right: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.right")
	}

	/// r.joystick.tilt.right.fill
	static var r_joystick_tilt_right_fill: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.right.fill")
	}

	/// r.joystick.tilt.up
	static var r_joystick_tilt_up: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.up")
	}

	/// r.joystick.tilt.up.fill
	static var r_joystick_tilt_up_fill: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.up.fill")
	}

	/// r.joystick.tilt.down
	static var r_joystick_tilt_down: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.down")
	}

	/// r.joystick.tilt.down.fill
	static var r_joystick_tilt_down_fill: UIImage? {
		return UIImage(systemName: "r.joystick.tilt.down.fill")
	}

	/// dpad
	static var dpad: UIImage? {
		return UIImage(systemName: "dpad")
	}

	/// dpad.fill
	static var dpad_fill: UIImage? {
		return UIImage(systemName: "dpad.fill")
	}

	/// dpad.left.fill
	static var dpad_left_fill: UIImage? {
		return UIImage(systemName: "dpad.left.fill")
	}

	/// dpad.up.fill
	static var dpad_up_fill: UIImage? {
		return UIImage(systemName: "dpad.up.fill")
	}

	/// dpad.right.fill
	static var dpad_right_fill: UIImage? {
		return UIImage(systemName: "dpad.right.fill")
	}

	/// dpad.down.fill
	static var dpad_down_fill: UIImage? {
		return UIImage(systemName: "dpad.down.fill")
	}

	/// circle.circle
	static var circle_circle: UIImage? {
		return UIImage(systemName: "circle.circle")
	}

	/// circle.circle.fill
	static var circle_circle_fill: UIImage? {
		return UIImage(systemName: "circle.circle.fill")
	}

	/// square.circle
	static var square_circle: UIImage? {
		return UIImage(systemName: "square.circle")
	}

	/// square.circle.fill
	static var square_circle_fill: UIImage? {
		return UIImage(systemName: "square.circle.fill")
	}

	/// triangle.circle
	static var triangle_circle: UIImage? {
		return UIImage(systemName: "triangle.circle")
	}

	/// triangle.circle.fill
	static var triangle_circle_fill: UIImage? {
		return UIImage(systemName: "triangle.circle.fill")
	}

	/// rectangle.roundedtop
	static var rectangle_roundedtop: UIImage? {
		return UIImage(systemName: "rectangle.roundedtop")
	}

	/// rectangle.roundedtop.fill
	static var rectangle_roundedtop_fill: UIImage? {
		return UIImage(systemName: "rectangle.roundedtop.fill")
	}

	/// rectangle.roundedbottom
	static var rectangle_roundedbottom: UIImage? {
		return UIImage(systemName: "rectangle.roundedbottom")
	}

	/// rectangle.roundedbottom.fill
	static var rectangle_roundedbottom_fill: UIImage? {
		return UIImage(systemName: "rectangle.roundedbottom.fill")
	}

	/// l.rectangle.roundedbottom
	static var l_rectangle_roundedbottom: UIImage? {
		return UIImage(systemName: "l.rectangle.roundedbottom")
	}

	/// l.rectangle.roundedbottom.fill
	static var l_rectangle_roundedbottom_fill: UIImage? {
		return UIImage(systemName: "l.rectangle.roundedbottom.fill")
	}

	/// l1.rectangle.roundedbottom
	static var l1_rectangle_roundedbottom: UIImage? {
		return UIImage(systemName: "l1.rectangle.roundedbottom")
	}

	/// l1.rectangle.roundedbottom.fill
	static var l1_rectangle_roundedbottom_fill: UIImage? {
		return UIImage(systemName: "l1.rectangle.roundedbottom.fill")
	}

	/// l2.rectangle.roundedtop
	static var l2_rectangle_roundedtop: UIImage? {
		return UIImage(systemName: "l2.rectangle.roundedtop")
	}

	/// l2.rectangle.roundedtop.fill
	static var l2_rectangle_roundedtop_fill: UIImage? {
		return UIImage(systemName: "l2.rectangle.roundedtop.fill")
	}

	/// r.rectangle.roundedbottom
	static var r_rectangle_roundedbottom: UIImage? {
		return UIImage(systemName: "r.rectangle.roundedbottom")
	}

	/// r.rectangle.roundedbottom.fill
	static var r_rectangle_roundedbottom_fill: UIImage? {
		return UIImage(systemName: "r.rectangle.roundedbottom.fill")
	}

	/// r1.rectangle.roundedbottom
	static var r1_rectangle_roundedbottom: UIImage? {
		return UIImage(systemName: "r1.rectangle.roundedbottom")
	}

	/// r1.rectangle.roundedbottom.fill
	static var r1_rectangle_roundedbottom_fill: UIImage? {
		return UIImage(systemName: "r1.rectangle.roundedbottom.fill")
	}

	/// r2.rectangle.roundedtop
	static var r2_rectangle_roundedtop: UIImage? {
		return UIImage(systemName: "r2.rectangle.roundedtop")
	}

	/// r2.rectangle.roundedtop.fill
	static var r2_rectangle_roundedtop_fill: UIImage? {
		return UIImage(systemName: "r2.rectangle.roundedtop.fill")
	}

	/// lb.rectangle.roundedbottom
	static var lb_rectangle_roundedbottom: UIImage? {
		return UIImage(systemName: "lb.rectangle.roundedbottom")
	}

	/// lb.rectangle.roundedbottom.fill
	static var lb_rectangle_roundedbottom_fill: UIImage? {
		return UIImage(systemName: "lb.rectangle.roundedbottom.fill")
	}

	/// rb.rectangle.roundedbottom
	static var rb_rectangle_roundedbottom: UIImage? {
		return UIImage(systemName: "rb.rectangle.roundedbottom")
	}

	/// rb.rectangle.roundedbottom.fill
	static var rb_rectangle_roundedbottom_fill: UIImage? {
		return UIImage(systemName: "rb.rectangle.roundedbottom.fill")
	}

	/// lt.rectangle.roundedtop
	static var lt_rectangle_roundedtop: UIImage? {
		return UIImage(systemName: "lt.rectangle.roundedtop")
	}

	/// lt.rectangle.roundedtop.fill
	static var lt_rectangle_roundedtop_fill: UIImage? {
		return UIImage(systemName: "lt.rectangle.roundedtop.fill")
	}

	/// rt.rectangle.roundedtop
	static var rt_rectangle_roundedtop: UIImage? {
		return UIImage(systemName: "rt.rectangle.roundedtop")
	}

	/// rt.rectangle.roundedtop.fill
	static var rt_rectangle_roundedtop_fill: UIImage? {
		return UIImage(systemName: "rt.rectangle.roundedtop.fill")
	}

	/// zl.rectangle.roundedtop
	static var zl_rectangle_roundedtop: UIImage? {
		return UIImage(systemName: "zl.rectangle.roundedtop")
	}

	/// zl.rectangle.roundedtop.fill
	static var zl_rectangle_roundedtop_fill: UIImage? {
		return UIImage(systemName: "zl.rectangle.roundedtop.fill")
	}

	/// zr.rectangle.roundedtop
	static var zr_rectangle_roundedtop: UIImage? {
		return UIImage(systemName: "zr.rectangle.roundedtop")
	}

	/// zr.rectangle.roundedtop.fill
	static var zr_rectangle_roundedtop_fill: UIImage? {
		return UIImage(systemName: "zr.rectangle.roundedtop.fill")
	}

	/// logo.playstation
	static var logo_playstation: UIImage? {
		return UIImage(systemName: "logo.playstation")
	}

	/// logo.xbox
	static var logo_xbox: UIImage? {
		return UIImage(systemName: "logo.xbox")
	}

	/// paintpalette
	static var paintpalette: UIImage? {
		return UIImage(systemName: "paintpalette")
	}

	/// paintpalette.fill
	static var paintpalette_fill: UIImage? {
		return UIImage(systemName: "paintpalette.fill")
	}

	/// takeoutbag.and.cup.and.straw
	static var takeoutbag_and_cup_and_straw: UIImage? {
		return UIImage(systemName: "takeoutbag.and.cup.and.straw")
	}

	/// takeoutbag.and.cup.and.straw.fill
	static var takeoutbag_and_cup_and_straw_fill: UIImage? {
		return UIImage(systemName: "takeoutbag.and.cup.and.straw.fill")
	}

	/// fork.knife
	static var fork_knife: UIImage? {
		return UIImage(systemName: "fork.knife")
	}

	/// fork.knife.circle
	static var fork_knife_circle: UIImage? {
		return UIImage(systemName: "fork.knife.circle")
	}

	/// fork.knife.circle.fill
	static var fork_knife_circle_fill: UIImage? {
		return UIImage(systemName: "fork.knife.circle.fill")
	}

	/// figure.walk
	static var figure_walk: UIImage? {
		return UIImage(systemName: "figure.walk")
	}

	/// figure.walk.circle
	static var figure_walk_circle: UIImage? {
		return UIImage(systemName: "figure.walk.circle")
	}

	/// figure.walk.circle.fill
	static var figure_walk_circle_fill: UIImage? {
		return UIImage(systemName: "figure.walk.circle.fill")
	}

	/// figure.walk.diamond
	static var figure_walk_diamond: UIImage? {
		return UIImage(systemName: "figure.walk.diamond")
	}

	/// figure.walk.diamond.fill
	static var figure_walk_diamond_fill: UIImage? {
		return UIImage(systemName: "figure.walk.diamond.fill")
	}

	/// figure.stand
	static var figure_stand: UIImage? {
		return UIImage(systemName: "figure.stand")
	}

	/// figure.stand.line.dotted.figure.stand
	static var figure_stand_line_dotted_figure_stand: UIImage? {
		return UIImage(systemName: "figure.stand.line.dotted.figure.stand")
	}

	/// figure.wave
	static var figure_wave: UIImage? {
		return UIImage(systemName: "figure.wave")
	}

	/// figure.wave.circle
	static var figure_wave_circle: UIImage? {
		return UIImage(systemName: "figure.wave.circle")
	}

	/// figure.wave.circle.fill
	static var figure_wave_circle_fill: UIImage? {
		return UIImage(systemName: "figure.wave.circle.fill")
	}

	/// ear
	static var ear: UIImage? {
		return UIImage(systemName: "ear")
	}

	/// ear.badge.checkmark
	static var ear_badge_checkmark: UIImage? {
		return UIImage(systemName: "ear.badge.checkmark")
	}

	/// ear.trianglebadge.exclamationmark
	static var ear_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "ear.trianglebadge.exclamationmark")
	}

	/// ear.fill
	static var ear_fill: UIImage? {
		return UIImage(systemName: "ear.fill")
	}

	/// hearingdevice.ear
	static var hearingdevice_ear: UIImage? {
		return UIImage(systemName: "hearingdevice.ear")
	}

	/// hand.raised
	static var hand_raised: UIImage? {
		return UIImage(systemName: "hand.raised")
	}

	/// hand.raised.fill
	static var hand_raised_fill: UIImage? {
		return UIImage(systemName: "hand.raised.fill")
	}

	/// hand.raised.circle
	static var hand_raised_circle: UIImage? {
		return UIImage(systemName: "hand.raised.circle")
	}

	/// hand.raised.circle.fill
	static var hand_raised_circle_fill: UIImage? {
		return UIImage(systemName: "hand.raised.circle.fill")
	}

	/// hand.raised.square
	static var hand_raised_square: UIImage? {
		return UIImage(systemName: "hand.raised.square")
	}

	/// hand.raised.square.fill
	static var hand_raised_square_fill: UIImage? {
		return UIImage(systemName: "hand.raised.square.fill")
	}

	/// hand.raised.slash
	static var hand_raised_slash: UIImage? {
		return UIImage(systemName: "hand.raised.slash")
	}

	/// hand.raised.slash.fill
	static var hand_raised_slash_fill: UIImage? {
		return UIImage(systemName: "hand.raised.slash.fill")
	}

	/// hand.thumbsup
	static var hand_thumbsup: UIImage? {
		return UIImage(systemName: "hand.thumbsup")
	}

	/// hand.thumbsup.fill
	static var hand_thumbsup_fill: UIImage? {
		return UIImage(systemName: "hand.thumbsup.fill")
	}

	/// hand.thumbsup.circle
	static var hand_thumbsup_circle: UIImage? {
		return UIImage(systemName: "hand.thumbsup.circle")
	}

	/// hand.thumbsup.circle.fill
	static var hand_thumbsup_circle_fill: UIImage? {
		return UIImage(systemName: "hand.thumbsup.circle.fill")
	}

	/// hand.thumbsdown
	static var hand_thumbsdown: UIImage? {
		return UIImage(systemName: "hand.thumbsdown")
	}

	/// hand.thumbsdown.fill
	static var hand_thumbsdown_fill: UIImage? {
		return UIImage(systemName: "hand.thumbsdown.fill")
	}

	/// hand.thumbsdown.circle
	static var hand_thumbsdown_circle: UIImage? {
		return UIImage(systemName: "hand.thumbsdown.circle")
	}

	/// hand.thumbsdown.circle.fill
	static var hand_thumbsdown_circle_fill: UIImage? {
		return UIImage(systemName: "hand.thumbsdown.circle.fill")
	}

	/// hand.point.up.left
	static var hand_point_up_left: UIImage? {
		return UIImage(systemName: "hand.point.up.left")
	}

	/// hand.point.up.left.fill
	static var hand_point_up_left_fill: UIImage? {
		return UIImage(systemName: "hand.point.up.left.fill")
	}

	/// hand.draw
	static var hand_draw: UIImage? {
		return UIImage(systemName: "hand.draw")
	}

	/// hand.draw.fill
	static var hand_draw_fill: UIImage? {
		return UIImage(systemName: "hand.draw.fill")
	}

	/// hand.tap
	static var hand_tap: UIImage? {
		return UIImage(systemName: "hand.tap")
	}

	/// hand.tap.fill
	static var hand_tap_fill: UIImage? {
		return UIImage(systemName: "hand.tap.fill")
	}

	/// rectangle.and.hand.point.up.left
	static var rectangle_and_hand_point_up_left: UIImage? {
		return UIImage(systemName: "rectangle.and.hand.point.up.left")
	}

	/// rectangle.and.hand.point.up.left.fill
	static var rectangle_and_hand_point_up_left_fill: UIImage? {
		return UIImage(systemName: "rectangle.and.hand.point.up.left.fill")
	}

	/// rectangle.filled.and.hand.point.up.left
	static var rectangle_filled_and_hand_point_up_left: UIImage? {
		return UIImage(systemName: "rectangle.filled.and.hand.point.up.left")
	}

	/// rectangle.and.hand.point.up.left.filled
	static var rectangle_and_hand_point_up_left_filled: UIImage? {
		return UIImage(systemName: "rectangle.and.hand.point.up.left.filled")
	}

	/// hand.point.left
	static var hand_point_left: UIImage? {
		return UIImage(systemName: "hand.point.left")
	}

	/// hand.point.left.fill
	static var hand_point_left_fill: UIImage? {
		return UIImage(systemName: "hand.point.left.fill")
	}

	/// hand.point.right
	static var hand_point_right: UIImage? {
		return UIImage(systemName: "hand.point.right")
	}

	/// hand.point.right.fill
	static var hand_point_right_fill: UIImage? {
		return UIImage(systemName: "hand.point.right.fill")
	}

	/// hand.point.up
	static var hand_point_up: UIImage? {
		return UIImage(systemName: "hand.point.up")
	}

	/// hand.point.up.fill
	static var hand_point_up_fill: UIImage? {
		return UIImage(systemName: "hand.point.up.fill")
	}

	/// hand.point.up.braille
	static var hand_point_up_braille: UIImage? {
		return UIImage(systemName: "hand.point.up.braille")
	}

	/// hand.point.up.braille.fill
	static var hand_point_up_braille_fill: UIImage? {
		return UIImage(systemName: "hand.point.up.braille.fill")
	}

	/// hand.point.down
	static var hand_point_down: UIImage? {
		return UIImage(systemName: "hand.point.down")
	}

	/// hand.point.down.fill
	static var hand_point_down_fill: UIImage? {
		return UIImage(systemName: "hand.point.down.fill")
	}

	/// hand.wave
	static var hand_wave: UIImage? {
		return UIImage(systemName: "hand.wave")
	}

	/// hand.wave.fill
	static var hand_wave_fill: UIImage? {
		return UIImage(systemName: "hand.wave.fill")
	}

	/// hands.clap
	static var hands_clap: UIImage? {
		return UIImage(systemName: "hands.clap")
	}

	/// hands.clap.fill
	static var hands_clap_fill: UIImage? {
		return UIImage(systemName: "hands.clap.fill")
	}

	/// hands.sparkles
	static var hands_sparkles: UIImage? {
		return UIImage(systemName: "hands.sparkles")
	}

	/// hands.sparkles.fill
	static var hands_sparkles_fill: UIImage? {
		return UIImage(systemName: "hands.sparkles.fill")
	}

	/// rectangle.compress.vertical
	static var rectangle_compress_vertical: UIImage? {
		return UIImage(systemName: "rectangle.compress.vertical")
	}

	/// rectangle.expand.vertical
	static var rectangle_expand_vertical: UIImage? {
		return UIImage(systemName: "rectangle.expand.vertical")
	}

	/// rectangle.and.arrow.up.right.and.arrow.down.left
	static var rectangle_and_arrow_up_right_and_arrow_down_left: UIImage? {
		return UIImage(systemName: "rectangle.and.arrow.up.right.and.arrow.down.left")
	}

	/// rectangle.and.arrow.up.right.and.arrow.down.left.slash
	static var rectangle_and_arrow_up_right_and_arrow_down_left_slash: UIImage? {
		return UIImage(systemName: "rectangle.and.arrow.up.right.and.arrow.down.left.slash")
	}

	/// square.2.stack.3d
	static var square_2_stack_3d: UIImage? {
		return UIImage(systemName: "square.2.stack.3d")
	}

	/// square.2.stack.3d.top.fill
	static var square_2_stack_3d_top_fill: UIImage? {
		return UIImage(systemName: "square.2.stack.3d.top.fill")
	}

	/// square.2.stack.3d.bottom.fill
	static var square_2_stack_3d_bottom_fill: UIImage? {
		return UIImage(systemName: "square.2.stack.3d.bottom.fill")
	}

	/// square.3.stack.3d
	static var square_3_stack_3d: UIImage? {
		return UIImage(systemName: "square.3.stack.3d")
	}

	/// square.3.stack.3d.top.fill
	static var square_3_stack_3d_top_fill: UIImage? {
		return UIImage(systemName: "square.3.stack.3d.top.fill")
	}

	/// square.3.stack.3d.middle.fill
	static var square_3_stack_3d_middle_fill: UIImage? {
		return UIImage(systemName: "square.3.stack.3d.middle.fill")
	}

	/// square.3.stack.3d.bottom.fill
	static var square_3_stack_3d_bottom_fill: UIImage? {
		return UIImage(systemName: "square.3.stack.3d.bottom.fill")
	}

	/// cylinder
	static var cylinder: UIImage? {
		return UIImage(systemName: "cylinder")
	}

	/// cylinder.fill
	static var cylinder_fill: UIImage? {
		return UIImage(systemName: "cylinder.fill")
	}

	/// cylinder.split.1x2
	static var cylinder_split_1x2: UIImage? {
		return UIImage(systemName: "cylinder.split.1x2")
	}

	/// cylinder.split.1x2.fill
	static var cylinder_split_1x2_fill: UIImage? {
		return UIImage(systemName: "cylinder.split.1x2.fill")
	}

	/// chart.bar
	static var chart_bar: UIImage? {
		return UIImage(systemName: "chart.bar")
	}

	/// chart.bar.fill
	static var chart_bar_fill: UIImage? {
		return UIImage(systemName: "chart.bar.fill")
	}

	/// chart.pie
	static var chart_pie: UIImage? {
		return UIImage(systemName: "chart.pie")
	}

	/// chart.pie.fill
	static var chart_pie_fill: UIImage? {
		return UIImage(systemName: "chart.pie.fill")
	}

	/// chart.bar.xaxis
	static var chart_bar_xaxis: UIImage? {
		return UIImage(systemName: "chart.bar.xaxis")
	}

	/// chart.line.uptrend.xyaxis
	static var chart_line_uptrend_xyaxis: UIImage? {
		return UIImage(systemName: "chart.line.uptrend.xyaxis")
	}

	/// dot.squareshape.split.2x2
	static var dot_squareshape_split_2x2: UIImage? {
		return UIImage(systemName: "dot.squareshape.split.2x2")
	}

	/// squareshape.split.2x2.dotted
	static var squareshape_split_2x2_dotted: UIImage? {
		return UIImage(systemName: "squareshape.split.2x2.dotted")
	}

	/// squareshape.split.2x2
	static var squareshape_split_2x2: UIImage? {
		return UIImage(systemName: "squareshape.split.2x2")
	}

	/// squareshape.split.3x3
	static var squareshape_split_3x3: UIImage? {
		return UIImage(systemName: "squareshape.split.3x3")
	}

	/// burst
	static var burst: UIImage? {
		return UIImage(systemName: "burst")
	}

	/// burst.fill
	static var burst_fill: UIImage? {
		return UIImage(systemName: "burst.fill")
	}

	/// waveform.path.ecg
	static var waveform_path_ecg: UIImage? {
		return UIImage(systemName: "waveform.path.ecg")
	}

	/// waveform.path.ecg.rectangle
	static var waveform_path_ecg_rectangle: UIImage? {
		return UIImage(systemName: "waveform.path.ecg.rectangle")
	}

	/// waveform.path.ecg.rectangle.fill
	static var waveform_path_ecg_rectangle_fill: UIImage? {
		return UIImage(systemName: "waveform.path.ecg.rectangle.fill")
	}

	/// waveform.path
	static var waveform_path: UIImage? {
		return UIImage(systemName: "waveform.path")
	}

	/// waveform.path.badge.plus
	static var waveform_path_badge_plus: UIImage? {
		return UIImage(systemName: "waveform.path.badge.plus")
	}

	/// waveform.path.badge.minus
	static var waveform_path_badge_minus: UIImage? {
		return UIImage(systemName: "waveform.path.badge.minus")
	}

	/// waveform
	static var waveform: UIImage? {
		return UIImage(systemName: "waveform")
	}

	/// waveform.circle
	static var waveform_circle: UIImage? {
		return UIImage(systemName: "waveform.circle")
	}

	/// waveform.circle.fill
	static var waveform_circle_fill: UIImage? {
		return UIImage(systemName: "waveform.circle.fill")
	}

	/// waveform.badge.plus
	static var waveform_badge_plus: UIImage? {
		return UIImage(systemName: "waveform.badge.plus")
	}

	/// waveform.badge.minus
	static var waveform_badge_minus: UIImage? {
		return UIImage(systemName: "waveform.badge.minus")
	}

	/// waveform.badge.exclamationmark
	static var waveform_badge_exclamationmark: UIImage? {
		return UIImage(systemName: "waveform.badge.exclamationmark")
	}

	/// waveform.and.magnifyingglass
	static var waveform_and_magnifyingglass: UIImage? {
		return UIImage(systemName: "waveform.and.magnifyingglass")
	}

	/// waveform.and.mic
	static var waveform_and_mic: UIImage? {
		return UIImage(systemName: "waveform.and.mic")
	}

	/// staroflife
	static var staroflife: UIImage? {
		return UIImage(systemName: "staroflife")
	}

	/// staroflife.fill
	static var staroflife_fill: UIImage? {
		return UIImage(systemName: "staroflife.fill")
	}

	/// staroflife.circle
	static var staroflife_circle: UIImage? {
		return UIImage(systemName: "staroflife.circle")
	}

	/// staroflife.circle.fill
	static var staroflife_circle_fill: UIImage? {
		return UIImage(systemName: "staroflife.circle.fill")
	}

	/// simcard
	static var simcard: UIImage? {
		return UIImage(systemName: "simcard")
	}

	/// simcard.fill
	static var simcard_fill: UIImage? {
		return UIImage(systemName: "simcard.fill")
	}

	/// simcard.2
	static var simcard_2: UIImage? {
		return UIImage(systemName: "simcard.2")
	}

	/// simcard.2.fill
	static var simcard_2_fill: UIImage? {
		return UIImage(systemName: "simcard.2.fill")
	}

	/// sdcard
	static var sdcard: UIImage? {
		return UIImage(systemName: "sdcard")
	}

	/// sdcard.fill
	static var sdcard_fill: UIImage? {
		return UIImage(systemName: "sdcard.fill")
	}

	/// esim
	static var esim: UIImage? {
		return UIImage(systemName: "esim")
	}

	/// esim.fill
	static var esim_fill: UIImage? {
		return UIImage(systemName: "esim.fill")
	}

	/// touchid
	static var touchid: UIImage? {
		return UIImage(systemName: "touchid")
	}

	/// bonjour
	static var bonjour: UIImage? {
		return UIImage(systemName: "bonjour")
	}

	/// atom
	static var atom: UIImage? {
		return UIImage(systemName: "atom")
	}

	/// scalemass
	static var scalemass: UIImage? {
		return UIImage(systemName: "scalemass")
	}

	/// scalemass.fill
	static var scalemass_fill: UIImage? {
		return UIImage(systemName: "scalemass.fill")
	}

	/// gift
	static var gift: UIImage? {
		return UIImage(systemName: "gift")
	}

	/// gift.fill
	static var gift_fill: UIImage? {
		return UIImage(systemName: "gift.fill")
	}

	/// gift.circle
	static var gift_circle: UIImage? {
		return UIImage(systemName: "gift.circle")
	}

	/// gift.circle.fill
	static var gift_circle_fill: UIImage? {
		return UIImage(systemName: "gift.circle.fill")
	}

	/// plus.app
	static var plus_app: UIImage? {
		return UIImage(systemName: "plus.app")
	}

	/// plus.app.fill
	static var plus_app_fill: UIImage? {
		return UIImage(systemName: "plus.app.fill")
	}

	/// arrow.down.app
	static var arrow_down_app: UIImage? {
		return UIImage(systemName: "arrow.down.app")
	}

	/// arrow.down.app.fill
	static var arrow_down_app_fill: UIImage? {
		return UIImage(systemName: "arrow.down.app.fill")
	}

	/// arrow.up.forward.app
	static var arrow_up_forward_app: UIImage? {
		return UIImage(systemName: "arrow.up.forward.app")
	}

	/// arrow.up.forward.app.fill
	static var arrow_up_forward_app_fill: UIImage? {
		return UIImage(systemName: "arrow.up.forward.app.fill")
	}

	/// xmark.app
	static var xmark_app: UIImage? {
		return UIImage(systemName: "xmark.app")
	}

	/// xmark.app.fill
	static var xmark_app_fill: UIImage? {
		return UIImage(systemName: "xmark.app.fill")
	}

	/// questionmark.app
	static var questionmark_app: UIImage? {
		return UIImage(systemName: "questionmark.app")
	}

	/// questionmark.app.fill
	static var questionmark_app_fill: UIImage? {
		return UIImage(systemName: "questionmark.app.fill")
	}

	/// app.badge
	static var app_badge: UIImage? {
		return UIImage(systemName: "app.badge")
	}

	/// app.badge.fill
	static var app_badge_fill: UIImage? {
		return UIImage(systemName: "app.badge.fill")
	}

	/// app.badge.checkmark
	static var app_badge_checkmark: UIImage? {
		return UIImage(systemName: "app.badge.checkmark")
	}

	/// app.badge.checkmark.fill
	static var app_badge_checkmark_fill: UIImage? {
		return UIImage(systemName: "app.badge.checkmark.fill")
	}

	/// app.dashed
	static var app_dashed: UIImage? {
		return UIImage(systemName: "app.dashed")
	}

	/// questionmark.app.dashed
	static var questionmark_app_dashed: UIImage? {
		return UIImage(systemName: "questionmark.app.dashed")
	}

	/// appclip
	static var appclip: UIImage? {
		return UIImage(systemName: "appclip")
	}

	/// app.gift
	static var app_gift: UIImage? {
		return UIImage(systemName: "app.gift")
	}

	/// app.gift.fill
	static var app_gift_fill: UIImage? {
		return UIImage(systemName: "app.gift.fill")
	}

	/// studentdesk
	static var studentdesk: UIImage? {
		return UIImage(systemName: "studentdesk")
	}

	/// hourglass
	static var hourglass: UIImage? {
		return UIImage(systemName: "hourglass")
	}

	/// hourglass.badge.plus
	static var hourglass_badge_plus: UIImage? {
		return UIImage(systemName: "hourglass.badge.plus")
	}

	/// hourglass.bottomhalf.filled
	static var hourglass_bottomhalf_filled: UIImage? {
		return UIImage(systemName: "hourglass.bottomhalf.filled")
	}

	/// hourglass.tophalf.filled
	static var hourglass_tophalf_filled: UIImage? {
		return UIImage(systemName: "hourglass.tophalf.filled")
	}

	/// banknote
	static var banknote: UIImage? {
		return UIImage(systemName: "banknote")
	}

	/// banknote.fill
	static var banknote_fill: UIImage? {
		return UIImage(systemName: "banknote.fill")
	}

	/// paragraphsign
	static var paragraphsign: UIImage? {
		return UIImage(systemName: "paragraphsign")
	}

	/// purchased
	static var purchased: UIImage? {
		return UIImage(systemName: "purchased")
	}

	/// purchased.circle
	static var purchased_circle: UIImage? {
		return UIImage(systemName: "purchased.circle")
	}

	/// purchased.circle.fill
	static var purchased_circle_fill: UIImage? {
		return UIImage(systemName: "purchased.circle.fill")
	}

	/// perspective
	static var perspective: UIImage? {
		return UIImage(systemName: "perspective")
	}

	/// circle.and.line.horizontal
	static var circle_and_line_horizontal: UIImage? {
		return UIImage(systemName: "circle.and.line.horizontal")
	}

	/// circle.and.line.horizontal.fill
	static var circle_and_line_horizontal_fill: UIImage? {
		return UIImage(systemName: "circle.and.line.horizontal.fill")
	}

	/// trapezoid.and.line.vertical
	static var trapezoid_and_line_vertical: UIImage? {
		return UIImage(systemName: "trapezoid.and.line.vertical")
	}

	/// trapezoid.and.line.vertical.fill
	static var trapezoid_and_line_vertical_fill: UIImage? {
		return UIImage(systemName: "trapezoid.and.line.vertical.fill")
	}

	/// trapezoid.and.line.horizontal
	static var trapezoid_and_line_horizontal: UIImage? {
		return UIImage(systemName: "trapezoid.and.line.horizontal")
	}

	/// trapezoid.and.line.horizontal.fill
	static var trapezoid_and_line_horizontal_fill: UIImage? {
		return UIImage(systemName: "trapezoid.and.line.horizontal.fill")
	}

	/// aspectratio
	static var aspectratio: UIImage? {
		return UIImage(systemName: "aspectratio")
	}

	/// aspectratio.fill
	static var aspectratio_fill: UIImage? {
		return UIImage(systemName: "aspectratio.fill")
	}

	/// camera.filters
	static var camera_filters: UIImage? {
		return UIImage(systemName: "camera.filters")
	}

	/// skew
	static var skew: UIImage? {
		return UIImage(systemName: "skew")
	}

	/// arrow.left.and.right.righttriangle.left.righttriangle.right
	static var arrow_left_and_right_righttriangle_left_righttriangle_right: UIImage? {
		return UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right")
	}

	/// arrow.left.and.right.righttriangle.left.righttriangle.right.fill
	static var arrow_left_and_right_righttriangle_left_righttriangle_right_fill: UIImage? {
		return UIImage(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right.fill")
	}

	/// arrow.up.and.down.righttriangle.up.righttriangle.down
	static var arrow_up_and_down_righttriangle_up_righttriangle_down: UIImage? {
		return UIImage(systemName: "arrow.up.and.down.righttriangle.up.righttriangle.down")
	}

	/// arrow.up.and.down.righttriangle.up.fill.righttriangle.down.fill
	static var arrow_up_and_down_righttriangle_up_fill_righttriangle_down_fill: UIImage? {
		return UIImage(systemName: "arrow.up.and.down.righttriangle.up.fill.righttriangle.down.fill")
	}

	/// arrowtriangle.left.and.line.vertical.and.arrowtriangle.right
	static var arrowtriangle_left_and_line_vertical_and_arrowtriangle_right: UIImage? {
		return UIImage(systemName: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right")
	}

	/// arrowtriangle.left.fill.and.line.vertical.and.arrowtriangle.right.fill
	static var arrowtriangle_left_fill_and_line_vertical_and_arrowtriangle_right_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.left.fill.and.line.vertical.and.arrowtriangle.right.fill")
	}

	/// arrowtriangle.right.and.line.vertical.and.arrowtriangle.left
	static var arrowtriangle_right_and_line_vertical_and_arrowtriangle_left: UIImage? {
		return UIImage(systemName: "arrowtriangle.right.and.line.vertical.and.arrowtriangle.left")
	}

	/// arrowtriangle.right.fill.and.line.vertical.and.arrowtriangle.left.fill
	static var arrowtriangle_right_fill_and_line_vertical_and_arrowtriangle_left_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.right.fill.and.line.vertical.and.arrowtriangle.left.fill")
	}

	/// grid
	static var grid: UIImage? {
		return UIImage(systemName: "grid")
	}

	/// grid.circle
	static var grid_circle: UIImage? {
		return UIImage(systemName: "grid.circle")
	}

	/// grid.circle.fill
	static var grid_circle_fill: UIImage? {
		return UIImage(systemName: "grid.circle.fill")
	}

	/// burn
	static var burn: UIImage? {
		return UIImage(systemName: "burn")
	}

	/// lifepreserver
	static var lifepreserver: UIImage? {
		return UIImage(systemName: "lifepreserver")
	}

	/// lifepreserver.fill
	static var lifepreserver_fill: UIImage? {
		return UIImage(systemName: "lifepreserver.fill")
	}

	/// recordingtape
	static var recordingtape: UIImage? {
		return UIImage(systemName: "recordingtape")
	}

	/// binoculars
	static var binoculars: UIImage? {
		return UIImage(systemName: "binoculars")
	}

	/// binoculars.fill
	static var binoculars_fill: UIImage? {
		return UIImage(systemName: "binoculars.fill")
	}

	/// battery.100
	static var battery_100: UIImage? {
		return UIImage(systemName: "battery.100")
	}

	/// battery.75
	static var battery_75: UIImage? {
		return UIImage(systemName: "battery.75")
	}

	/// battery.50
	static var battery_50: UIImage? {
		return UIImage(systemName: "battery.50")
	}

	/// battery.25
	static var battery_25: UIImage? {
		return UIImage(systemName: "battery.25")
	}

	/// battery.0
	static var battery_0: UIImage? {
		return UIImage(systemName: "battery.0")
	}

	/// battery.100.bolt
	static var battery_100_bolt: UIImage? {
		return UIImage(systemName: "battery.100.bolt")
	}

	/// minus.plus.batteryblock
	static var minus_plus_batteryblock: UIImage? {
		return UIImage(systemName: "minus.plus.batteryblock")
	}

	/// minus.plus.batteryblock.fill
	static var minus_plus_batteryblock_fill: UIImage? {
		return UIImage(systemName: "minus.plus.batteryblock.fill")
	}

	/// bolt.batteryblock
	static var bolt_batteryblock: UIImage? {
		return UIImage(systemName: "bolt.batteryblock")
	}

	/// bolt.batteryblock.fill
	static var bolt_batteryblock_fill: UIImage? {
		return UIImage(systemName: "bolt.batteryblock.fill")
	}

	/// lightbulb
	static var lightbulb: UIImage? {
		return UIImage(systemName: "lightbulb")
	}

	/// lightbulb.fill
	static var lightbulb_fill: UIImage? {
		return UIImage(systemName: "lightbulb.fill")
	}

	/// lightbulb.slash
	static var lightbulb_slash: UIImage? {
		return UIImage(systemName: "lightbulb.slash")
	}

	/// lightbulb.slash.fill
	static var lightbulb_slash_fill: UIImage? {
		return UIImage(systemName: "lightbulb.slash.fill")
	}

	/// fibrechannel
	static var fibrechannel: UIImage? {
		return UIImage(systemName: "fibrechannel")
	}

	/// checklist
	static var checklist: UIImage? {
		return UIImage(systemName: "checklist")
	}

	/// square.fill.text.grid.1x2
	static var square_fill_text_grid_1x2: UIImage? {
		return UIImage(systemName: "square.fill.text.grid.1x2")
	}

	/// list.dash
	static var list_dash: UIImage? {
		return UIImage(systemName: "list.dash")
	}

	/// list.bullet
	static var list_bullet: UIImage? {
		return UIImage(systemName: "list.bullet")
	}

	/// list.bullet.circle
	static var list_bullet_circle: UIImage? {
		return UIImage(systemName: "list.bullet.circle")
	}

	/// list.bullet.circle.fill
	static var list_bullet_circle_fill: UIImage? {
		return UIImage(systemName: "list.bullet.circle.fill")
	}

	/// list.triangle
	static var list_triangle: UIImage? {
		return UIImage(systemName: "list.triangle")
	}

	/// list.bullet.indent
	static var list_bullet_indent: UIImage? {
		return UIImage(systemName: "list.bullet.indent")
	}

	/// list.number
	static var list_number: UIImage? {
		return UIImage(systemName: "list.number")
	}

	/// list.star
	static var list_star: UIImage? {
		return UIImage(systemName: "list.star")
	}

	/// increase.indent
	static var increase_indent: UIImage? {
		return UIImage(systemName: "increase.indent")
	}

	/// decrease.indent
	static var decrease_indent: UIImage? {
		return UIImage(systemName: "decrease.indent")
	}

	/// decrease.quotelevel
	static var decrease_quotelevel: UIImage? {
		return UIImage(systemName: "decrease.quotelevel")
	}

	/// increase.quotelevel
	static var increase_quotelevel: UIImage? {
		return UIImage(systemName: "increase.quotelevel")
	}

	/// list.bullet.below.rectangle
	static var list_bullet_below_rectangle: UIImage? {
		return UIImage(systemName: "list.bullet.below.rectangle")
	}

	/// text.badge.plus
	static var text_badge_plus: UIImage? {
		return UIImage(systemName: "text.badge.plus")
	}

	/// text.badge.minus
	static var text_badge_minus: UIImage? {
		return UIImage(systemName: "text.badge.minus")
	}

	/// text.badge.checkmark
	static var text_badge_checkmark: UIImage? {
		return UIImage(systemName: "text.badge.checkmark")
	}

	/// text.badge.xmark
	static var text_badge_xmark: UIImage? {
		return UIImage(systemName: "text.badge.xmark")
	}

	/// text.badge.star
	static var text_badge_star: UIImage? {
		return UIImage(systemName: "text.badge.star")
	}

	/// text.insert
	static var text_insert: UIImage? {
		return UIImage(systemName: "text.insert")
	}

	/// text.append
	static var text_append: UIImage? {
		return UIImage(systemName: "text.append")
	}

	/// text.quote
	static var text_quote: UIImage? {
		return UIImage(systemName: "text.quote")
	}

	/// text.alignleft
	static var text_alignleft: UIImage? {
		return UIImage(systemName: "text.alignleft")
	}

	/// text.aligncenter
	static var text_aligncenter: UIImage? {
		return UIImage(systemName: "text.aligncenter")
	}

	/// text.alignright
	static var text_alignright: UIImage? {
		return UIImage(systemName: "text.alignright")
	}

	/// text.justify
	static var text_justify: UIImage? {
		return UIImage(systemName: "text.justify")
	}

	/// text.justifyleft
	static var text_justifyleft: UIImage? {
		return UIImage(systemName: "text.justifyleft")
	}

	/// text.justifyright
	static var text_justifyright: UIImage? {
		return UIImage(systemName: "text.justifyright")
	}

	/// text.redaction
	static var text_redaction: UIImage? {
		return UIImage(systemName: "text.redaction")
	}

	/// list.and.film
	static var list_and_film: UIImage? {
		return UIImage(systemName: "list.and.film")
	}

	/// line.3.horizontal
	static var line_3_horizontal: UIImage? {
		return UIImage(systemName: "line.3.horizontal")
	}

	/// line.3.horizontal.decrease
	static var line_3_horizontal_decrease: UIImage? {
		return UIImage(systemName: "line.3.horizontal.decrease")
	}

	/// line.3.horizontal.decrease.circle
	static var line_3_horizontal_decrease_circle: UIImage? {
		return UIImage(systemName: "line.3.horizontal.decrease.circle")
	}

	/// line.3.horizontal.decrease.circle.fill
	static var line_3_horizontal_decrease_circle_fill: UIImage? {
		return UIImage(systemName: "line.3.horizontal.decrease.circle.fill")
	}

	/// line.3.horizontal.circle
	static var line_3_horizontal_circle: UIImage? {
		return UIImage(systemName: "line.3.horizontal.circle")
	}

	/// line.3.horizontal.circle.fill
	static var line_3_horizontal_circle_fill: UIImage? {
		return UIImage(systemName: "line.3.horizontal.circle.fill")
	}

	/// line.2.horizontal.decrease.circle
	static var line_2_horizontal_decrease_circle: UIImage? {
		return UIImage(systemName: "line.2.horizontal.decrease.circle")
	}

	/// line.2.horizontal.decrease.circle.fill
	static var line_2_horizontal_decrease_circle_fill: UIImage? {
		return UIImage(systemName: "line.2.horizontal.decrease.circle.fill")
	}

	/// character
	static var character: UIImage? {
		return UIImage(systemName: "character")
	}

	/// textformat.size.smaller
	static var textformat_size_smaller: UIImage? {
		return UIImage(systemName: "textformat.size.smaller")
	}

	/// textformat.size.larger
	static var textformat_size_larger: UIImage? {
		return UIImage(systemName: "textformat.size.larger")
	}

	/// textformat.size
	static var textformat_size: UIImage? {
		return UIImage(systemName: "textformat.size")
	}

	/// textformat
	static var textformat: UIImage? {
		return UIImage(systemName: "textformat")
	}

	/// textformat.alt
	static var textformat_alt: UIImage? {
		return UIImage(systemName: "textformat.alt")
	}

	/// textformat.superscript
	static var textformat_superscript: UIImage? {
		return UIImage(systemName: "textformat.superscript")
	}

	/// textformat.subscript
	static var textformat_subscript: UIImage? {
		return UIImage(systemName: "textformat.subscript")
	}

	/// abc
	static var abc: UIImage? {
		return UIImage(systemName: "abc")
	}

	/// textformat.abc
	static var textformat_abc: UIImage? {
		return UIImage(systemName: "textformat.abc")
	}

	/// textformat.abc.dottedunderline
	static var textformat_abc_dottedunderline: UIImage? {
		return UIImage(systemName: "textformat.abc.dottedunderline")
	}

	/// bold
	static var bold: UIImage? {
		return UIImage(systemName: "bold")
	}

	/// italic
	static var italic: UIImage? {
		return UIImage(systemName: "italic")
	}

	/// underline
	static var underline: UIImage? {
		return UIImage(systemName: "underline")
	}

	/// strikethrough
	static var strikethrough: UIImage? {
		return UIImage(systemName: "strikethrough")
	}

	/// shadow
	static var shadow: UIImage? {
		return UIImage(systemName: "shadow")
	}

	/// bold.italic.underline
	static var bold_italic_underline: UIImage? {
		return UIImage(systemName: "bold.italic.underline")
	}

	/// bold.underline
	static var bold_underline: UIImage? {
		return UIImage(systemName: "bold.underline")
	}

	/// view.2d
	static var view_2d: UIImage? {
		return UIImage(systemName: "view.2d")
	}

	/// view.3d
	static var view_3d: UIImage? {
		return UIImage(systemName: "view.3d")
	}

	/// character.cursor.ibeam
	static var character_cursor_ibeam: UIImage? {
		return UIImage(systemName: "character.cursor.ibeam")
	}

	/// fx
	static var fx: UIImage? {
		return UIImage(systemName: "fx")
	}

	/// f.cursive
	static var f_cursive: UIImage? {
		return UIImage(systemName: "f.cursive")
	}

	/// f.cursive.circle
	static var f_cursive_circle: UIImage? {
		return UIImage(systemName: "f.cursive.circle")
	}

	/// f.cursive.circle.fill
	static var f_cursive_circle_fill: UIImage? {
		return UIImage(systemName: "f.cursive.circle.fill")
	}

	/// k
	static var k: UIImage? {
		return UIImage(systemName: "k")
	}

	/// sum
	static var sum: UIImage? {
		return UIImage(systemName: "sum")
	}

	/// percent
	static var percent: UIImage? {
		return UIImage(systemName: "percent")
	}

	/// function
	static var function: UIImage? {
		return UIImage(systemName: "function")
	}

	/// fn
	static var fn: UIImage? {
		return UIImage(systemName: "fn")
	}

	/// textformat.123
	static var textformat_123: UIImage? {
		return UIImage(systemName: "textformat.123")
	}

	/// 123.rectangle
	static var rectangle_123: UIImage? {
		return UIImage(systemName: "123.rectangle")
	}

	/// 123.rectangle.fill
	static var rectangle_fill_123: UIImage? {
		return UIImage(systemName: "123.rectangle.fill")
	}

	/// character.textbox
	static var character_textbox: UIImage? {
		return UIImage(systemName: "character.textbox")
	}

	/// a.magnify
	static var a_magnify: UIImage? {
		return UIImage(systemName: "a.magnify")
	}

	/// info
	static var info: UIImage? {
		return UIImage(systemName: "info")
	}

	/// info.circle
	static var info_circle: UIImage? {
		return UIImage(systemName: "info.circle")
	}

	/// info.circle.fill
	static var info_circle_fill: UIImage? {
		return UIImage(systemName: "info.circle.fill")
	}

	/// at
	static var at: UIImage? {
		return UIImage(systemName: "at")
	}

	/// at.circle
	static var at_circle: UIImage? {
		return UIImage(systemName: "at.circle")
	}

	/// at.circle.fill
	static var at_circle_fill: UIImage? {
		return UIImage(systemName: "at.circle.fill")
	}

	/// at.badge.plus
	static var at_badge_plus: UIImage? {
		return UIImage(systemName: "at.badge.plus")
	}

	/// at.badge.minus
	static var at_badge_minus: UIImage? {
		return UIImage(systemName: "at.badge.minus")
	}

	/// questionmark
	static var questionmark: UIImage? {
		return UIImage(systemName: "questionmark")
	}

	/// questionmark.circle
	static var questionmark_circle: UIImage? {
		return UIImage(systemName: "questionmark.circle")
	}

	/// questionmark.circle.fill
	static var questionmark_circle_fill: UIImage? {
		return UIImage(systemName: "questionmark.circle.fill")
	}

	/// questionmark.square
	static var questionmark_square: UIImage? {
		return UIImage(systemName: "questionmark.square")
	}

	/// questionmark.square.fill
	static var questionmark_square_fill: UIImage? {
		return UIImage(systemName: "questionmark.square.fill")
	}

	/// questionmark.diamond
	static var questionmark_diamond: UIImage? {
		return UIImage(systemName: "questionmark.diamond")
	}

	/// questionmark.diamond.fill
	static var questionmark_diamond_fill: UIImage? {
		return UIImage(systemName: "questionmark.diamond.fill")
	}

	/// exclamationmark
	static var exclamationmark: UIImage? {
		return UIImage(systemName: "exclamationmark")
	}

	/// exclamationmark.2
	static var exclamationmark_2: UIImage? {
		return UIImage(systemName: "exclamationmark.2")
	}

	/// exclamationmark.3
	static var exclamationmark_3: UIImage? {
		return UIImage(systemName: "exclamationmark.3")
	}

	/// exclamationmark.circle
	static var exclamationmark_circle: UIImage? {
		return UIImage(systemName: "exclamationmark.circle")
	}

	/// exclamationmark.circle.fill
	static var exclamationmark_circle_fill: UIImage? {
		return UIImage(systemName: "exclamationmark.circle.fill")
	}

	/// exclamationmark.square
	static var exclamationmark_square: UIImage? {
		return UIImage(systemName: "exclamationmark.square")
	}

	/// exclamationmark.square.fill
	static var exclamationmark_square_fill: UIImage? {
		return UIImage(systemName: "exclamationmark.square.fill")
	}

	/// exclamationmark.octagon
	static var exclamationmark_octagon: UIImage? {
		return UIImage(systemName: "exclamationmark.octagon")
	}

	/// exclamationmark.octagon.fill
	static var exclamationmark_octagon_fill: UIImage? {
		return UIImage(systemName: "exclamationmark.octagon.fill")
	}

	/// exclamationmark.shield
	static var exclamationmark_shield: UIImage? {
		return UIImage(systemName: "exclamationmark.shield")
	}

	/// exclamationmark.shield.fill
	static var exclamationmark_shield_fill: UIImage? {
		return UIImage(systemName: "exclamationmark.shield.fill")
	}

	/// plus
	static var plus: UIImage? {
		return UIImage(systemName: "plus")
	}

	/// plus.circle
	static var plus_circle: UIImage? {
		return UIImage(systemName: "plus.circle")
	}

	/// plus.circle.fill
	static var plus_circle_fill: UIImage? {
		return UIImage(systemName: "plus.circle.fill")
	}

	/// plus.square
	static var plus_square: UIImage? {
		return UIImage(systemName: "plus.square")
	}

	/// plus.square.fill
	static var plus_square_fill: UIImage? {
		return UIImage(systemName: "plus.square.fill")
	}

	/// plus.rectangle
	static var plus_rectangle: UIImage? {
		return UIImage(systemName: "plus.rectangle")
	}

	/// plus.rectangle.fill
	static var plus_rectangle_fill: UIImage? {
		return UIImage(systemName: "plus.rectangle.fill")
	}

	/// plus.rectangle.portrait
	static var plus_rectangle_portrait: UIImage? {
		return UIImage(systemName: "plus.rectangle.portrait")
	}

	/// plus.rectangle.portrait.fill
	static var plus_rectangle_portrait_fill: UIImage? {
		return UIImage(systemName: "plus.rectangle.portrait.fill")
	}

	/// plus.diamond
	static var plus_diamond: UIImage? {
		return UIImage(systemName: "plus.diamond")
	}

	/// plus.diamond.fill
	static var plus_diamond_fill: UIImage? {
		return UIImage(systemName: "plus.diamond.fill")
	}

	/// minus
	static var minus: UIImage? {
		return UIImage(systemName: "minus")
	}

	/// minus.circle
	static var minus_circle: UIImage? {
		return UIImage(systemName: "minus.circle")
	}

	/// minus.circle.fill
	static var minus_circle_fill: UIImage? {
		return UIImage(systemName: "minus.circle.fill")
	}

	/// minus.square
	static var minus_square: UIImage? {
		return UIImage(systemName: "minus.square")
	}

	/// minus.square.fill
	static var minus_square_fill: UIImage? {
		return UIImage(systemName: "minus.square.fill")
	}

	/// minus.rectangle
	static var minus_rectangle: UIImage? {
		return UIImage(systemName: "minus.rectangle")
	}

	/// minus.rectangle.fill
	static var minus_rectangle_fill: UIImage? {
		return UIImage(systemName: "minus.rectangle.fill")
	}

	/// minus.rectangle.portrait
	static var minus_rectangle_portrait: UIImage? {
		return UIImage(systemName: "minus.rectangle.portrait")
	}

	/// minus.rectangle.portrait.fill
	static var minus_rectangle_portrait_fill: UIImage? {
		return UIImage(systemName: "minus.rectangle.portrait.fill")
	}

	/// minus.diamond
	static var minus_diamond: UIImage? {
		return UIImage(systemName: "minus.diamond")
	}

	/// minus.diamond.fill
	static var minus_diamond_fill: UIImage? {
		return UIImage(systemName: "minus.diamond.fill")
	}

	/// plusminus
	static var plusminus: UIImage? {
		return UIImage(systemName: "plusminus")
	}

	/// plusminus.circle
	static var plusminus_circle: UIImage? {
		return UIImage(systemName: "plusminus.circle")
	}

	/// plusminus.circle.fill
	static var plusminus_circle_fill: UIImage? {
		return UIImage(systemName: "plusminus.circle.fill")
	}

	/// plus.forwardslash.minus
	static var plus_forwardslash_minus: UIImage? {
		return UIImage(systemName: "plus.forwardslash.minus")
	}

	/// minus.forwardslash.plus
	static var minus_forwardslash_plus: UIImage? {
		return UIImage(systemName: "minus.forwardslash.plus")
	}

	/// multiply
	static var multiply: UIImage? {
		return UIImage(systemName: "multiply")
	}

	/// multiply.circle
	static var multiply_circle: UIImage? {
		return UIImage(systemName: "multiply.circle")
	}

	/// multiply.circle.fill
	static var multiply_circle_fill: UIImage? {
		return UIImage(systemName: "multiply.circle.fill")
	}

	/// multiply.square
	static var multiply_square: UIImage? {
		return UIImage(systemName: "multiply.square")
	}

	/// multiply.square.fill
	static var multiply_square_fill: UIImage? {
		return UIImage(systemName: "multiply.square.fill")
	}

	/// xmark.rectangle
	static var xmark_rectangle: UIImage? {
		return UIImage(systemName: "xmark.rectangle")
	}

	/// xmark.rectangle.fill
	static var xmark_rectangle_fill: UIImage? {
		return UIImage(systemName: "xmark.rectangle.fill")
	}

	/// xmark.rectangle.portrait
	static var xmark_rectangle_portrait: UIImage? {
		return UIImage(systemName: "xmark.rectangle.portrait")
	}

	/// xmark.rectangle.portrait.fill
	static var xmark_rectangle_portrait_fill: UIImage? {
		return UIImage(systemName: "xmark.rectangle.portrait.fill")
	}

	/// xmark.diamond
	static var xmark_diamond: UIImage? {
		return UIImage(systemName: "xmark.diamond")
	}

	/// xmark.diamond.fill
	static var xmark_diamond_fill: UIImage? {
		return UIImage(systemName: "xmark.diamond.fill")
	}

	/// xmark.shield
	static var xmark_shield: UIImage? {
		return UIImage(systemName: "xmark.shield")
	}

	/// xmark.shield.fill
	static var xmark_shield_fill: UIImage? {
		return UIImage(systemName: "xmark.shield.fill")
	}

	/// xmark.octagon
	static var xmark_octagon: UIImage? {
		return UIImage(systemName: "xmark.octagon")
	}

	/// xmark.octagon.fill
	static var xmark_octagon_fill: UIImage? {
		return UIImage(systemName: "xmark.octagon.fill")
	}

	/// divide
	static var divide: UIImage? {
		return UIImage(systemName: "divide")
	}

	/// divide.circle
	static var divide_circle: UIImage? {
		return UIImage(systemName: "divide.circle")
	}

	/// divide.circle.fill
	static var divide_circle_fill: UIImage? {
		return UIImage(systemName: "divide.circle.fill")
	}

	/// divide.square
	static var divide_square: UIImage? {
		return UIImage(systemName: "divide.square")
	}

	/// divide.square.fill
	static var divide_square_fill: UIImage? {
		return UIImage(systemName: "divide.square.fill")
	}

	/// equal
	static var equal: UIImage? {
		return UIImage(systemName: "equal")
	}

	/// equal.circle
	static var equal_circle: UIImage? {
		return UIImage(systemName: "equal.circle")
	}

	/// equal.circle.fill
	static var equal_circle_fill: UIImage? {
		return UIImage(systemName: "equal.circle.fill")
	}

	/// equal.square
	static var equal_square: UIImage? {
		return UIImage(systemName: "equal.square")
	}

	/// equal.square.fill
	static var equal_square_fill: UIImage? {
		return UIImage(systemName: "equal.square.fill")
	}

	/// lessthan
	static var lessthan: UIImage? {
		return UIImage(systemName: "lessthan")
	}

	/// lessthan.circle
	static var lessthan_circle: UIImage? {
		return UIImage(systemName: "lessthan.circle")
	}

	/// lessthan.circle.fill
	static var lessthan_circle_fill: UIImage? {
		return UIImage(systemName: "lessthan.circle.fill")
	}

	/// lessthan.square
	static var lessthan_square: UIImage? {
		return UIImage(systemName: "lessthan.square")
	}

	/// lessthan.square.fill
	static var lessthan_square_fill: UIImage? {
		return UIImage(systemName: "lessthan.square.fill")
	}

	/// greaterthan
	static var greaterthan: UIImage? {
		return UIImage(systemName: "greaterthan")
	}

	/// greaterthan.circle
	static var greaterthan_circle: UIImage? {
		return UIImage(systemName: "greaterthan.circle")
	}

	/// greaterthan.circle.fill
	static var greaterthan_circle_fill: UIImage? {
		return UIImage(systemName: "greaterthan.circle.fill")
	}

	/// greaterthan.square
	static var greaterthan_square: UIImage? {
		return UIImage(systemName: "greaterthan.square")
	}

	/// greaterthan.square.fill
	static var greaterthan_square_fill: UIImage? {
		return UIImage(systemName: "greaterthan.square.fill")
	}

	/// chevron.left.forwardslash.chevron.right
	static var chevron_left_forwardslash_chevron_right: UIImage? {
		return UIImage(systemName: "chevron.left.forwardslash.chevron.right")
	}

	/// parentheses
	static var parentheses: UIImage? {
		return UIImage(systemName: "parentheses")
	}

	/// curlybraces
	static var curlybraces: UIImage? {
		return UIImage(systemName: "curlybraces")
	}

	/// curlybraces.square
	static var curlybraces_square: UIImage? {
		return UIImage(systemName: "curlybraces.square")
	}

	/// curlybraces.square.fill
	static var curlybraces_square_fill: UIImage? {
		return UIImage(systemName: "curlybraces.square.fill")
	}

	/// number
	static var number: UIImage? {
		return UIImage(systemName: "number")
	}

	/// number.circle
	static var number_circle: UIImage? {
		return UIImage(systemName: "number.circle")
	}

	/// number.circle.fill
	static var number_circle_fill: UIImage? {
		return UIImage(systemName: "number.circle.fill")
	}

	/// number.square
	static var number_square: UIImage? {
		return UIImage(systemName: "number.square")
	}

	/// number.square.fill
	static var number_square_fill: UIImage? {
		return UIImage(systemName: "number.square.fill")
	}

	/// x.squareroot
	static var x_squareroot: UIImage? {
		return UIImage(systemName: "x.squareroot")
	}

	/// xmark
	static var xmark: UIImage? {
		return UIImage(systemName: "xmark")
	}

	/// xmark.circle
	static var xmark_circle: UIImage? {
		return UIImage(systemName: "xmark.circle")
	}

	/// xmark.circle.fill
	static var xmark_circle_fill: UIImage? {
		return UIImage(systemName: "xmark.circle.fill")
	}

	/// xmark.square
	static var xmark_square: UIImage? {
		return UIImage(systemName: "xmark.square")
	}

	/// xmark.square.fill
	static var xmark_square_fill: UIImage? {
		return UIImage(systemName: "xmark.square.fill")
	}

	/// checkmark
	static var checkmark: UIImage? {
		return UIImage(systemName: "checkmark")
	}

	/// checkmark.circle
	static var checkmark_circle: UIImage? {
		return UIImage(systemName: "checkmark.circle")
	}

	/// checkmark.circle.fill
	static var checkmark_circle_fill: UIImage? {
		return UIImage(systemName: "checkmark.circle.fill")
	}

	/// checkmark.circle.trianglebadge.exclamationmark
	static var checkmark_circle_trianglebadge_exclamationmark: UIImage? {
		return UIImage(systemName: "checkmark.circle.trianglebadge.exclamationmark")
	}

	/// checkmark.square
	static var checkmark_square: UIImage? {
		return UIImage(systemName: "checkmark.square")
	}

	/// checkmark.square.fill
	static var checkmark_square_fill: UIImage? {
		return UIImage(systemName: "checkmark.square.fill")
	}

	/// checkmark.rectangle
	static var checkmark_rectangle: UIImage? {
		return UIImage(systemName: "checkmark.rectangle")
	}

	/// checkmark.rectangle.fill
	static var checkmark_rectangle_fill: UIImage? {
		return UIImage(systemName: "checkmark.rectangle.fill")
	}

	/// checkmark.rectangle.portrait
	static var checkmark_rectangle_portrait: UIImage? {
		return UIImage(systemName: "checkmark.rectangle.portrait")
	}

	/// checkmark.rectangle.portrait.fill
	static var checkmark_rectangle_portrait_fill: UIImage? {
		return UIImage(systemName: "checkmark.rectangle.portrait.fill")
	}

	/// checkmark.diamond
	static var checkmark_diamond: UIImage? {
		return UIImage(systemName: "checkmark.diamond")
	}

	/// checkmark.diamond.fill
	static var checkmark_diamond_fill: UIImage? {
		return UIImage(systemName: "checkmark.diamond.fill")
	}

	/// checkmark.shield
	static var checkmark_shield: UIImage? {
		return UIImage(systemName: "checkmark.shield")
	}

	/// checkmark.shield.fill
	static var checkmark_shield_fill: UIImage? {
		return UIImage(systemName: "checkmark.shield.fill")
	}

	/// chevron.left
	static var chevron_left: UIImage? {
		return UIImage(systemName: "chevron.left")
	}

	/// chevron.left.circle
	static var chevron_left_circle: UIImage? {
		return UIImage(systemName: "chevron.left.circle")
	}

	/// chevron.left.circle.fill
	static var chevron_left_circle_fill: UIImage? {
		return UIImage(systemName: "chevron.left.circle.fill")
	}

	/// chevron.left.square
	static var chevron_left_square: UIImage? {
		return UIImage(systemName: "chevron.left.square")
	}

	/// chevron.left.square.fill
	static var chevron_left_square_fill: UIImage? {
		return UIImage(systemName: "chevron.left.square.fill")
	}

	/// chevron.backward
	static var chevron_backward: UIImage? {
		return UIImage(systemName: "chevron.backward")
	}

	/// chevron.backward.circle
	static var chevron_backward_circle: UIImage? {
		return UIImage(systemName: "chevron.backward.circle")
	}

	/// chevron.backward.circle.fill
	static var chevron_backward_circle_fill: UIImage? {
		return UIImage(systemName: "chevron.backward.circle.fill")
	}

	/// chevron.backward.square
	static var chevron_backward_square: UIImage? {
		return UIImage(systemName: "chevron.backward.square")
	}

	/// chevron.backward.square.fill
	static var chevron_backward_square_fill: UIImage? {
		return UIImage(systemName: "chevron.backward.square.fill")
	}

	/// chevron.right
	static var chevron_right: UIImage? {
		return UIImage(systemName: "chevron.right")
	}

	/// chevron.right.circle
	static var chevron_right_circle: UIImage? {
		return UIImage(systemName: "chevron.right.circle")
	}

	/// chevron.right.circle.fill
	static var chevron_right_circle_fill: UIImage? {
		return UIImage(systemName: "chevron.right.circle.fill")
	}

	/// chevron.right.square
	static var chevron_right_square: UIImage? {
		return UIImage(systemName: "chevron.right.square")
	}

	/// chevron.right.square.fill
	static var chevron_right_square_fill: UIImage? {
		return UIImage(systemName: "chevron.right.square.fill")
	}

	/// chevron.forward
	static var chevron_forward: UIImage? {
		return UIImage(systemName: "chevron.forward")
	}

	/// chevron.forward.circle
	static var chevron_forward_circle: UIImage? {
		return UIImage(systemName: "chevron.forward.circle")
	}

	/// chevron.forward.circle.fill
	static var chevron_forward_circle_fill: UIImage? {
		return UIImage(systemName: "chevron.forward.circle.fill")
	}

	/// chevron.forward.square
	static var chevron_forward_square: UIImage? {
		return UIImage(systemName: "chevron.forward.square")
	}

	/// chevron.forward.square.fill
	static var chevron_forward_square_fill: UIImage? {
		return UIImage(systemName: "chevron.forward.square.fill")
	}

	/// chevron.left.2
	static var chevron_left_2: UIImage? {
		return UIImage(systemName: "chevron.left.2")
	}

	/// chevron.backward.2
	static var chevron_backward_2: UIImage? {
		return UIImage(systemName: "chevron.backward.2")
	}

	/// chevron.right.2
	static var chevron_right_2: UIImage? {
		return UIImage(systemName: "chevron.right.2")
	}

	/// chevron.forward.2
	static var chevron_forward_2: UIImage? {
		return UIImage(systemName: "chevron.forward.2")
	}

	/// chevron.up
	static var chevron_up: UIImage? {
		return UIImage(systemName: "chevron.up")
	}

	/// chevron.up.circle
	static var chevron_up_circle: UIImage? {
		return UIImage(systemName: "chevron.up.circle")
	}

	/// chevron.up.circle.fill
	static var chevron_up_circle_fill: UIImage? {
		return UIImage(systemName: "chevron.up.circle.fill")
	}

	/// chevron.up.square
	static var chevron_up_square: UIImage? {
		return UIImage(systemName: "chevron.up.square")
	}

	/// chevron.up.square.fill
	static var chevron_up_square_fill: UIImage? {
		return UIImage(systemName: "chevron.up.square.fill")
	}

	/// chevron.down
	static var chevron_down: UIImage? {
		return UIImage(systemName: "chevron.down")
	}

	/// chevron.down.circle
	static var chevron_down_circle: UIImage? {
		return UIImage(systemName: "chevron.down.circle")
	}

	/// chevron.down.circle.fill
	static var chevron_down_circle_fill: UIImage? {
		return UIImage(systemName: "chevron.down.circle.fill")
	}

	/// chevron.down.square
	static var chevron_down_square: UIImage? {
		return UIImage(systemName: "chevron.down.square")
	}

	/// chevron.down.square.fill
	static var chevron_down_square_fill: UIImage? {
		return UIImage(systemName: "chevron.down.square.fill")
	}

	/// control
	static var control: UIImage? {
		return UIImage(systemName: "control")
	}

	/// projective
	static var projective: UIImage? {
		return UIImage(systemName: "projective")
	}

	/// chevron.up.chevron.down
	static var chevron_up_chevron_down: UIImage? {
		return UIImage(systemName: "chevron.up.chevron.down")
	}

	/// chevron.compact.up
	static var chevron_compact_up: UIImage? {
		return UIImage(systemName: "chevron.compact.up")
	}

	/// chevron.compact.down
	static var chevron_compact_down: UIImage? {
		return UIImage(systemName: "chevron.compact.down")
	}

	/// chevron.compact.left
	static var chevron_compact_left: UIImage? {
		return UIImage(systemName: "chevron.compact.left")
	}

	/// chevron.compact.right
	static var chevron_compact_right: UIImage? {
		return UIImage(systemName: "chevron.compact.right")
	}

	/// arrow.left
	static var arrow_left: UIImage? {
		return UIImage(systemName: "arrow.left")
	}

	/// arrow.left.circle
	static var arrow_left_circle: UIImage? {
		return UIImage(systemName: "arrow.left.circle")
	}

	/// arrow.left.circle.fill
	static var arrow_left_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.left.circle.fill")
	}

	/// arrow.left.square
	static var arrow_left_square: UIImage? {
		return UIImage(systemName: "arrow.left.square")
	}

	/// arrow.left.square.fill
	static var arrow_left_square_fill: UIImage? {
		return UIImage(systemName: "arrow.left.square.fill")
	}

	/// arrow.backward
	static var arrow_backward: UIImage? {
		return UIImage(systemName: "arrow.backward")
	}

	/// arrow.backward.circle
	static var arrow_backward_circle: UIImage? {
		return UIImage(systemName: "arrow.backward.circle")
	}

	/// arrow.backward.circle.fill
	static var arrow_backward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.backward.circle.fill")
	}

	/// arrow.backward.square
	static var arrow_backward_square: UIImage? {
		return UIImage(systemName: "arrow.backward.square")
	}

	/// arrow.backward.square.fill
	static var arrow_backward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.backward.square.fill")
	}

	/// arrow.right
	static var arrow_right: UIImage? {
		return UIImage(systemName: "arrow.right")
	}

	/// arrow.right.circle
	static var arrow_right_circle: UIImage? {
		return UIImage(systemName: "arrow.right.circle")
	}

	/// arrow.right.circle.fill
	static var arrow_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.right.circle.fill")
	}

	/// arrow.right.square
	static var arrow_right_square: UIImage? {
		return UIImage(systemName: "arrow.right.square")
	}

	/// arrow.right.square.fill
	static var arrow_right_square_fill: UIImage? {
		return UIImage(systemName: "arrow.right.square.fill")
	}

	/// arrow.forward
	static var arrow_forward: UIImage? {
		return UIImage(systemName: "arrow.forward")
	}

	/// arrow.forward.circle
	static var arrow_forward_circle: UIImage? {
		return UIImage(systemName: "arrow.forward.circle")
	}

	/// arrow.forward.circle.fill
	static var arrow_forward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.forward.circle.fill")
	}

	/// arrow.forward.square
	static var arrow_forward_square: UIImage? {
		return UIImage(systemName: "arrow.forward.square")
	}

	/// arrow.forward.square.fill
	static var arrow_forward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.forward.square.fill")
	}

	/// arrow.up
	static var arrow_up: UIImage? {
		return UIImage(systemName: "arrow.up")
	}

	/// arrow.up.circle
	static var arrow_up_circle: UIImage? {
		return UIImage(systemName: "arrow.up.circle")
	}

	/// arrow.up.circle.fill
	static var arrow_up_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.circle.fill")
	}

	/// arrow.up.square
	static var arrow_up_square: UIImage? {
		return UIImage(systemName: "arrow.up.square")
	}

	/// arrow.up.square.fill
	static var arrow_up_square_fill: UIImage? {
		return UIImage(systemName: "arrow.up.square.fill")
	}

	/// arrow.down
	static var arrow_down: UIImage? {
		return UIImage(systemName: "arrow.down")
	}

	/// arrow.down.circle
	static var arrow_down_circle: UIImage? {
		return UIImage(systemName: "arrow.down.circle")
	}

	/// arrow.down.circle.fill
	static var arrow_down_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.circle.fill")
	}

	/// arrow.down.square
	static var arrow_down_square: UIImage? {
		return UIImage(systemName: "arrow.down.square")
	}

	/// arrow.down.square.fill
	static var arrow_down_square_fill: UIImage? {
		return UIImage(systemName: "arrow.down.square.fill")
	}

	/// arrow.up.left
	static var arrow_up_left: UIImage? {
		return UIImage(systemName: "arrow.up.left")
	}

	/// arrow.up.left.circle
	static var arrow_up_left_circle: UIImage? {
		return UIImage(systemName: "arrow.up.left.circle")
	}

	/// arrow.up.left.circle.fill
	static var arrow_up_left_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.left.circle.fill")
	}

	/// arrow.up.left.square
	static var arrow_up_left_square: UIImage? {
		return UIImage(systemName: "arrow.up.left.square")
	}

	/// arrow.up.left.square.fill
	static var arrow_up_left_square_fill: UIImage? {
		return UIImage(systemName: "arrow.up.left.square.fill")
	}

	/// arrow.up.backward
	static var arrow_up_backward: UIImage? {
		return UIImage(systemName: "arrow.up.backward")
	}

	/// arrow.up.backward.circle
	static var arrow_up_backward_circle: UIImage? {
		return UIImage(systemName: "arrow.up.backward.circle")
	}

	/// arrow.up.backward.circle.fill
	static var arrow_up_backward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.backward.circle.fill")
	}

	/// arrow.up.backward.square
	static var arrow_up_backward_square: UIImage? {
		return UIImage(systemName: "arrow.up.backward.square")
	}

	/// arrow.up.backward.square.fill
	static var arrow_up_backward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.up.backward.square.fill")
	}

	/// arrow.up.right
	static var arrow_up_right: UIImage? {
		return UIImage(systemName: "arrow.up.right")
	}

	/// arrow.up.right.circle
	static var arrow_up_right_circle: UIImage? {
		return UIImage(systemName: "arrow.up.right.circle")
	}

	/// arrow.up.right.circle.fill
	static var arrow_up_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.right.circle.fill")
	}

	/// arrow.up.right.square
	static var arrow_up_right_square: UIImage? {
		return UIImage(systemName: "arrow.up.right.square")
	}

	/// arrow.up.right.square.fill
	static var arrow_up_right_square_fill: UIImage? {
		return UIImage(systemName: "arrow.up.right.square.fill")
	}

	/// arrow.up.forward
	static var arrow_up_forward: UIImage? {
		return UIImage(systemName: "arrow.up.forward")
	}

	/// arrow.up.forward.circle
	static var arrow_up_forward_circle: UIImage? {
		return UIImage(systemName: "arrow.up.forward.circle")
	}

	/// arrow.up.forward.circle.fill
	static var arrow_up_forward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.forward.circle.fill")
	}

	/// arrow.up.forward.square
	static var arrow_up_forward_square: UIImage? {
		return UIImage(systemName: "arrow.up.forward.square")
	}

	/// arrow.up.forward.square.fill
	static var arrow_up_forward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.up.forward.square.fill")
	}

	/// arrow.down.left
	static var arrow_down_left: UIImage? {
		return UIImage(systemName: "arrow.down.left")
	}

	/// arrow.down.left.circle
	static var arrow_down_left_circle: UIImage? {
		return UIImage(systemName: "arrow.down.left.circle")
	}

	/// arrow.down.left.circle.fill
	static var arrow_down_left_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.left.circle.fill")
	}

	/// arrow.down.left.square
	static var arrow_down_left_square: UIImage? {
		return UIImage(systemName: "arrow.down.left.square")
	}

	/// arrow.down.left.square.fill
	static var arrow_down_left_square_fill: UIImage? {
		return UIImage(systemName: "arrow.down.left.square.fill")
	}

	/// arrow.down.backward
	static var arrow_down_backward: UIImage? {
		return UIImage(systemName: "arrow.down.backward")
	}

	/// arrow.down.backward.circle
	static var arrow_down_backward_circle: UIImage? {
		return UIImage(systemName: "arrow.down.backward.circle")
	}

	/// arrow.down.backward.circle.fill
	static var arrow_down_backward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.backward.circle.fill")
	}

	/// arrow.down.backward.square
	static var arrow_down_backward_square: UIImage? {
		return UIImage(systemName: "arrow.down.backward.square")
	}

	/// arrow.down.backward.square.fill
	static var arrow_down_backward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.down.backward.square.fill")
	}

	/// arrow.down.right
	static var arrow_down_right: UIImage? {
		return UIImage(systemName: "arrow.down.right")
	}

	/// arrow.down.right.circle
	static var arrow_down_right_circle: UIImage? {
		return UIImage(systemName: "arrow.down.right.circle")
	}

	/// arrow.down.right.circle.fill
	static var arrow_down_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.right.circle.fill")
	}

	/// arrow.down.right.square
	static var arrow_down_right_square: UIImage? {
		return UIImage(systemName: "arrow.down.right.square")
	}

	/// arrow.down.right.square.fill
	static var arrow_down_right_square_fill: UIImage? {
		return UIImage(systemName: "arrow.down.right.square.fill")
	}

	/// arrow.down.forward
	static var arrow_down_forward: UIImage? {
		return UIImage(systemName: "arrow.down.forward")
	}

	/// arrow.down.forward.circle
	static var arrow_down_forward_circle: UIImage? {
		return UIImage(systemName: "arrow.down.forward.circle")
	}

	/// arrow.down.forward.circle.fill
	static var arrow_down_forward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.forward.circle.fill")
	}

	/// arrow.down.forward.square
	static var arrow_down_forward_square: UIImage? {
		return UIImage(systemName: "arrow.down.forward.square")
	}

	/// arrow.down.forward.square.fill
	static var arrow_down_forward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.down.forward.square.fill")
	}

	/// arrow.left.arrow.right
	static var arrow_left_arrow_right: UIImage? {
		return UIImage(systemName: "arrow.left.arrow.right")
	}

	/// arrow.left.arrow.right.circle
	static var arrow_left_arrow_right_circle: UIImage? {
		return UIImage(systemName: "arrow.left.arrow.right.circle")
	}

	/// arrow.left.arrow.right.circle.fill
	static var arrow_left_arrow_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.left.arrow.right.circle.fill")
	}

	/// arrow.left.arrow.right.square
	static var arrow_left_arrow_right_square: UIImage? {
		return UIImage(systemName: "arrow.left.arrow.right.square")
	}

	/// arrow.left.arrow.right.square.fill
	static var arrow_left_arrow_right_square_fill: UIImage? {
		return UIImage(systemName: "arrow.left.arrow.right.square.fill")
	}

	/// arrow.up.arrow.down
	static var arrow_up_arrow_down: UIImage? {
		return UIImage(systemName: "arrow.up.arrow.down")
	}

	/// arrow.up.arrow.down.circle
	static var arrow_up_arrow_down_circle: UIImage? {
		return UIImage(systemName: "arrow.up.arrow.down.circle")
	}

	/// arrow.up.arrow.down.circle.fill
	static var arrow_up_arrow_down_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.arrow.down.circle.fill")
	}

	/// arrow.up.arrow.down.square
	static var arrow_up_arrow_down_square: UIImage? {
		return UIImage(systemName: "arrow.up.arrow.down.square")
	}

	/// arrow.up.arrow.down.square.fill
	static var arrow_up_arrow_down_square_fill: UIImage? {
		return UIImage(systemName: "arrow.up.arrow.down.square.fill")
	}

	/// arrow.turn.down.left
	static var arrow_turn_down_left: UIImage? {
		return UIImage(systemName: "arrow.turn.down.left")
	}

	/// arrow.turn.up.left
	static var arrow_turn_up_left: UIImage? {
		return UIImage(systemName: "arrow.turn.up.left")
	}

	/// arrow.turn.down.right
	static var arrow_turn_down_right: UIImage? {
		return UIImage(systemName: "arrow.turn.down.right")
	}

	/// arrow.turn.up.right
	static var arrow_turn_up_right: UIImage? {
		return UIImage(systemName: "arrow.turn.up.right")
	}

	/// arrow.turn.right.up
	static var arrow_turn_right_up: UIImage? {
		return UIImage(systemName: "arrow.turn.right.up")
	}

	/// arrow.turn.left.up
	static var arrow_turn_left_up: UIImage? {
		return UIImage(systemName: "arrow.turn.left.up")
	}

	/// arrow.turn.right.down
	static var arrow_turn_right_down: UIImage? {
		return UIImage(systemName: "arrow.turn.right.down")
	}

	/// arrow.turn.left.down
	static var arrow_turn_left_down: UIImage? {
		return UIImage(systemName: "arrow.turn.left.down")
	}

	/// arrow.uturn.left
	static var arrow_uturn_left: UIImage? {
		return UIImage(systemName: "arrow.uturn.left")
	}

	/// arrow.uturn.left.circle
	static var arrow_uturn_left_circle: UIImage? {
		return UIImage(systemName: "arrow.uturn.left.circle")
	}

	/// arrow.uturn.left.circle.fill
	static var arrow_uturn_left_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.left.circle.fill")
	}

	/// arrow.uturn.left.circle.badge.ellipsis
	static var arrow_uturn_left_circle_badge_ellipsis: UIImage? {
		return UIImage(systemName: "arrow.uturn.left.circle.badge.ellipsis")
	}

	/// arrow.uturn.left.square
	static var arrow_uturn_left_square: UIImage? {
		return UIImage(systemName: "arrow.uturn.left.square")
	}

	/// arrow.uturn.left.square.fill
	static var arrow_uturn_left_square_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.left.square.fill")
	}

	/// arrow.uturn.backward
	static var arrow_uturn_backward: UIImage? {
		return UIImage(systemName: "arrow.uturn.backward")
	}

	/// arrow.uturn.backward.circle
	static var arrow_uturn_backward_circle: UIImage? {
		return UIImage(systemName: "arrow.uturn.backward.circle")
	}

	/// arrow.uturn.backward.circle.fill
	static var arrow_uturn_backward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.backward.circle.fill")
	}

	/// arrow.uturn.backward.circle.badge.ellipsis
	static var arrow_uturn_backward_circle_badge_ellipsis: UIImage? {
		return UIImage(systemName: "arrow.uturn.backward.circle.badge.ellipsis")
	}

	/// arrow.uturn.backward.square
	static var arrow_uturn_backward_square: UIImage? {
		return UIImage(systemName: "arrow.uturn.backward.square")
	}

	/// arrow.uturn.backward.square.fill
	static var arrow_uturn_backward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.backward.square.fill")
	}

	/// arrow.uturn.right
	static var arrow_uturn_right: UIImage? {
		return UIImage(systemName: "arrow.uturn.right")
	}

	/// arrow.uturn.right.circle
	static var arrow_uturn_right_circle: UIImage? {
		return UIImage(systemName: "arrow.uturn.right.circle")
	}

	/// arrow.uturn.right.circle.fill
	static var arrow_uturn_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.right.circle.fill")
	}

	/// arrow.uturn.right.square
	static var arrow_uturn_right_square: UIImage? {
		return UIImage(systemName: "arrow.uturn.right.square")
	}

	/// arrow.uturn.right.square.fill
	static var arrow_uturn_right_square_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.right.square.fill")
	}

	/// arrow.uturn.forward
	static var arrow_uturn_forward: UIImage? {
		return UIImage(systemName: "arrow.uturn.forward")
	}

	/// arrow.uturn.forward.circle
	static var arrow_uturn_forward_circle: UIImage? {
		return UIImage(systemName: "arrow.uturn.forward.circle")
	}

	/// arrow.uturn.forward.circle.fill
	static var arrow_uturn_forward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.forward.circle.fill")
	}

	/// arrow.uturn.forward.square
	static var arrow_uturn_forward_square: UIImage? {
		return UIImage(systemName: "arrow.uturn.forward.square")
	}

	/// arrow.uturn.forward.square.fill
	static var arrow_uturn_forward_square_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.forward.square.fill")
	}

	/// arrow.uturn.up
	static var arrow_uturn_up: UIImage? {
		return UIImage(systemName: "arrow.uturn.up")
	}

	/// arrow.uturn.up.circle
	static var arrow_uturn_up_circle: UIImage? {
		return UIImage(systemName: "arrow.uturn.up.circle")
	}

	/// arrow.uturn.up.circle.fill
	static var arrow_uturn_up_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.up.circle.fill")
	}

	/// arrow.uturn.up.square
	static var arrow_uturn_up_square: UIImage? {
		return UIImage(systemName: "arrow.uturn.up.square")
	}

	/// arrow.uturn.up.square.fill
	static var arrow_uturn_up_square_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.up.square.fill")
	}

	/// arrow.uturn.down
	static var arrow_uturn_down: UIImage? {
		return UIImage(systemName: "arrow.uturn.down")
	}

	/// arrow.uturn.down.circle
	static var arrow_uturn_down_circle: UIImage? {
		return UIImage(systemName: "arrow.uturn.down.circle")
	}

	/// arrow.uturn.down.circle.fill
	static var arrow_uturn_down_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.down.circle.fill")
	}

	/// arrow.uturn.down.square
	static var arrow_uturn_down_square: UIImage? {
		return UIImage(systemName: "arrow.uturn.down.square")
	}

	/// arrow.uturn.down.square.fill
	static var arrow_uturn_down_square_fill: UIImage? {
		return UIImage(systemName: "arrow.uturn.down.square.fill")
	}

	/// arrow.up.and.down.and.arrow.left.and.right
	static var arrow_up_and_down_and_arrow_left_and_right: UIImage? {
		return UIImage(systemName: "arrow.up.and.down.and.arrow.left.and.right")
	}

	/// arrow.up.left.and.down.right.and.arrow.up.right.and.down.left
	static var arrow_up_left_and_down_right_and_arrow_up_right_and_down_left: UIImage? {
		return UIImage(systemName: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
	}

	/// arrow.left.and.right
	static var arrow_left_and_right: UIImage? {
		return UIImage(systemName: "arrow.left.and.right")
	}

	/// arrow.left.and.right.circle
	static var arrow_left_and_right_circle: UIImage? {
		return UIImage(systemName: "arrow.left.and.right.circle")
	}

	/// arrow.left.and.right.circle.fill
	static var arrow_left_and_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.left.and.right.circle.fill")
	}

	/// arrow.left.and.right.square
	static var arrow_left_and_right_square: UIImage? {
		return UIImage(systemName: "arrow.left.and.right.square")
	}

	/// arrow.left.and.right.square.fill
	static var arrow_left_and_right_square_fill: UIImage? {
		return UIImage(systemName: "arrow.left.and.right.square.fill")
	}

	/// arrow.up.and.down
	static var arrow_up_and_down: UIImage? {
		return UIImage(systemName: "arrow.up.and.down")
	}

	/// arrow.up.and.down.circle
	static var arrow_up_and_down_circle: UIImage? {
		return UIImage(systemName: "arrow.up.and.down.circle")
	}

	/// arrow.up.and.down.circle.fill
	static var arrow_up_and_down_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.and.down.circle.fill")
	}

	/// arrow.up.and.down.square
	static var arrow_up_and_down_square: UIImage? {
		return UIImage(systemName: "arrow.up.and.down.square")
	}

	/// arrow.up.and.down.square.fill
	static var arrow_up_and_down_square_fill: UIImage? {
		return UIImage(systemName: "arrow.up.and.down.square.fill")
	}

	/// arrow.up.to.line
	static var arrow_up_to_line: UIImage? {
		return UIImage(systemName: "arrow.up.to.line")
	}

	/// arrow.up.to.line.compact
	static var arrow_up_to_line_compact: UIImage? {
		return UIImage(systemName: "arrow.up.to.line.compact")
	}

	/// arrow.up.to.line.circle
	static var arrow_up_to_line_circle: UIImage? {
		return UIImage(systemName: "arrow.up.to.line.circle")
	}

	/// arrow.up.to.line.circle.fill
	static var arrow_up_to_line_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.to.line.circle.fill")
	}

	/// arrow.down.to.line
	static var arrow_down_to_line: UIImage? {
		return UIImage(systemName: "arrow.down.to.line")
	}

	/// arrow.down.to.line.compact
	static var arrow_down_to_line_compact: UIImage? {
		return UIImage(systemName: "arrow.down.to.line.compact")
	}

	/// arrow.down.to.line.circle
	static var arrow_down_to_line_circle: UIImage? {
		return UIImage(systemName: "arrow.down.to.line.circle")
	}

	/// arrow.down.to.line.circle.fill
	static var arrow_down_to_line_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.to.line.circle.fill")
	}

	/// arrow.left.to.line
	static var arrow_left_to_line: UIImage? {
		return UIImage(systemName: "arrow.left.to.line")
	}

	/// arrow.left.to.line.compact
	static var arrow_left_to_line_compact: UIImage? {
		return UIImage(systemName: "arrow.left.to.line.compact")
	}

	/// arrow.left.to.line.circle
	static var arrow_left_to_line_circle: UIImage? {
		return UIImage(systemName: "arrow.left.to.line.circle")
	}

	/// arrow.left.to.line.circle.fill
	static var arrow_left_to_line_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.left.to.line.circle.fill")
	}

	/// arrow.backward.to.line
	static var arrow_backward_to_line: UIImage? {
		return UIImage(systemName: "arrow.backward.to.line")
	}

	/// arrow.backward.to.line.circle
	static var arrow_backward_to_line_circle: UIImage? {
		return UIImage(systemName: "arrow.backward.to.line.circle")
	}

	/// arrow.backward.to.line.circle.fill
	static var arrow_backward_to_line_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.backward.to.line.circle.fill")
	}

	/// arrow.right.to.line
	static var arrow_right_to_line: UIImage? {
		return UIImage(systemName: "arrow.right.to.line")
	}

	/// arrow.right.to.line.compact
	static var arrow_right_to_line_compact: UIImage? {
		return UIImage(systemName: "arrow.right.to.line.compact")
	}

	/// arrow.right.to.line.circle
	static var arrow_right_to_line_circle: UIImage? {
		return UIImage(systemName: "arrow.right.to.line.circle")
	}

	/// arrow.right.to.line.circle.fill
	static var arrow_right_to_line_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.right.to.line.circle.fill")
	}

	/// arrow.forward.to.line
	static var arrow_forward_to_line: UIImage? {
		return UIImage(systemName: "arrow.forward.to.line")
	}

	/// arrow.forward.to.line.circle
	static var arrow_forward_to_line_circle: UIImage? {
		return UIImage(systemName: "arrow.forward.to.line.circle")
	}

	/// arrow.forward.to.line.circle.fill
	static var arrow_forward_to_line_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.forward.to.line.circle.fill")
	}

	/// arrow.clockwise
	static var arrow_clockwise: UIImage? {
		return UIImage(systemName: "arrow.clockwise")
	}

	/// arrow.clockwise.circle
	static var arrow_clockwise_circle: UIImage? {
		return UIImage(systemName: "arrow.clockwise.circle")
	}

	/// arrow.clockwise.circle.fill
	static var arrow_clockwise_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.clockwise.circle.fill")
	}

	/// arrow.counterclockwise
	static var arrow_counterclockwise: UIImage? {
		return UIImage(systemName: "arrow.counterclockwise")
	}

	/// arrow.counterclockwise.circle
	static var arrow_counterclockwise_circle: UIImage? {
		return UIImage(systemName: "arrow.counterclockwise.circle")
	}

	/// arrow.counterclockwise.circle.fill
	static var arrow_counterclockwise_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.counterclockwise.circle.fill")
	}

	/// arrow.up.left.and.arrow.down.right
	static var arrow_up_left_and_arrow_down_right: UIImage? {
		return UIImage(systemName: "arrow.up.left.and.arrow.down.right")
	}

	/// arrow.up.left.and.arrow.down.right.circle
	static var arrow_up_left_and_arrow_down_right_circle: UIImage? {
		return UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle")
	}

	/// arrow.up.left.and.arrow.down.right.circle.fill
	static var arrow_up_left_and_arrow_down_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.left.and.arrow.down.right.circle.fill")
	}

	/// arrow.up.backward.and.arrow.down.forward
	static var arrow_up_backward_and_arrow_down_forward: UIImage? {
		return UIImage(systemName: "arrow.up.backward.and.arrow.down.forward")
	}

	/// arrow.up.backward.and.arrow.down.forward.circle
	static var arrow_up_backward_and_arrow_down_forward_circle: UIImage? {
		return UIImage(systemName: "arrow.up.backward.and.arrow.down.forward.circle")
	}

	/// arrow.up.backward.and.arrow.down.forward.circle.fill
	static var arrow_up_backward_and_arrow_down_forward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.up.backward.and.arrow.down.forward.circle.fill")
	}

	/// arrow.down.right.and.arrow.up.left
	static var arrow_down_right_and_arrow_up_left: UIImage? {
		return UIImage(systemName: "arrow.down.right.and.arrow.up.left")
	}

	/// arrow.down.right.and.arrow.up.left.circle
	static var arrow_down_right_and_arrow_up_left_circle: UIImage? {
		return UIImage(systemName: "arrow.down.right.and.arrow.up.left.circle")
	}

	/// arrow.down.right.and.arrow.up.left.circle.fill
	static var arrow_down_right_and_arrow_up_left_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.right.and.arrow.up.left.circle.fill")
	}

	/// arrow.down.forward.and.arrow.up.backward
	static var arrow_down_forward_and_arrow_up_backward: UIImage? {
		return UIImage(systemName: "arrow.down.forward.and.arrow.up.backward")
	}

	/// arrow.down.forward.and.arrow.up.backward.circle
	static var arrow_down_forward_and_arrow_up_backward_circle: UIImage? {
		return UIImage(systemName: "arrow.down.forward.and.arrow.up.backward.circle")
	}

	/// arrow.down.forward.and.arrow.up.backward.circle.fill
	static var arrow_down_forward_and_arrow_up_backward_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.down.forward.and.arrow.up.backward.circle.fill")
	}

	/// return
	static var return_Image: UIImage? {
		return UIImage(systemName: "return")
	}

	/// return.left
	static var return_left: UIImage? {
		return UIImage(systemName: "return.left")
	}

	/// return.right
	static var return_right: UIImage? {
		return UIImage(systemName: "return.right")
	}

	/// arrow.2.squarepath
	static var arrow_2_squarepath: UIImage? {
		return UIImage(systemName: "arrow.2.squarepath")
	}

	/// arrow.triangle.2.circlepath
	static var arrow_triangle_2_circlepath: UIImage? {
		return UIImage(systemName: "arrow.triangle.2.circlepath")
	}

	/// arrow.triangle.2.circlepath.circle
	static var arrow_triangle_2_circlepath_circle: UIImage? {
		return UIImage(systemName: "arrow.triangle.2.circlepath.circle")
	}

	/// arrow.triangle.2.circlepath.circle.fill
	static var arrow_triangle_2_circlepath_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.triangle.2.circlepath.circle.fill")
	}

	/// exclamationmark.arrow.triangle.2.circlepath
	static var exclamationmark_arrow_triangle_2_circlepath: UIImage? {
		return UIImage(systemName: "exclamationmark.arrow.triangle.2.circlepath")
	}

	/// arrow.triangle.capsulepath
	static var arrow_triangle_capsulepath: UIImage? {
		return UIImage(systemName: "arrow.triangle.capsulepath")
	}

	/// arrow.3.trianglepath
	static var arrow_3_trianglepath: UIImage? {
		return UIImage(systemName: "arrow.3.trianglepath")
	}

	/// arrow.triangle.turn.up.right.diamond
	static var arrow_triangle_turn_up_right_diamond: UIImage? {
		return UIImage(systemName: "arrow.triangle.turn.up.right.diamond")
	}

	/// arrow.triangle.turn.up.right.diamond.fill
	static var arrow_triangle_turn_up_right_diamond_fill: UIImage? {
		return UIImage(systemName: "arrow.triangle.turn.up.right.diamond.fill")
	}

	/// arrow.triangle.turn.up.right.circle
	static var arrow_triangle_turn_up_right_circle: UIImage? {
		return UIImage(systemName: "arrow.triangle.turn.up.right.circle")
	}

	/// arrow.triangle.turn.up.right.circle.fill
	static var arrow_triangle_turn_up_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrow.triangle.turn.up.right.circle.fill")
	}

	/// arrow.triangle.merge
	static var arrow_triangle_merge: UIImage? {
		return UIImage(systemName: "arrow.triangle.merge")
	}

	/// arrow.triangle.swap
	static var arrow_triangle_swap: UIImage? {
		return UIImage(systemName: "arrow.triangle.swap")
	}

	/// arrow.triangle.branch
	static var arrow_triangle_branch: UIImage? {
		return UIImage(systemName: "arrow.triangle.branch")
	}

	/// arrow.triangle.pull
	static var arrow_triangle_pull: UIImage? {
		return UIImage(systemName: "arrow.triangle.pull")
	}

	/// arrowtriangle.left
	static var arrowtriangle_left: UIImage? {
		return UIImage(systemName: "arrowtriangle.left")
	}

	/// arrowtriangle.left.fill
	static var arrowtriangle_left_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.left.fill")
	}

	/// arrowtriangle.left.circle
	static var arrowtriangle_left_circle: UIImage? {
		return UIImage(systemName: "arrowtriangle.left.circle")
	}

	/// arrowtriangle.left.circle.fill
	static var arrowtriangle_left_circle_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.left.circle.fill")
	}

	/// arrowtriangle.left.square
	static var arrowtriangle_left_square: UIImage? {
		return UIImage(systemName: "arrowtriangle.left.square")
	}

	/// arrowtriangle.left.square.fill
	static var arrowtriangle_left_square_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.left.square.fill")
	}

	/// arrowtriangle.backward
	static var arrowtriangle_backward: UIImage? {
		return UIImage(systemName: "arrowtriangle.backward")
	}

	/// arrowtriangle.backward.fill
	static var arrowtriangle_backward_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.backward.fill")
	}

	/// arrowtriangle.backward.circle
	static var arrowtriangle_backward_circle: UIImage? {
		return UIImage(systemName: "arrowtriangle.backward.circle")
	}

	/// arrowtriangle.backward.circle.fill
	static var arrowtriangle_backward_circle_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.backward.circle.fill")
	}

	/// arrowtriangle.backward.square
	static var arrowtriangle_backward_square: UIImage? {
		return UIImage(systemName: "arrowtriangle.backward.square")
	}

	/// arrowtriangle.backward.square.fill
	static var arrowtriangle_backward_square_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.backward.square.fill")
	}

	/// arrowtriangle.right
	static var arrowtriangle_right: UIImage? {
		return UIImage(systemName: "arrowtriangle.right")
	}

	/// arrowtriangle.right.fill
	static var arrowtriangle_right_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.right.fill")
	}

	/// arrowtriangle.right.circle
	static var arrowtriangle_right_circle: UIImage? {
		return UIImage(systemName: "arrowtriangle.right.circle")
	}

	/// arrowtriangle.right.circle.fill
	static var arrowtriangle_right_circle_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.right.circle.fill")
	}

	/// arrowtriangle.right.square
	static var arrowtriangle_right_square: UIImage? {
		return UIImage(systemName: "arrowtriangle.right.square")
	}

	/// arrowtriangle.right.square.fill
	static var arrowtriangle_right_square_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.right.square.fill")
	}

	/// arrowtriangle.forward
	static var arrowtriangle_forward: UIImage? {
		return UIImage(systemName: "arrowtriangle.forward")
	}

	/// arrowtriangle.forward.fill
	static var arrowtriangle_forward_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.forward.fill")
	}

	/// arrowtriangle.forward.circle
	static var arrowtriangle_forward_circle: UIImage? {
		return UIImage(systemName: "arrowtriangle.forward.circle")
	}

	/// arrowtriangle.forward.circle.fill
	static var arrowtriangle_forward_circle_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.forward.circle.fill")
	}

	/// arrowtriangle.forward.square
	static var arrowtriangle_forward_square: UIImage? {
		return UIImage(systemName: "arrowtriangle.forward.square")
	}

	/// arrowtriangle.forward.square.fill
	static var arrowtriangle_forward_square_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.forward.square.fill")
	}

	/// arrowtriangle.up
	static var arrowtriangle_up: UIImage? {
		return UIImage(systemName: "arrowtriangle.up")
	}

	/// arrowtriangle.up.fill
	static var arrowtriangle_up_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.up.fill")
	}

	/// arrowtriangle.up.circle
	static var arrowtriangle_up_circle: UIImage? {
		return UIImage(systemName: "arrowtriangle.up.circle")
	}

	/// arrowtriangle.up.circle.fill
	static var arrowtriangle_up_circle_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.up.circle.fill")
	}

	/// arrowtriangle.up.square
	static var arrowtriangle_up_square: UIImage? {
		return UIImage(systemName: "arrowtriangle.up.square")
	}

	/// arrowtriangle.up.square.fill
	static var arrowtriangle_up_square_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.up.square.fill")
	}

	/// arrowtriangle.down
	static var arrowtriangle_down: UIImage? {
		return UIImage(systemName: "arrowtriangle.down")
	}

	/// arrowtriangle.down.fill
	static var arrowtriangle_down_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.down.fill")
	}

	/// arrowtriangle.down.circle
	static var arrowtriangle_down_circle: UIImage? {
		return UIImage(systemName: "arrowtriangle.down.circle")
	}

	/// arrowtriangle.down.circle.fill
	static var arrowtriangle_down_circle_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.down.circle.fill")
	}

	/// arrowtriangle.down.square
	static var arrowtriangle_down_square: UIImage? {
		return UIImage(systemName: "arrowtriangle.down.square")
	}

	/// arrowtriangle.down.square.fill
	static var arrowtriangle_down_square_fill: UIImage? {
		return UIImage(systemName: "arrowtriangle.down.square.fill")
	}

	/// slash.circle
	static var slash_circle: UIImage? {
		return UIImage(systemName: "slash.circle")
	}

	/// slash.circle.fill
	static var slash_circle_fill: UIImage? {
		return UIImage(systemName: "slash.circle.fill")
	}

	/// asterisk
	static var asterisk: UIImage? {
		return UIImage(systemName: "asterisk")
	}

	/// asterisk.circle
	static var asterisk_circle: UIImage? {
		return UIImage(systemName: "asterisk.circle")
	}

	/// asterisk.circle.fill
	static var asterisk_circle_fill: UIImage? {
		return UIImage(systemName: "asterisk.circle.fill")
	}

	/// a.circle
	static var a_circle: UIImage? {
		return UIImage(systemName: "a.circle")
	}

	/// a.circle.fill
	static var a_circle_fill: UIImage? {
		return UIImage(systemName: "a.circle.fill")
	}

	/// a.square
	static var a_square: UIImage? {
		return UIImage(systemName: "a.square")
	}

	/// a.square.fill
	static var a_square_fill: UIImage? {
		return UIImage(systemName: "a.square.fill")
	}

	/// b.circle
	static var b_circle: UIImage? {
		return UIImage(systemName: "b.circle")
	}

	/// b.circle.fill
	static var b_circle_fill: UIImage? {
		return UIImage(systemName: "b.circle.fill")
	}

	/// b.square
	static var b_square: UIImage? {
		return UIImage(systemName: "b.square")
	}

	/// b.square.fill
	static var b_square_fill: UIImage? {
		return UIImage(systemName: "b.square.fill")
	}

	/// c.circle
	static var c_circle: UIImage? {
		return UIImage(systemName: "c.circle")
	}

	/// c.circle.fill
	static var c_circle_fill: UIImage? {
		return UIImage(systemName: "c.circle.fill")
	}

	/// c.square
	static var c_square: UIImage? {
		return UIImage(systemName: "c.square")
	}

	/// c.square.fill
	static var c_square_fill: UIImage? {
		return UIImage(systemName: "c.square.fill")
	}

	/// d.circle
	static var d_circle: UIImage? {
		return UIImage(systemName: "d.circle")
	}

	/// d.circle.fill
	static var d_circle_fill: UIImage? {
		return UIImage(systemName: "d.circle.fill")
	}

	/// d.square
	static var d_square: UIImage? {
		return UIImage(systemName: "d.square")
	}

	/// d.square.fill
	static var d_square_fill: UIImage? {
		return UIImage(systemName: "d.square.fill")
	}

	/// e.circle
	static var e_circle: UIImage? {
		return UIImage(systemName: "e.circle")
	}

	/// e.circle.fill
	static var e_circle_fill: UIImage? {
		return UIImage(systemName: "e.circle.fill")
	}

	/// e.square
	static var e_square: UIImage? {
		return UIImage(systemName: "e.square")
	}

	/// e.square.fill
	static var e_square_fill: UIImage? {
		return UIImage(systemName: "e.square.fill")
	}

	/// f.circle
	static var f_circle: UIImage? {
		return UIImage(systemName: "f.circle")
	}

	/// f.circle.fill
	static var f_circle_fill: UIImage? {
		return UIImage(systemName: "f.circle.fill")
	}

	/// f.square
	static var f_square: UIImage? {
		return UIImage(systemName: "f.square")
	}

	/// f.square.fill
	static var f_square_fill: UIImage? {
		return UIImage(systemName: "f.square.fill")
	}

	/// g.circle
	static var g_circle: UIImage? {
		return UIImage(systemName: "g.circle")
	}

	/// g.circle.fill
	static var g_circle_fill: UIImage? {
		return UIImage(systemName: "g.circle.fill")
	}

	/// g.square
	static var g_square: UIImage? {
		return UIImage(systemName: "g.square")
	}

	/// g.square.fill
	static var g_square_fill: UIImage? {
		return UIImage(systemName: "g.square.fill")
	}

	/// h.circle
	static var h_circle: UIImage? {
		return UIImage(systemName: "h.circle")
	}

	/// h.circle.fill
	static var h_circle_fill: UIImage? {
		return UIImage(systemName: "h.circle.fill")
	}

	/// h.square
	static var h_square: UIImage? {
		return UIImage(systemName: "h.square")
	}

	/// h.square.fill
	static var h_square_fill: UIImage? {
		return UIImage(systemName: "h.square.fill")
	}

	/// i.circle
	static var i_circle: UIImage? {
		return UIImage(systemName: "i.circle")
	}

	/// i.circle.fill
	static var i_circle_fill: UIImage? {
		return UIImage(systemName: "i.circle.fill")
	}

	/// i.square
	static var i_square: UIImage? {
		return UIImage(systemName: "i.square")
	}

	/// i.square.fill
	static var i_square_fill: UIImage? {
		return UIImage(systemName: "i.square.fill")
	}

	/// j.circle
	static var j_circle: UIImage? {
		return UIImage(systemName: "j.circle")
	}

	/// j.circle.fill
	static var j_circle_fill: UIImage? {
		return UIImage(systemName: "j.circle.fill")
	}

	/// j.square
	static var j_square: UIImage? {
		return UIImage(systemName: "j.square")
	}

	/// j.square.fill
	static var j_square_fill: UIImage? {
		return UIImage(systemName: "j.square.fill")
	}

	/// k.circle
	static var k_circle: UIImage? {
		return UIImage(systemName: "k.circle")
	}

	/// k.circle.fill
	static var k_circle_fill: UIImage? {
		return UIImage(systemName: "k.circle.fill")
	}

	/// k.square
	static var k_square: UIImage? {
		return UIImage(systemName: "k.square")
	}

	/// k.square.fill
	static var k_square_fill: UIImage? {
		return UIImage(systemName: "k.square.fill")
	}

	/// l.circle
	static var l_circle: UIImage? {
		return UIImage(systemName: "l.circle")
	}

	/// l.circle.fill
	static var l_circle_fill: UIImage? {
		return UIImage(systemName: "l.circle.fill")
	}

	/// l.square
	static var l_square: UIImage? {
		return UIImage(systemName: "l.square")
	}

	/// l.square.fill
	static var l_square_fill: UIImage? {
		return UIImage(systemName: "l.square.fill")
	}

	/// m.circle
	static var m_circle: UIImage? {
		return UIImage(systemName: "m.circle")
	}

	/// m.circle.fill
	static var m_circle_fill: UIImage? {
		return UIImage(systemName: "m.circle.fill")
	}

	/// m.square
	static var m_square: UIImage? {
		return UIImage(systemName: "m.square")
	}

	/// m.square.fill
	static var m_square_fill: UIImage? {
		return UIImage(systemName: "m.square.fill")
	}

	/// n.circle
	static var n_circle: UIImage? {
		return UIImage(systemName: "n.circle")
	}

	/// n.circle.fill
	static var n_circle_fill: UIImage? {
		return UIImage(systemName: "n.circle.fill")
	}

	/// n.square
	static var n_square: UIImage? {
		return UIImage(systemName: "n.square")
	}

	/// n.square.fill
	static var n_square_fill: UIImage? {
		return UIImage(systemName: "n.square.fill")
	}

	/// o.circle
	static var o_circle: UIImage? {
		return UIImage(systemName: "o.circle")
	}

	/// o.circle.fill
	static var o_circle_fill: UIImage? {
		return UIImage(systemName: "o.circle.fill")
	}

	/// o.square
	static var o_square: UIImage? {
		return UIImage(systemName: "o.square")
	}

	/// o.square.fill
	static var o_square_fill: UIImage? {
		return UIImage(systemName: "o.square.fill")
	}

	/// p.circle
	static var p_circle: UIImage? {
		return UIImage(systemName: "p.circle")
	}

	/// p.circle.fill
	static var p_circle_fill: UIImage? {
		return UIImage(systemName: "p.circle.fill")
	}

	/// p.square
	static var p_square: UIImage? {
		return UIImage(systemName: "p.square")
	}

	/// p.square.fill
	static var p_square_fill: UIImage? {
		return UIImage(systemName: "p.square.fill")
	}

	/// q.circle
	static var q_circle: UIImage? {
		return UIImage(systemName: "q.circle")
	}

	/// q.circle.fill
	static var q_circle_fill: UIImage? {
		return UIImage(systemName: "q.circle.fill")
	}

	/// q.square
	static var q_square: UIImage? {
		return UIImage(systemName: "q.square")
	}

	/// q.square.fill
	static var q_square_fill: UIImage? {
		return UIImage(systemName: "q.square.fill")
	}

	/// r.circle
	static var r_circle: UIImage? {
		return UIImage(systemName: "r.circle")
	}

	/// r.circle.fill
	static var r_circle_fill: UIImage? {
		return UIImage(systemName: "r.circle.fill")
	}

	/// r.square
	static var r_square: UIImage? {
		return UIImage(systemName: "r.square")
	}

	/// r.square.fill
	static var r_square_fill: UIImage? {
		return UIImage(systemName: "r.square.fill")
	}

	/// s.circle
	static var s_circle: UIImage? {
		return UIImage(systemName: "s.circle")
	}

	/// s.circle.fill
	static var s_circle_fill: UIImage? {
		return UIImage(systemName: "s.circle.fill")
	}

	/// s.square
	static var s_square: UIImage? {
		return UIImage(systemName: "s.square")
	}

	/// s.square.fill
	static var s_square_fill: UIImage? {
		return UIImage(systemName: "s.square.fill")
	}

	/// t.circle
	static var t_circle: UIImage? {
		return UIImage(systemName: "t.circle")
	}

	/// t.circle.fill
	static var t_circle_fill: UIImage? {
		return UIImage(systemName: "t.circle.fill")
	}

	/// t.square
	static var t_square: UIImage? {
		return UIImage(systemName: "t.square")
	}

	/// t.square.fill
	static var t_square_fill: UIImage? {
		return UIImage(systemName: "t.square.fill")
	}

	/// u.circle
	static var u_circle: UIImage? {
		return UIImage(systemName: "u.circle")
	}

	/// u.circle.fill
	static var u_circle_fill: UIImage? {
		return UIImage(systemName: "u.circle.fill")
	}

	/// u.square
	static var u_square: UIImage? {
		return UIImage(systemName: "u.square")
	}

	/// u.square.fill
	static var u_square_fill: UIImage? {
		return UIImage(systemName: "u.square.fill")
	}

	/// v.circle
	static var v_circle: UIImage? {
		return UIImage(systemName: "v.circle")
	}

	/// v.circle.fill
	static var v_circle_fill: UIImage? {
		return UIImage(systemName: "v.circle.fill")
	}

	/// v.square
	static var v_square: UIImage? {
		return UIImage(systemName: "v.square")
	}

	/// v.square.fill
	static var v_square_fill: UIImage? {
		return UIImage(systemName: "v.square.fill")
	}

	/// w.circle
	static var w_circle: UIImage? {
		return UIImage(systemName: "w.circle")
	}

	/// w.circle.fill
	static var w_circle_fill: UIImage? {
		return UIImage(systemName: "w.circle.fill")
	}

	/// w.square
	static var w_square: UIImage? {
		return UIImage(systemName: "w.square")
	}

	/// w.square.fill
	static var w_square_fill: UIImage? {
		return UIImage(systemName: "w.square.fill")
	}

	/// x.circle
	static var x_circle: UIImage? {
		return UIImage(systemName: "x.circle")
	}

	/// x.circle.fill
	static var x_circle_fill: UIImage? {
		return UIImage(systemName: "x.circle.fill")
	}

	/// x.square
	static var x_square: UIImage? {
		return UIImage(systemName: "x.square")
	}

	/// x.square.fill
	static var x_square_fill: UIImage? {
		return UIImage(systemName: "x.square.fill")
	}

	/// y.circle
	static var y_circle: UIImage? {
		return UIImage(systemName: "y.circle")
	}

	/// y.circle.fill
	static var y_circle_fill: UIImage? {
		return UIImage(systemName: "y.circle.fill")
	}

	/// y.square
	static var y_square: UIImage? {
		return UIImage(systemName: "y.square")
	}

	/// y.square.fill
	static var y_square_fill: UIImage? {
		return UIImage(systemName: "y.square.fill")
	}

	/// z.circle
	static var z_circle: UIImage? {
		return UIImage(systemName: "z.circle")
	}

	/// z.circle.fill
	static var z_circle_fill: UIImage? {
		return UIImage(systemName: "z.circle.fill")
	}

	/// z.square
	static var z_square: UIImage? {
		return UIImage(systemName: "z.square")
	}

	/// z.square.fill
	static var z_square_fill: UIImage? {
		return UIImage(systemName: "z.square.fill")
	}

	/// dollarsign.circle
	static var dollarsign_circle: UIImage? {
		return UIImage(systemName: "dollarsign.circle")
	}

	/// dollarsign.circle.fill
	static var dollarsign_circle_fill: UIImage? {
		return UIImage(systemName: "dollarsign.circle.fill")
	}

	/// dollarsign.square
	static var dollarsign_square: UIImage? {
		return UIImage(systemName: "dollarsign.square")
	}

	/// dollarsign.square.fill
	static var dollarsign_square_fill: UIImage? {
		return UIImage(systemName: "dollarsign.square.fill")
	}

	/// centsign.circle
	static var centsign_circle: UIImage? {
		return UIImage(systemName: "centsign.circle")
	}

	/// centsign.circle.fill
	static var centsign_circle_fill: UIImage? {
		return UIImage(systemName: "centsign.circle.fill")
	}

	/// centsign.square
	static var centsign_square: UIImage? {
		return UIImage(systemName: "centsign.square")
	}

	/// centsign.square.fill
	static var centsign_square_fill: UIImage? {
		return UIImage(systemName: "centsign.square.fill")
	}

	/// yensign.circle
	static var yensign_circle: UIImage? {
		return UIImage(systemName: "yensign.circle")
	}

	/// yensign.circle.fill
	static var yensign_circle_fill: UIImage? {
		return UIImage(systemName: "yensign.circle.fill")
	}

	/// yensign.square
	static var yensign_square: UIImage? {
		return UIImage(systemName: "yensign.square")
	}

	/// yensign.square.fill
	static var yensign_square_fill: UIImage? {
		return UIImage(systemName: "yensign.square.fill")
	}

	/// sterlingsign.circle
	static var sterlingsign_circle: UIImage? {
		return UIImage(systemName: "sterlingsign.circle")
	}

	/// sterlingsign.circle.fill
	static var sterlingsign_circle_fill: UIImage? {
		return UIImage(systemName: "sterlingsign.circle.fill")
	}

	/// sterlingsign.square
	static var sterlingsign_square: UIImage? {
		return UIImage(systemName: "sterlingsign.square")
	}

	/// sterlingsign.square.fill
	static var sterlingsign_square_fill: UIImage? {
		return UIImage(systemName: "sterlingsign.square.fill")
	}

	/// francsign.circle
	static var francsign_circle: UIImage? {
		return UIImage(systemName: "francsign.circle")
	}

	/// francsign.circle.fill
	static var francsign_circle_fill: UIImage? {
		return UIImage(systemName: "francsign.circle.fill")
	}

	/// francsign.square
	static var francsign_square: UIImage? {
		return UIImage(systemName: "francsign.square")
	}

	/// francsign.square.fill
	static var francsign_square_fill: UIImage? {
		return UIImage(systemName: "francsign.square.fill")
	}

	/// florinsign.circle
	static var florinsign_circle: UIImage? {
		return UIImage(systemName: "florinsign.circle")
	}

	/// florinsign.circle.fill
	static var florinsign_circle_fill: UIImage? {
		return UIImage(systemName: "florinsign.circle.fill")
	}

	/// florinsign.square
	static var florinsign_square: UIImage? {
		return UIImage(systemName: "florinsign.square")
	}

	/// florinsign.square.fill
	static var florinsign_square_fill: UIImage? {
		return UIImage(systemName: "florinsign.square.fill")
	}

	/// turkishlirasign.circle
	static var turkishlirasign_circle: UIImage? {
		return UIImage(systemName: "turkishlirasign.circle")
	}

	/// turkishlirasign.circle.fill
	static var turkishlirasign_circle_fill: UIImage? {
		return UIImage(systemName: "turkishlirasign.circle.fill")
	}

	/// turkishlirasign.square
	static var turkishlirasign_square: UIImage? {
		return UIImage(systemName: "turkishlirasign.square")
	}

	/// turkishlirasign.square.fill
	static var turkishlirasign_square_fill: UIImage? {
		return UIImage(systemName: "turkishlirasign.square.fill")
	}

	/// rublesign.circle
	static var rublesign_circle: UIImage? {
		return UIImage(systemName: "rublesign.circle")
	}

	/// rublesign.circle.fill
	static var rublesign_circle_fill: UIImage? {
		return UIImage(systemName: "rublesign.circle.fill")
	}

	/// rublesign.square
	static var rublesign_square: UIImage? {
		return UIImage(systemName: "rublesign.square")
	}

	/// rublesign.square.fill
	static var rublesign_square_fill: UIImage? {
		return UIImage(systemName: "rublesign.square.fill")
	}

	/// eurosign.circle
	static var eurosign_circle: UIImage? {
		return UIImage(systemName: "eurosign.circle")
	}

	/// eurosign.circle.fill
	static var eurosign_circle_fill: UIImage? {
		return UIImage(systemName: "eurosign.circle.fill")
	}

	/// eurosign.square
	static var eurosign_square: UIImage? {
		return UIImage(systemName: "eurosign.square")
	}

	/// eurosign.square.fill
	static var eurosign_square_fill: UIImage? {
		return UIImage(systemName: "eurosign.square.fill")
	}

	/// dongsign.circle
	static var dongsign_circle: UIImage? {
		return UIImage(systemName: "dongsign.circle")
	}

	/// dongsign.circle.fill
	static var dongsign_circle_fill: UIImage? {
		return UIImage(systemName: "dongsign.circle.fill")
	}

	/// dongsign.square
	static var dongsign_square: UIImage? {
		return UIImage(systemName: "dongsign.square")
	}

	/// dongsign.square.fill
	static var dongsign_square_fill: UIImage? {
		return UIImage(systemName: "dongsign.square.fill")
	}

	/// indianrupeesign.circle
	static var indianrupeesign_circle: UIImage? {
		return UIImage(systemName: "indianrupeesign.circle")
	}

	/// indianrupeesign.circle.fill
	static var indianrupeesign_circle_fill: UIImage? {
		return UIImage(systemName: "indianrupeesign.circle.fill")
	}

	/// indianrupeesign.square
	static var indianrupeesign_square: UIImage? {
		return UIImage(systemName: "indianrupeesign.square")
	}

	/// indianrupeesign.square.fill
	static var indianrupeesign_square_fill: UIImage? {
		return UIImage(systemName: "indianrupeesign.square.fill")
	}

	/// tengesign.circle
	static var tengesign_circle: UIImage? {
		return UIImage(systemName: "tengesign.circle")
	}

	/// tengesign.circle.fill
	static var tengesign_circle_fill: UIImage? {
		return UIImage(systemName: "tengesign.circle.fill")
	}

	/// tengesign.square
	static var tengesign_square: UIImage? {
		return UIImage(systemName: "tengesign.square")
	}

	/// tengesign.square.fill
	static var tengesign_square_fill: UIImage? {
		return UIImage(systemName: "tengesign.square.fill")
	}

	/// pesetasign.circle
	static var pesetasign_circle: UIImage? {
		return UIImage(systemName: "pesetasign.circle")
	}

	/// pesetasign.circle.fill
	static var pesetasign_circle_fill: UIImage? {
		return UIImage(systemName: "pesetasign.circle.fill")
	}

	/// pesetasign.square
	static var pesetasign_square: UIImage? {
		return UIImage(systemName: "pesetasign.square")
	}

	/// pesetasign.square.fill
	static var pesetasign_square_fill: UIImage? {
		return UIImage(systemName: "pesetasign.square.fill")
	}

	/// pesosign.circle
	static var pesosign_circle: UIImage? {
		return UIImage(systemName: "pesosign.circle")
	}

	/// pesosign.circle.fill
	static var pesosign_circle_fill: UIImage? {
		return UIImage(systemName: "pesosign.circle.fill")
	}

	/// pesosign.square
	static var pesosign_square: UIImage? {
		return UIImage(systemName: "pesosign.square")
	}

	/// pesosign.square.fill
	static var pesosign_square_fill: UIImage? {
		return UIImage(systemName: "pesosign.square.fill")
	}

	/// kipsign.circle
	static var kipsign_circle: UIImage? {
		return UIImage(systemName: "kipsign.circle")
	}

	/// kipsign.circle.fill
	static var kipsign_circle_fill: UIImage? {
		return UIImage(systemName: "kipsign.circle.fill")
	}

	/// kipsign.square
	static var kipsign_square: UIImage? {
		return UIImage(systemName: "kipsign.square")
	}

	/// kipsign.square.fill
	static var kipsign_square_fill: UIImage? {
		return UIImage(systemName: "kipsign.square.fill")
	}

	/// wonsign.circle
	static var wonsign_circle: UIImage? {
		return UIImage(systemName: "wonsign.circle")
	}

	/// wonsign.circle.fill
	static var wonsign_circle_fill: UIImage? {
		return UIImage(systemName: "wonsign.circle.fill")
	}

	/// wonsign.square
	static var wonsign_square: UIImage? {
		return UIImage(systemName: "wonsign.square")
	}

	/// wonsign.square.fill
	static var wonsign_square_fill: UIImage? {
		return UIImage(systemName: "wonsign.square.fill")
	}

	/// lirasign.circle
	static var lirasign_circle: UIImage? {
		return UIImage(systemName: "lirasign.circle")
	}

	/// lirasign.circle.fill
	static var lirasign_circle_fill: UIImage? {
		return UIImage(systemName: "lirasign.circle.fill")
	}

	/// lirasign.square
	static var lirasign_square: UIImage? {
		return UIImage(systemName: "lirasign.square")
	}

	/// lirasign.square.fill
	static var lirasign_square_fill: UIImage? {
		return UIImage(systemName: "lirasign.square.fill")
	}

	/// australsign.circle
	static var australsign_circle: UIImage? {
		return UIImage(systemName: "australsign.circle")
	}

	/// australsign.circle.fill
	static var australsign_circle_fill: UIImage? {
		return UIImage(systemName: "australsign.circle.fill")
	}

	/// australsign.square
	static var australsign_square: UIImage? {
		return UIImage(systemName: "australsign.square")
	}

	/// australsign.square.fill
	static var australsign_square_fill: UIImage? {
		return UIImage(systemName: "australsign.square.fill")
	}

	/// hryvniasign.circle
	static var hryvniasign_circle: UIImage? {
		return UIImage(systemName: "hryvniasign.circle")
	}

	/// hryvniasign.circle.fill
	static var hryvniasign_circle_fill: UIImage? {
		return UIImage(systemName: "hryvniasign.circle.fill")
	}

	/// hryvniasign.square
	static var hryvniasign_square: UIImage? {
		return UIImage(systemName: "hryvniasign.square")
	}

	/// hryvniasign.square.fill
	static var hryvniasign_square_fill: UIImage? {
		return UIImage(systemName: "hryvniasign.square.fill")
	}

	/// nairasign.circle
	static var nairasign_circle: UIImage? {
		return UIImage(systemName: "nairasign.circle")
	}

	/// nairasign.circle.fill
	static var nairasign_circle_fill: UIImage? {
		return UIImage(systemName: "nairasign.circle.fill")
	}

	/// nairasign.square
	static var nairasign_square: UIImage? {
		return UIImage(systemName: "nairasign.square")
	}

	/// nairasign.square.fill
	static var nairasign_square_fill: UIImage? {
		return UIImage(systemName: "nairasign.square.fill")
	}

	/// guaranisign.circle
	static var guaranisign_circle: UIImage? {
		return UIImage(systemName: "guaranisign.circle")
	}

	/// guaranisign.circle.fill
	static var guaranisign_circle_fill: UIImage? {
		return UIImage(systemName: "guaranisign.circle.fill")
	}

	/// guaranisign.square
	static var guaranisign_square: UIImage? {
		return UIImage(systemName: "guaranisign.square")
	}

	/// guaranisign.square.fill
	static var guaranisign_square_fill: UIImage? {
		return UIImage(systemName: "guaranisign.square.fill")
	}

	/// coloncurrencysign.circle
	static var coloncurrencysign_circle: UIImage? {
		return UIImage(systemName: "coloncurrencysign.circle")
	}

	/// coloncurrencysign.circle.fill
	static var coloncurrencysign_circle_fill: UIImage? {
		return UIImage(systemName: "coloncurrencysign.circle.fill")
	}

	/// coloncurrencysign.square
	static var coloncurrencysign_square: UIImage? {
		return UIImage(systemName: "coloncurrencysign.square")
	}

	/// coloncurrencysign.square.fill
	static var coloncurrencysign_square_fill: UIImage? {
		return UIImage(systemName: "coloncurrencysign.square.fill")
	}

	/// cedisign.circle
	static var cedisign_circle: UIImage? {
		return UIImage(systemName: "cedisign.circle")
	}

	/// cedisign.circle.fill
	static var cedisign_circle_fill: UIImage? {
		return UIImage(systemName: "cedisign.circle.fill")
	}

	/// cedisign.square
	static var cedisign_square: UIImage? {
		return UIImage(systemName: "cedisign.square")
	}

	/// cedisign.square.fill
	static var cedisign_square_fill: UIImage? {
		return UIImage(systemName: "cedisign.square.fill")
	}

	/// cruzeirosign.circle
	static var cruzeirosign_circle: UIImage? {
		return UIImage(systemName: "cruzeirosign.circle")
	}

	/// cruzeirosign.circle.fill
	static var cruzeirosign_circle_fill: UIImage? {
		return UIImage(systemName: "cruzeirosign.circle.fill")
	}

	/// cruzeirosign.square
	static var cruzeirosign_square: UIImage? {
		return UIImage(systemName: "cruzeirosign.square")
	}

	/// cruzeirosign.square.fill
	static var cruzeirosign_square_fill: UIImage? {
		return UIImage(systemName: "cruzeirosign.square.fill")
	}

	/// tugriksign.circle
	static var tugriksign_circle: UIImage? {
		return UIImage(systemName: "tugriksign.circle")
	}

	/// tugriksign.circle.fill
	static var tugriksign_circle_fill: UIImage? {
		return UIImage(systemName: "tugriksign.circle.fill")
	}

	/// tugriksign.square
	static var tugriksign_square: UIImage? {
		return UIImage(systemName: "tugriksign.square")
	}

	/// tugriksign.square.fill
	static var tugriksign_square_fill: UIImage? {
		return UIImage(systemName: "tugriksign.square.fill")
	}

	/// millsign.circle
	static var millsign_circle: UIImage? {
		return UIImage(systemName: "millsign.circle")
	}

	/// millsign.circle.fill
	static var millsign_circle_fill: UIImage? {
		return UIImage(systemName: "millsign.circle.fill")
	}

	/// millsign.square
	static var millsign_square: UIImage? {
		return UIImage(systemName: "millsign.square")
	}

	/// millsign.square.fill
	static var millsign_square_fill: UIImage? {
		return UIImage(systemName: "millsign.square.fill")
	}

	/// shekelsign.circle
	static var shekelsign_circle: UIImage? {
		return UIImage(systemName: "shekelsign.circle")
	}

	/// shekelsign.circle.fill
	static var shekelsign_circle_fill: UIImage? {
		return UIImage(systemName: "shekelsign.circle.fill")
	}

	/// shekelsign.square
	static var shekelsign_square: UIImage? {
		return UIImage(systemName: "shekelsign.square")
	}

	/// shekelsign.square.fill
	static var shekelsign_square_fill: UIImage? {
		return UIImage(systemName: "shekelsign.square.fill")
	}

	/// manatsign.circle
	static var manatsign_circle: UIImage? {
		return UIImage(systemName: "manatsign.circle")
	}

	/// manatsign.circle.fill
	static var manatsign_circle_fill: UIImage? {
		return UIImage(systemName: "manatsign.circle.fill")
	}

	/// manatsign.square
	static var manatsign_square: UIImage? {
		return UIImage(systemName: "manatsign.square")
	}

	/// manatsign.square.fill
	static var manatsign_square_fill: UIImage? {
		return UIImage(systemName: "manatsign.square.fill")
	}

	/// rupeesign.circle
	static var rupeesign_circle: UIImage? {
		return UIImage(systemName: "rupeesign.circle")
	}

	/// rupeesign.circle.fill
	static var rupeesign_circle_fill: UIImage? {
		return UIImage(systemName: "rupeesign.circle.fill")
	}

	/// rupeesign.square
	static var rupeesign_square: UIImage? {
		return UIImage(systemName: "rupeesign.square")
	}

	/// rupeesign.square.fill
	static var rupeesign_square_fill: UIImage? {
		return UIImage(systemName: "rupeesign.square.fill")
	}

	/// bahtsign.circle
	static var bahtsign_circle: UIImage? {
		return UIImage(systemName: "bahtsign.circle")
	}

	/// bahtsign.circle.fill
	static var bahtsign_circle_fill: UIImage? {
		return UIImage(systemName: "bahtsign.circle.fill")
	}

	/// bahtsign.square
	static var bahtsign_square: UIImage? {
		return UIImage(systemName: "bahtsign.square")
	}

	/// bahtsign.square.fill
	static var bahtsign_square_fill: UIImage? {
		return UIImage(systemName: "bahtsign.square.fill")
	}

	/// larisign.circle
	static var larisign_circle: UIImage? {
		return UIImage(systemName: "larisign.circle")
	}

	/// larisign.circle.fill
	static var larisign_circle_fill: UIImage? {
		return UIImage(systemName: "larisign.circle.fill")
	}

	/// larisign.square
	static var larisign_square: UIImage? {
		return UIImage(systemName: "larisign.square")
	}

	/// larisign.square.fill
	static var larisign_square_fill: UIImage? {
		return UIImage(systemName: "larisign.square.fill")
	}

	/// bitcoinsign.circle
	static var bitcoinsign_circle: UIImage? {
		return UIImage(systemName: "bitcoinsign.circle")
	}

	/// bitcoinsign.circle.fill
	static var bitcoinsign_circle_fill: UIImage? {
		return UIImage(systemName: "bitcoinsign.circle.fill")
	}

	/// bitcoinsign.square
	static var bitcoinsign_square: UIImage? {
		return UIImage(systemName: "bitcoinsign.square")
	}

	/// bitcoinsign.square.fill
	static var bitcoinsign_square_fill: UIImage? {
		return UIImage(systemName: "bitcoinsign.square.fill")
	}

	/// brazilianrealsign.circle
	static var brazilianrealsign_circle: UIImage? {
		return UIImage(systemName: "brazilianrealsign.circle")
	}

	/// brazilianrealsign.circle.fill
	static var brazilianrealsign_circle_fill: UIImage? {
		return UIImage(systemName: "brazilianrealsign.circle.fill")
	}

	/// brazilianrealsign.square
	static var brazilianrealsign_square: UIImage? {
		return UIImage(systemName: "brazilianrealsign.square")
	}

	/// brazilianrealsign.square.fill
	static var brazilianrealsign_square_fill: UIImage? {
		return UIImage(systemName: "brazilianrealsign.square.fill")
	}

	/// 0.circle
	static var circle_0: UIImage? {
		return UIImage(systemName: "0.circle")
	}

	/// 0.circle.fill
	static var circle_fill_0: UIImage? {
		return UIImage(systemName: "0.circle.fill")
	}

	/// 0.square
	static var square_0: UIImage? {
		return UIImage(systemName: "0.square")
	}

	/// 0.square.fill
	static var square_fill_0: UIImage? {
		return UIImage(systemName: "0.square.fill")
	}

	/// 1.circle
	static var circle_1: UIImage? {
		return UIImage(systemName: "1.circle")
	}

	/// 1.circle.fill
	static var circle_fill_1: UIImage? {
		return UIImage(systemName: "1.circle.fill")
	}

	/// 1.square
	static var square_1: UIImage? {
		return UIImage(systemName: "1.square")
	}

	/// 1.square.fill
	static var square_fill_1: UIImage? {
		return UIImage(systemName: "1.square.fill")
	}

	/// 2.circle
	static var circle_2: UIImage? {
		return UIImage(systemName: "2.circle")
	}

	/// 2.circle.fill
	static var circle_fill_2: UIImage? {
		return UIImage(systemName: "2.circle.fill")
	}

	/// 2.square
	static var square_2: UIImage? {
		return UIImage(systemName: "2.square")
	}

	/// 2.square.fill
	static var square_fill_2: UIImage? {
		return UIImage(systemName: "2.square.fill")
	}

	/// 3.circle
	static var circle_3: UIImage? {
		return UIImage(systemName: "3.circle")
	}

	/// 3.circle.fill
	static var circle_fill_3: UIImage? {
		return UIImage(systemName: "3.circle.fill")
	}

	/// 3.square
	static var square_3: UIImage? {
		return UIImage(systemName: "3.square")
	}

	/// 3.square.fill
	static var square_fill_3: UIImage? {
		return UIImage(systemName: "3.square.fill")
	}

	/// 4.circle
	static var circle_4: UIImage? {
		return UIImage(systemName: "4.circle")
	}

	/// 4.circle.fill
	static var circle_fill_4: UIImage? {
		return UIImage(systemName: "4.circle.fill")
	}

	/// 4.square
	static var square_4: UIImage? {
		return UIImage(systemName: "4.square")
	}

	/// 4.square.fill
	static var square_fill_4: UIImage? {
		return UIImage(systemName: "4.square.fill")
	}

	/// 4.alt.circle
	static var alt_circle_4: UIImage? {
		return UIImage(systemName: "4.alt.circle")
	}

	/// 4.alt.circle.fill
	static var alt_circle_fill_4: UIImage? {
		return UIImage(systemName: "4.alt.circle.fill")
	}

	/// 4.alt.square
	static var alt_square_4: UIImage? {
		return UIImage(systemName: "4.alt.square")
	}

	/// 4.alt.square.fill
	static var alt_square_fill_4: UIImage? {
		return UIImage(systemName: "4.alt.square.fill")
	}

	/// 5.circle
	static var circle_5: UIImage? {
		return UIImage(systemName: "5.circle")
	}

	/// 5.circle.fill
	static var circle_fill_5: UIImage? {
		return UIImage(systemName: "5.circle.fill")
	}

	/// 5.square
	static var square_5: UIImage? {
		return UIImage(systemName: "5.square")
	}

	/// 5.square.fill
	static var square_fill_5: UIImage? {
		return UIImage(systemName: "5.square.fill")
	}

	/// 6.circle
	static var circle_6: UIImage? {
		return UIImage(systemName: "6.circle")
	}

	/// 6.circle.fill
	static var circle_fill_6: UIImage? {
		return UIImage(systemName: "6.circle.fill")
	}

	/// 6.square
	static var square_6: UIImage? {
		return UIImage(systemName: "6.square")
	}

	/// 6.square.fill
	static var square_fill_6: UIImage? {
		return UIImage(systemName: "6.square.fill")
	}

	/// 6.alt.circle
	static var alt_circle_6: UIImage? {
		return UIImage(systemName: "6.alt.circle")
	}

	/// 6.alt.circle.fill
	static var alt_circle_fill_6: UIImage? {
		return UIImage(systemName: "6.alt.circle.fill")
	}

	/// 6.alt.square
	static var alt_square_6: UIImage? {
		return UIImage(systemName: "6.alt.square")
	}

	/// 6.alt.square.fill
	static var alt_square_fill_6: UIImage? {
		return UIImage(systemName: "6.alt.square.fill")
	}

	/// 7.circle
	static var circle_7: UIImage? {
		return UIImage(systemName: "7.circle")
	}

	/// 7.circle.fill
	static var circle_fill_7: UIImage? {
		return UIImage(systemName: "7.circle.fill")
	}

	/// 7.square
	static var square_7: UIImage? {
		return UIImage(systemName: "7.square")
	}

	/// 7.square.fill
	static var square_fill_7: UIImage? {
		return UIImage(systemName: "7.square.fill")
	}

	/// 8.circle
	static var circle_8: UIImage? {
		return UIImage(systemName: "8.circle")
	}

	/// 8.circle.fill
	static var circle_fill_8: UIImage? {
		return UIImage(systemName: "8.circle.fill")
	}

	/// 8.square
	static var square_8: UIImage? {
		return UIImage(systemName: "8.square")
	}

	/// 8.square.fill
	static var square_fill_8: UIImage? {
		return UIImage(systemName: "8.square.fill")
	}

	/// 9.circle
	static var circle_9: UIImage? {
		return UIImage(systemName: "9.circle")
	}

	/// 9.circle.fill
	static var circle_fill_9: UIImage? {
		return UIImage(systemName: "9.circle.fill")
	}

	/// 9.square
	static var square_9: UIImage? {
		return UIImage(systemName: "9.square")
	}

	/// 9.square.fill
	static var square_fill_9: UIImage? {
		return UIImage(systemName: "9.square.fill")
	}

	/// 9.alt.circle
	static var alt_circle_9: UIImage? {
		return UIImage(systemName: "9.alt.circle")
	}

	/// 9.alt.circle.fill
	static var alt_circle_fill_9: UIImage? {
		return UIImage(systemName: "9.alt.circle.fill")
	}

	/// 9.alt.square
	static var alt_square_9: UIImage? {
		return UIImage(systemName: "9.alt.square")
	}

	/// 9.alt.square.fill
	static var alt_square_fill_9: UIImage? {
		return UIImage(systemName: "9.alt.square.fill")
	}

	/// 00.circle
	static var circle_00: UIImage? {
		return UIImage(systemName: "00.circle")
	}

	/// 00.circle.fill
	static var circle_fill_00: UIImage? {
		return UIImage(systemName: "00.circle.fill")
	}

	/// 00.square
	static var square_00: UIImage? {
		return UIImage(systemName: "00.square")
	}

	/// 00.square.fill
	static var square_fill_00: UIImage? {
		return UIImage(systemName: "00.square.fill")
	}

	/// 01.circle
	static var circle_01: UIImage? {
		return UIImage(systemName: "01.circle")
	}

	/// 01.circle.fill
	static var circle_fill_01: UIImage? {
		return UIImage(systemName: "01.circle.fill")
	}

	/// 01.square
	static var square_01: UIImage? {
		return UIImage(systemName: "01.square")
	}

	/// 01.square.fill
	static var square_fill_01: UIImage? {
		return UIImage(systemName: "01.square.fill")
	}

	/// 02.circle
	static var circle_02: UIImage? {
		return UIImage(systemName: "02.circle")
	}

	/// 02.circle.fill
	static var circle_fill_02: UIImage? {
		return UIImage(systemName: "02.circle.fill")
	}

	/// 02.square
	static var square_02: UIImage? {
		return UIImage(systemName: "02.square")
	}

	/// 02.square.fill
	static var square_fill_02: UIImage? {
		return UIImage(systemName: "02.square.fill")
	}

	/// 03.circle
	static var circle_03: UIImage? {
		return UIImage(systemName: "03.circle")
	}

	/// 03.circle.fill
	static var circle_fill_03: UIImage? {
		return UIImage(systemName: "03.circle.fill")
	}

	/// 03.square
	static var square_03: UIImage? {
		return UIImage(systemName: "03.square")
	}

	/// 03.square.fill
	static var square_fill_03: UIImage? {
		return UIImage(systemName: "03.square.fill")
	}

	/// 04.circle
	static var circle_04: UIImage? {
		return UIImage(systemName: "04.circle")
	}

	/// 04.circle.fill
	static var circle_fill_04: UIImage? {
		return UIImage(systemName: "04.circle.fill")
	}

	/// 04.square
	static var square_04: UIImage? {
		return UIImage(systemName: "04.square")
	}

	/// 04.square.fill
	static var square_fill_04: UIImage? {
		return UIImage(systemName: "04.square.fill")
	}

	/// 05.circle
	static var circle_05: UIImage? {
		return UIImage(systemName: "05.circle")
	}

	/// 05.circle.fill
	static var circle_fill_05: UIImage? {
		return UIImage(systemName: "05.circle.fill")
	}

	/// 05.square
	static var square_05: UIImage? {
		return UIImage(systemName: "05.square")
	}

	/// 05.square.fill
	static var square_fill_05: UIImage? {
		return UIImage(systemName: "05.square.fill")
	}

	/// 06.circle
	static var circle_06: UIImage? {
		return UIImage(systemName: "06.circle")
	}

	/// 06.circle.fill
	static var circle_fill_06: UIImage? {
		return UIImage(systemName: "06.circle.fill")
	}

	/// 06.square
	static var square_06: UIImage? {
		return UIImage(systemName: "06.square")
	}

	/// 06.square.fill
	static var square_fill_06: UIImage? {
		return UIImage(systemName: "06.square.fill")
	}

	/// 07.circle
	static var circle_07: UIImage? {
		return UIImage(systemName: "07.circle")
	}

	/// 07.circle.fill
	static var circle_fill_07: UIImage? {
		return UIImage(systemName: "07.circle.fill")
	}

	/// 07.square
	static var square_07: UIImage? {
		return UIImage(systemName: "07.square")
	}

	/// 07.square.fill
	static var square_fill_07: UIImage? {
		return UIImage(systemName: "07.square.fill")
	}

	/// 08.circle
	static var circle_08: UIImage? {
		return UIImage(systemName: "08.circle")
	}

	/// 08.circle.fill
	static var circle_fill_08: UIImage? {
		return UIImage(systemName: "08.circle.fill")
	}

	/// 08.square
	static var square_08: UIImage? {
		return UIImage(systemName: "08.square")
	}

	/// 08.square.fill
	static var square_fill_08: UIImage? {
		return UIImage(systemName: "08.square.fill")
	}

	/// 09.circle
	static var circle_09: UIImage? {
		return UIImage(systemName: "09.circle")
	}

	/// 09.circle.fill
	static var circle_fill_09: UIImage? {
		return UIImage(systemName: "09.circle.fill")
	}

	/// 09.square
	static var square_09: UIImage? {
		return UIImage(systemName: "09.square")
	}

	/// 09.square.fill
	static var square_fill_09: UIImage? {
		return UIImage(systemName: "09.square.fill")
	}

	/// 10.circle
	static var circle_10: UIImage? {
		return UIImage(systemName: "10.circle")
	}

	/// 10.circle.fill
	static var circle_fill_10: UIImage? {
		return UIImage(systemName: "10.circle.fill")
	}

	/// 10.square
	static var square_10: UIImage? {
		return UIImage(systemName: "10.square")
	}

	/// 10.square.fill
	static var square_fill_10: UIImage? {
		return UIImage(systemName: "10.square.fill")
	}

	/// 11.circle
	static var circle_11: UIImage? {
		return UIImage(systemName: "11.circle")
	}

	/// 11.circle.fill
	static var circle_fill_11: UIImage? {
		return UIImage(systemName: "11.circle.fill")
	}

	/// 11.square
	static var square_11: UIImage? {
		return UIImage(systemName: "11.square")
	}

	/// 11.square.fill
	static var square_fill_11: UIImage? {
		return UIImage(systemName: "11.square.fill")
	}

	/// 12.circle
	static var circle_12: UIImage? {
		return UIImage(systemName: "12.circle")
	}

	/// 12.circle.fill
	static var circle_fill_12: UIImage? {
		return UIImage(systemName: "12.circle.fill")
	}

	/// 12.square
	static var square_12: UIImage? {
		return UIImage(systemName: "12.square")
	}

	/// 12.square.fill
	static var square_fill_12: UIImage? {
		return UIImage(systemName: "12.square.fill")
	}

	/// 13.circle
	static var circle_13: UIImage? {
		return UIImage(systemName: "13.circle")
	}

	/// 13.circle.fill
	static var circle_fill_13: UIImage? {
		return UIImage(systemName: "13.circle.fill")
	}

	/// 13.square
	static var square_13: UIImage? {
		return UIImage(systemName: "13.square")
	}

	/// 13.square.fill
	static var square_fill_13: UIImage? {
		return UIImage(systemName: "13.square.fill")
	}

	/// 14.circle
	static var circle_14: UIImage? {
		return UIImage(systemName: "14.circle")
	}

	/// 14.circle.fill
	static var circle_fill_14: UIImage? {
		return UIImage(systemName: "14.circle.fill")
	}

	/// 14.square
	static var square_14: UIImage? {
		return UIImage(systemName: "14.square")
	}

	/// 14.square.fill
	static var square_fill_14: UIImage? {
		return UIImage(systemName: "14.square.fill")
	}

	/// 15.circle
	static var circle_15: UIImage? {
		return UIImage(systemName: "15.circle")
	}

	/// 15.circle.fill
	static var circle_fill_15: UIImage? {
		return UIImage(systemName: "15.circle.fill")
	}

	/// 15.square
	static var square_15: UIImage? {
		return UIImage(systemName: "15.square")
	}

	/// 15.square.fill
	static var square_fill_15: UIImage? {
		return UIImage(systemName: "15.square.fill")
	}

	/// 16.circle
	static var circle_16: UIImage? {
		return UIImage(systemName: "16.circle")
	}

	/// 16.circle.fill
	static var circle_fill_16: UIImage? {
		return UIImage(systemName: "16.circle.fill")
	}

	/// 16.square
	static var square_16: UIImage? {
		return UIImage(systemName: "16.square")
	}

	/// 16.square.fill
	static var square_fill_16: UIImage? {
		return UIImage(systemName: "16.square.fill")
	}

	/// 17.circle
	static var circle_17: UIImage? {
		return UIImage(systemName: "17.circle")
	}

	/// 17.circle.fill
	static var circle_fill_17: UIImage? {
		return UIImage(systemName: "17.circle.fill")
	}

	/// 17.square
	static var square_17: UIImage? {
		return UIImage(systemName: "17.square")
	}

	/// 17.square.fill
	static var square_fill_17: UIImage? {
		return UIImage(systemName: "17.square.fill")
	}

	/// 18.circle
	static var circle_18: UIImage? {
		return UIImage(systemName: "18.circle")
	}

	/// 18.circle.fill
	static var circle_fill_18: UIImage? {
		return UIImage(systemName: "18.circle.fill")
	}

	/// 18.square
	static var square_18: UIImage? {
		return UIImage(systemName: "18.square")
	}

	/// 18.square.fill
	static var square_fill_18: UIImage? {
		return UIImage(systemName: "18.square.fill")
	}

	/// 19.circle
	static var circle_19: UIImage? {
		return UIImage(systemName: "19.circle")
	}

	/// 19.circle.fill
	static var circle_fill_19: UIImage? {
		return UIImage(systemName: "19.circle.fill")
	}

	/// 19.square
	static var square_19: UIImage? {
		return UIImage(systemName: "19.square")
	}

	/// 19.square.fill
	static var square_fill_19: UIImage? {
		return UIImage(systemName: "19.square.fill")
	}

	/// 20.circle
	static var circle_20: UIImage? {
		return UIImage(systemName: "20.circle")
	}

	/// 20.circle.fill
	static var circle_fill_20: UIImage? {
		return UIImage(systemName: "20.circle.fill")
	}

	/// 20.square
	static var square_20: UIImage? {
		return UIImage(systemName: "20.square")
	}

	/// 20.square.fill
	static var square_fill_20: UIImage? {
		return UIImage(systemName: "20.square.fill")
	}

	/// 21.circle
	static var circle_21: UIImage? {
		return UIImage(systemName: "21.circle")
	}

	/// 21.circle.fill
	static var circle_fill_21: UIImage? {
		return UIImage(systemName: "21.circle.fill")
	}

	/// 21.square
	static var square_21: UIImage? {
		return UIImage(systemName: "21.square")
	}

	/// 21.square.fill
	static var square_fill_21: UIImage? {
		return UIImage(systemName: "21.square.fill")
	}

	/// 22.circle
	static var circle_22: UIImage? {
		return UIImage(systemName: "22.circle")
	}

	/// 22.circle.fill
	static var circle_fill_22: UIImage? {
		return UIImage(systemName: "22.circle.fill")
	}

	/// 22.square
	static var square_22: UIImage? {
		return UIImage(systemName: "22.square")
	}

	/// 22.square.fill
	static var square_fill_22: UIImage? {
		return UIImage(systemName: "22.square.fill")
	}

	/// 23.circle
	static var circle_23: UIImage? {
		return UIImage(systemName: "23.circle")
	}

	/// 23.circle.fill
	static var circle_fill_23: UIImage? {
		return UIImage(systemName: "23.circle.fill")
	}

	/// 23.square
	static var square_23: UIImage? {
		return UIImage(systemName: "23.square")
	}

	/// 23.square.fill
	static var square_fill_23: UIImage? {
		return UIImage(systemName: "23.square.fill")
	}

	/// 24.circle
	static var circle_24: UIImage? {
		return UIImage(systemName: "24.circle")
	}

	/// 24.circle.fill
	static var circle_fill_24: UIImage? {
		return UIImage(systemName: "24.circle.fill")
	}

	/// 24.square
	static var square_24: UIImage? {
		return UIImage(systemName: "24.square")
	}

	/// 24.square.fill
	static var square_fill_24: UIImage? {
		return UIImage(systemName: "24.square.fill")
	}

	/// 25.circle
	static var circle_25: UIImage? {
		return UIImage(systemName: "25.circle")
	}

	/// 25.circle.fill
	static var circle_fill_25: UIImage? {
		return UIImage(systemName: "25.circle.fill")
	}

	/// 25.square
	static var square_25: UIImage? {
		return UIImage(systemName: "25.square")
	}

	/// 25.square.fill
	static var square_fill_25: UIImage? {
		return UIImage(systemName: "25.square.fill")
	}

	/// 26.circle
	static var circle_26: UIImage? {
		return UIImage(systemName: "26.circle")
	}

	/// 26.circle.fill
	static var circle_fill_26: UIImage? {
		return UIImage(systemName: "26.circle.fill")
	}

	/// 26.square
	static var square_26: UIImage? {
		return UIImage(systemName: "26.square")
	}

	/// 26.square.fill
	static var square_fill_26: UIImage? {
		return UIImage(systemName: "26.square.fill")
	}

	/// 27.circle
	static var circle_27: UIImage? {
		return UIImage(systemName: "27.circle")
	}

	/// 27.circle.fill
	static var circle_fill_27: UIImage? {
		return UIImage(systemName: "27.circle.fill")
	}

	/// 27.square
	static var square_27: UIImage? {
		return UIImage(systemName: "27.square")
	}

	/// 27.square.fill
	static var square_fill_27: UIImage? {
		return UIImage(systemName: "27.square.fill")
	}

	/// 28.circle
	static var circle_28: UIImage? {
		return UIImage(systemName: "28.circle")
	}

	/// 28.circle.fill
	static var circle_fill_28: UIImage? {
		return UIImage(systemName: "28.circle.fill")
	}

	/// 28.square
	static var square_28: UIImage? {
		return UIImage(systemName: "28.square")
	}

	/// 28.square.fill
	static var square_fill_28: UIImage? {
		return UIImage(systemName: "28.square.fill")
	}

	/// 29.circle
	static var circle_29: UIImage? {
		return UIImage(systemName: "29.circle")
	}

	/// 29.circle.fill
	static var circle_fill_29: UIImage? {
		return UIImage(systemName: "29.circle.fill")
	}

	/// 29.square
	static var square_29: UIImage? {
		return UIImage(systemName: "29.square")
	}

	/// 29.square.fill
	static var square_fill_29: UIImage? {
		return UIImage(systemName: "29.square.fill")
	}

	/// 30.circle
	static var circle_30: UIImage? {
		return UIImage(systemName: "30.circle")
	}

	/// 30.circle.fill
	static var circle_fill_30: UIImage? {
		return UIImage(systemName: "30.circle.fill")
	}

	/// 30.square
	static var square_30: UIImage? {
		return UIImage(systemName: "30.square")
	}

	/// 30.square.fill
	static var square_fill_30: UIImage? {
		return UIImage(systemName: "30.square.fill")
	}

	/// 31.circle
	static var circle_31: UIImage? {
		return UIImage(systemName: "31.circle")
	}

	/// 31.circle.fill
	static var circle_fill_31: UIImage? {
		return UIImage(systemName: "31.circle.fill")
	}

	/// 31.square
	static var square_31: UIImage? {
		return UIImage(systemName: "31.square")
	}

	/// 31.square.fill
	static var square_fill_31: UIImage? {
		return UIImage(systemName: "31.square.fill")
	}

	/// 32.circle
	static var circle_32: UIImage? {
		return UIImage(systemName: "32.circle")
	}

	/// 32.circle.fill
	static var circle_fill_32: UIImage? {
		return UIImage(systemName: "32.circle.fill")
	}

	/// 32.square
	static var square_32: UIImage? {
		return UIImage(systemName: "32.square")
	}

	/// 32.square.fill
	static var square_fill_32: UIImage? {
		return UIImage(systemName: "32.square.fill")
	}

	/// 33.circle
	static var circle_33: UIImage? {
		return UIImage(systemName: "33.circle")
	}

	/// 33.circle.fill
	static var circle_fill_33: UIImage? {
		return UIImage(systemName: "33.circle.fill")
	}

	/// 33.square
	static var square_33: UIImage? {
		return UIImage(systemName: "33.square")
	}

	/// 33.square.fill
	static var square_fill_33: UIImage? {
		return UIImage(systemName: "33.square.fill")
	}

	/// 34.circle
	static var circle_34: UIImage? {
		return UIImage(systemName: "34.circle")
	}

	/// 34.circle.fill
	static var circle_fill_34: UIImage? {
		return UIImage(systemName: "34.circle.fill")
	}

	/// 34.square
	static var square_34: UIImage? {
		return UIImage(systemName: "34.square")
	}

	/// 34.square.fill
	static var square_fill_34: UIImage? {
		return UIImage(systemName: "34.square.fill")
	}

	/// 35.circle
	static var circle_35: UIImage? {
		return UIImage(systemName: "35.circle")
	}

	/// 35.circle.fill
	static var circle_fill_35: UIImage? {
		return UIImage(systemName: "35.circle.fill")
	}

	/// 35.square
	static var square_35: UIImage? {
		return UIImage(systemName: "35.square")
	}

	/// 35.square.fill
	static var square_fill_35: UIImage? {
		return UIImage(systemName: "35.square.fill")
	}

	/// 36.circle
	static var circle_36: UIImage? {
		return UIImage(systemName: "36.circle")
	}

	/// 36.circle.fill
	static var circle_fill_36: UIImage? {
		return UIImage(systemName: "36.circle.fill")
	}

	/// 36.square
	static var square_36: UIImage? {
		return UIImage(systemName: "36.square")
	}

	/// 36.square.fill
	static var square_fill_36: UIImage? {
		return UIImage(systemName: "36.square.fill")
	}

	/// 37.circle
	static var circle_37: UIImage? {
		return UIImage(systemName: "37.circle")
	}

	/// 37.circle.fill
	static var circle_fill_37: UIImage? {
		return UIImage(systemName: "37.circle.fill")
	}

	/// 37.square
	static var square_37: UIImage? {
		return UIImage(systemName: "37.square")
	}

	/// 37.square.fill
	static var square_fill_37: UIImage? {
		return UIImage(systemName: "37.square.fill")
	}

	/// 38.circle
	static var circle_38: UIImage? {
		return UIImage(systemName: "38.circle")
	}

	/// 38.circle.fill
	static var circle_fill_38: UIImage? {
		return UIImage(systemName: "38.circle.fill")
	}

	/// 38.square
	static var square_38: UIImage? {
		return UIImage(systemName: "38.square")
	}

	/// 38.square.fill
	static var square_fill_38: UIImage? {
		return UIImage(systemName: "38.square.fill")
	}

	/// 39.circle
	static var circle_39: UIImage? {
		return UIImage(systemName: "39.circle")
	}

	/// 39.circle.fill
	static var circle_fill_39: UIImage? {
		return UIImage(systemName: "39.circle.fill")
	}

	/// 39.square
	static var square_39: UIImage? {
		return UIImage(systemName: "39.square")
	}

	/// 39.square.fill
	static var square_fill_39: UIImage? {
		return UIImage(systemName: "39.square.fill")
	}

	/// 40.circle
	static var circle_40: UIImage? {
		return UIImage(systemName: "40.circle")
	}

	/// 40.circle.fill
	static var circle_fill_40: UIImage? {
		return UIImage(systemName: "40.circle.fill")
	}

	/// 40.square
	static var square_40: UIImage? {
		return UIImage(systemName: "40.square")
	}

	/// 40.square.fill
	static var square_fill_40: UIImage? {
		return UIImage(systemName: "40.square.fill")
	}

	/// 41.circle
	static var circle_41: UIImage? {
		return UIImage(systemName: "41.circle")
	}

	/// 41.circle.fill
	static var circle_fill_41: UIImage? {
		return UIImage(systemName: "41.circle.fill")
	}

	/// 41.square
	static var square_41: UIImage? {
		return UIImage(systemName: "41.square")
	}

	/// 41.square.fill
	static var square_fill_41: UIImage? {
		return UIImage(systemName: "41.square.fill")
	}

	/// 42.circle
	static var circle_42: UIImage? {
		return UIImage(systemName: "42.circle")
	}

	/// 42.circle.fill
	static var circle_fill_42: UIImage? {
		return UIImage(systemName: "42.circle.fill")
	}

	/// 42.square
	static var square_42: UIImage? {
		return UIImage(systemName: "42.square")
	}

	/// 42.square.fill
	static var square_fill_42: UIImage? {
		return UIImage(systemName: "42.square.fill")
	}

	/// 43.circle
	static var circle_43: UIImage? {
		return UIImage(systemName: "43.circle")
	}

	/// 43.circle.fill
	static var circle_fill_43: UIImage? {
		return UIImage(systemName: "43.circle.fill")
	}

	/// 43.square
	static var square_43: UIImage? {
		return UIImage(systemName: "43.square")
	}

	/// 43.square.fill
	static var square_fill_43: UIImage? {
		return UIImage(systemName: "43.square.fill")
	}

	/// 44.circle
	static var circle_44: UIImage? {
		return UIImage(systemName: "44.circle")
	}

	/// 44.circle.fill
	static var circle_fill_44: UIImage? {
		return UIImage(systemName: "44.circle.fill")
	}

	/// 44.square
	static var square_44: UIImage? {
		return UIImage(systemName: "44.square")
	}

	/// 44.square.fill
	static var square_fill_44: UIImage? {
		return UIImage(systemName: "44.square.fill")
	}

	/// 45.circle
	static var circle_45: UIImage? {
		return UIImage(systemName: "45.circle")
	}

	/// 45.circle.fill
	static var circle_fill_45: UIImage? {
		return UIImage(systemName: "45.circle.fill")
	}

	/// 45.square
	static var square_45: UIImage? {
		return UIImage(systemName: "45.square")
	}

	/// 45.square.fill
	static var square_fill_45: UIImage? {
		return UIImage(systemName: "45.square.fill")
	}

	/// 46.circle
	static var circle_46: UIImage? {
		return UIImage(systemName: "46.circle")
	}

	/// 46.circle.fill
	static var circle_fill_46: UIImage? {
		return UIImage(systemName: "46.circle.fill")
	}

	/// 46.square
	static var square_46: UIImage? {
		return UIImage(systemName: "46.square")
	}

	/// 46.square.fill
	static var square_fill_46: UIImage? {
		return UIImage(systemName: "46.square.fill")
	}

	/// 47.circle
	static var circle_47: UIImage? {
		return UIImage(systemName: "47.circle")
	}

	/// 47.circle.fill
	static var circle_fill_47: UIImage? {
		return UIImage(systemName: "47.circle.fill")
	}

	/// 47.square
	static var square_47: UIImage? {
		return UIImage(systemName: "47.square")
	}

	/// 47.square.fill
	static var square_fill_47: UIImage? {
		return UIImage(systemName: "47.square.fill")
	}

	/// 48.circle
	static var circle_48: UIImage? {
		return UIImage(systemName: "48.circle")
	}

	/// 48.circle.fill
	static var circle_fill_48: UIImage? {
		return UIImage(systemName: "48.circle.fill")
	}

	/// 48.square
	static var square_48: UIImage? {
		return UIImage(systemName: "48.square")
	}

	/// 48.square.fill
	static var square_fill_48: UIImage? {
		return UIImage(systemName: "48.square.fill")
	}

	/// 49.circle
	static var circle_49: UIImage? {
		return UIImage(systemName: "49.circle")
	}

	/// 49.circle.fill
	static var circle_fill_49: UIImage? {
		return UIImage(systemName: "49.circle.fill")
	}

	/// 49.square
	static var square_49: UIImage? {
		return UIImage(systemName: "49.square")
	}

	/// 49.square.fill
	static var square_fill_49: UIImage? {
		return UIImage(systemName: "49.square.fill")
	}

	/// 50.circle
	static var circle_50: UIImage? {
		return UIImage(systemName: "50.circle")
	}

	/// 50.circle.fill
	static var circle_fill_50: UIImage? {
		return UIImage(systemName: "50.circle.fill")
	}

	/// 50.square
	static var square_50: UIImage? {
		return UIImage(systemName: "50.square")
	}

	/// 50.square.fill
	static var square_fill_50: UIImage? {
		return UIImage(systemName: "50.square.fill")
	}

	/// applelogo
	static var applelogo: UIImage? {
		return UIImage(systemName: "applelogo")
	}

}
