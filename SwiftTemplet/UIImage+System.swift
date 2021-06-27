//
//  UIImage+System.swift
//  SwiftTemplet
//
//  Created by Bin Shang on 2021/6/18.
//  Copyright © 2021 BN. All rights reserved.
//


@objc public extension UIImage{
    
    var assetName: String? {
        guard let imageAsset = imageAsset else { return nil }
        return imageAsset.value(forKey:"assetName") as? String
    }
}


@available(iOS 13.0, *)
@objc public extension UIImage{
    
    static var square_and_arrow_up: UIImage? {
        return UIImage(systemName: "square.and.arrow.up")
    }
    static var square_and_arrow_up_fill: UIImage? {
        return UIImage(systemName: "square.and.arrow.up.fill")
    }
    static var square_and_arrow_down: UIImage? {
        return UIImage(systemName: "square.and.arrow.down")
    }
    static var square_and_arrow_down_fill: UIImage? {
        return UIImage(systemName: "square.and.arrow.down.fill")
    }
    static var square_and_arrow_up_on_square: UIImage? {
        return UIImage(systemName: "square.and.arrow.up.on.square")
    }
    static var square_and_arrow_up_on_square_fill: UIImage? {
        return UIImage(systemName: "square.and.arrow.up.on.square.fill")
    }
    static var square_and_arrow_down_on_square: UIImage? {
        return UIImage(systemName: "square.and.arrow.down.on.square")
    }
    static var square_and_arrow_down_on_square_fill: UIImage? {
        return UIImage(systemName: "square.and.arrow.down.on.square.fill")
    }
    static var pencil: UIImage? {
        return UIImage(systemName: "pencil")
    }
    static var pencil_circle: UIImage? {
        return UIImage(systemName: "pencil.circle")
    }
    static var pencil_circle_fill: UIImage? {
        return UIImage(systemName: "pencil.circle.fill")
    }
    static var pencil_slash: UIImage? {
        return UIImage(systemName: "pencil.slash")
    }
    static var square_and_pencil: UIImage? {
        return UIImage(systemName: "square.and.pencil")
    }
    static var scribble: UIImage? {
        return UIImage(systemName: "scribble")
    }
    static var pencil_and_outline: UIImage? {
        return UIImage(systemName: "pencil.and.outline")
    }
    static var pencil_tip: UIImage? {
        return UIImage(systemName: "pencil.tip")
    }
    static var pencil_tip_crop_circle: UIImage? {
        return UIImage(systemName: "pencil.tip.crop.circle")
    }
    static var pencil_tip_crop_circle_badge_plus: UIImage? {
        return UIImage(systemName: "pencil.tip.crop.circle.badge.plus")
    }
    static var pencil_tip_crop_circle_badge_minus: UIImage? {
        return UIImage(systemName: "pencil.tip.crop.circle.badge.minus")
    }
    static var lasso: UIImage? {
        return UIImage(systemName: "lasso")
    }
    static var trash: UIImage? {
        return UIImage(systemName: "trash")
    }
    static var trash_fill: UIImage? {
        return UIImage(systemName: "trash.fill")
    }
    static var trash_circle: UIImage? {
        return UIImage(systemName: "trash.circle")
    }
    static var trash_circle_fill: UIImage? {
        return UIImage(systemName: "trash.circle.fill")
    }
    static var trash_slash: UIImage? {
        return UIImage(systemName: "trash.slash")
    }
    static var trash_slash_fill: UIImage? {
        return UIImage(systemName: "trash.slash.fill")
    }
    static var folder: UIImage? {
        return UIImage(systemName: "folder")
    }
    static var folder_fill: UIImage? {
        return UIImage(systemName: "folder.fill")
    }
    static var folder_circle: UIImage? {
        return UIImage(systemName: "folder.circle")
    }
    static var folder_circle_fill: UIImage? {
        return UIImage(systemName: "folder.circle.fill")
    }
    static var folder_badge_plus: UIImage? {
        return UIImage(systemName: "folder.badge.plus")
    }
    static var folder_fill_badge_plus: UIImage? {
        return UIImage(systemName: "folder.fill.badge.plus")
    }
    static var folder_badge_minus: UIImage? {
        return UIImage(systemName: "folder.badge.minus")
    }
    static var folder_fill_badge_minus: UIImage? {
        return UIImage(systemName: "folder.fill.badge.minus")
    }
    static var folder_badge_person_crop: UIImage? {
        return UIImage(systemName: "folder.badge.person.crop")
    }
    static var folder_fill_badge_person_crop: UIImage? {
        return UIImage(systemName: "folder.fill.badge.person.crop")
    }
    static var paperplane: UIImage? {
        return UIImage(systemName: "paperplane")
    }
    static var paperplane_fill: UIImage? {
        return UIImage(systemName: "paperplane.fill")
    }
    static var tray: UIImage? {
        return UIImage(systemName: "tray")
    }
    static var tray_fill: UIImage? {
        return UIImage(systemName: "tray.fill")
    }
    static var tray_and_arrow_up: UIImage? {
        return UIImage(systemName: "tray.and.arrow.up")
    }
    static var tray_and_arrow_up_fill: UIImage? {
        return UIImage(systemName: "tray.and.arrow.up.fill")
    }
    static var tray_and_arrow_down: UIImage? {
        return UIImage(systemName: "tray.and.arrow.down")
    }
    static var tray_and_arrow_down_fill: UIImage? {
        return UIImage(systemName: "tray.and.arrow.down.fill")
    }
    static var tray_2: UIImage? {
        return UIImage(systemName: "tray.2")
    }
    static var tray_2_fill: UIImage? {
        return UIImage(systemName: "tray.2.fill")
    }
    static var tray_full: UIImage? {
        return UIImage(systemName: "tray.full")
    }
    static var tray_full_fill: UIImage? {
        return UIImage(systemName: "tray.full.fill")
    }
    static var archivebox: UIImage? {
        return UIImage(systemName: "archivebox")
    }
    static var archivebox_fill: UIImage? {
        return UIImage(systemName: "archivebox.fill")
    }
    static var arrow_up_bin: UIImage? {
        return UIImage(systemName: "arrow.up.bin")
    }
    static var arrow_up_bin_fill: UIImage? {
        return UIImage(systemName: "arrow.up.bin.fill")
    }
    static var doc: UIImage? {
        return UIImage(systemName: "doc")
    }
    static var doc_fill: UIImage? {
        return UIImage(systemName: "doc.fill")
    }
    static var doc_circle: UIImage? {
        return UIImage(systemName: "doc.circle")
    }
    static var doc_circle_fill: UIImage? {
        return UIImage(systemName: "doc.circle.fill")
    }
    static var arrow_up_doc: UIImage? {
        return UIImage(systemName: "arrow.up.doc")
    }
    static var arrow_up_doc_fill: UIImage? {
        return UIImage(systemName: "arrow.up.doc.fill")
    }
    static var arrow_down_doc: UIImage? {
        return UIImage(systemName: "arrow.down.doc")
    }
    static var arrow_down_doc_fill: UIImage? {
        return UIImage(systemName: "arrow.down.doc.fill")
    }
    static var doc_text: UIImage? {
        return UIImage(systemName: "doc.text")
    }
    static var doc_text_fill: UIImage? {
        return UIImage(systemName: "doc.text.fill")
    }
    static var doc_on_doc: UIImage? {
        return UIImage(systemName: "doc.on.doc")
    }
    static var doc_on_doc_fill: UIImage? {
        return UIImage(systemName: "doc.on.doc.fill")
    }
    static var doc_on_clipboard: UIImage? {
        return UIImage(systemName: "doc.on.clipboard")
    }
    static var doc_on_clipboard_fill: UIImage? {
        return UIImage(systemName: "doc.on.clipboard.fill")
    }
    static var doc_richtext: UIImage? {
        return UIImage(systemName: "doc.richtext")
    }
    static var doc_plaintext: UIImage? {
        return UIImage(systemName: "doc.plaintext")
    }
    static var doc_append: UIImage? {
        return UIImage(systemName: "doc.append")
    }
    static var doc_text_magnifyingglass: UIImage? {
        return UIImage(systemName: "doc.text.magnifyingglass")
    }
    static var calendar: UIImage? {
        return UIImage(systemName: "calendar")
    }
    static var calendar_circle: UIImage? {
        return UIImage(systemName: "calendar.circle")
    }
    static var calendar_circle_fill: UIImage? {
        return UIImage(systemName: "calendar.circle.fill")
    }
    static var calendar_badge_plus: UIImage? {
        return UIImage(systemName: "calendar.badge.plus")
    }
    static var calendar_badge_minus: UIImage? {
        return UIImage(systemName: "calendar.badge.minus")
    }
    static var arrowshape_turn_up_left: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.left")
    }
    static var arrowshape_turn_up_left_fill: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.left.fill")
    }
    static var arrowshape_turn_up_left_circle: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.left.circle")
    }
    static var arrowshape_turn_up_left_circle_fill: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.left.circle.fill")
    }
    static var arrowshape_turn_up_right: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.right")
    }
    static var arrowshape_turn_up_right_fill: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.right.fill")
    }
    static var arrowshape_turn_up_right_circle: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.right.circle")
    }
    static var arrowshape_turn_up_right_circle_fill: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.right.circle.fill")
    }
    static var arrowshape_turn_up_left_2: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.left.2")
    }
    static var arrowshape_turn_up_left_2_fill: UIImage? {
        return UIImage(systemName: "arrowshape.turn.up.left.2.fill")
    }
    static var book: UIImage? {
        return UIImage(systemName: "book")
    }
    static var book_fill: UIImage? {
        return UIImage(systemName: "book.fill")
    }
    static var book_circle: UIImage? {
        return UIImage(systemName: "book.circle")
    }
    static var book_circle_fill: UIImage? {
        return UIImage(systemName: "book.circle.fill")
    }
    static var bookmark: UIImage? {
        return UIImage(systemName: "bookmark")
    }
    static var bookmark_fill: UIImage? {
        return UIImage(systemName: "bookmark.fill")
    }
    static var rosette: UIImage? {
        return UIImage(systemName: "rosette")
    }
    static var paperclip: UIImage? {
        return UIImage(systemName: "paperclip")
    }
    static var rectangle_and_paperclip: UIImage? {
        return UIImage(systemName: "rectangle.and.paperclip")
    }
    static var link: UIImage? {
        return UIImage(systemName: "link")
    }
    static var link_circle: UIImage? {
        return UIImage(systemName: "link.circle")
    }
    static var link_circle_fill: UIImage? {
        return UIImage(systemName: "link.circle.fill")
    }
    static var personalhotspot: UIImage? {
        return UIImage(systemName: "personalhotspot")
    }
    static var person: UIImage? {
        return UIImage(systemName: "person")
    }
    static var person_fill: UIImage? {
        return UIImage(systemName: "person.fill")
    }
    static var person_circle: UIImage? {
        return UIImage(systemName: "person.circle")
    }
    static var person_circle_fill: UIImage? {
        return UIImage(systemName: "person.circle.fill")
    }
    static var person_badge_plus: UIImage? {
        return UIImage(systemName: "person.badge.plus")
    }
    static var person_badge_minus: UIImage? {
        return UIImage(systemName: "person.badge.minus")
    }
    static var person_2: UIImage? {
        return UIImage(systemName: "person.2")
    }
    static var person_2_fill: UIImage? {
        return UIImage(systemName: "person.2.fill")
    }
    static var person_3: UIImage? {
        return UIImage(systemName: "person.3")
    }
    static var person_3_fill: UIImage? {
        return UIImage(systemName: "person.3.fill")
    }
    static var person_crop_circle: UIImage? {
        return UIImage(systemName: "person.crop.circle")
    }
    static var person_crop_circle_fill: UIImage? {
        return UIImage(systemName: "person.crop.circle.fill")
    }
    static var person_crop_circle_badge_plus: UIImage? {
        return UIImage(systemName: "person.crop.circle.badge.plus")
    }
    static var person_crop_circle_fill_badge_plus: UIImage? {
        return UIImage(systemName: "person.crop.circle.fill.badge.plus")
    }
    static var person_crop_circle_badge_minus: UIImage? {
        return UIImage(systemName: "person.crop.circle.badge.minus")
    }
    static var person_crop_circle_fill_badge_minus: UIImage? {
        return UIImage(systemName: "person.crop.circle.fill.badge.minus")
    }
    static var person_crop_circle_badge_checkmark: UIImage? {
        return UIImage(systemName: "person.crop.circle.badge.checkmark")
    }
    static var person_crop_circle_fill_badge_checkmark: UIImage? {
        return UIImage(systemName: "person.crop.circle.fill.badge.checkmark")
    }
    static var person_crop_circle_badge_xmark: UIImage? {
        return UIImage(systemName: "person.crop.circle.badge.xmark")
    }
    static var person_crop_circle_fill_badge_xmark: UIImage? {
        return UIImage(systemName: "person.crop.circle.fill.badge.xmark")
    }
    static var person_crop_square: UIImage? {
        return UIImage(systemName: "person.crop.square")
    }
    static var person_crop_square_fill: UIImage? {
        return UIImage(systemName: "person.crop.square.fill")
    }
    static var person_crop_rectangle: UIImage? {
        return UIImage(systemName: "person.crop.rectangle")
    }
    static var person_crop_rectangle_fill: UIImage? {
        return UIImage(systemName: "person.crop.rectangle.fill")
    }
    static var command: UIImage? {
        return UIImage(systemName: "command")
    }
    static var option: UIImage? {
        return UIImage(systemName: "option")
    }
    static var alt: UIImage? {
        return UIImage(systemName: "alt")
    }
    static var clear: UIImage? {
        return UIImage(systemName: "clear")
    }
    static var clear_fill: UIImage? {
        return UIImage(systemName: "clear.fill")
    }
    static var delete_left: UIImage? {
        return UIImage(systemName: "delete.left")
    }
    static var delete_left_fill: UIImage? {
        return UIImage(systemName: "delete.left.fill")
    }
    static var delete_right: UIImage? {
        return UIImage(systemName: "delete.right")
    }
    static var delete_right_fill: UIImage? {
        return UIImage(systemName: "delete.right.fill")
    }
    static var shift: UIImage? {
        return UIImage(systemName: "shift")
    }
    static var shift_fill: UIImage? {
        return UIImage(systemName: "shift.fill")
    }
    static var capslock: UIImage? {
        return UIImage(systemName: "capslock")
    }
    static var capslock_fill: UIImage? {
        return UIImage(systemName: "capslock.fill")
    }
    static var escape: UIImage? {
        return UIImage(systemName: "escape")
    }
    static var power: UIImage? {
        return UIImage(systemName: "power")
    }
    static var globe: UIImage? {
        return UIImage(systemName: "globe")
    }
    static var sun_min: UIImage? {
        return UIImage(systemName: "sun.min")
    }
    static var sun_min_fill: UIImage? {
        return UIImage(systemName: "sun.min.fill")
    }
    static var sun_max: UIImage? {
        return UIImage(systemName: "sun.max")
    }
    static var sun_max_fill: UIImage? {
        return UIImage(systemName: "sun.max.fill")
    }
    static var sunrise: UIImage? {
        return UIImage(systemName: "sunrise")
    }
    static var sunrise_fill: UIImage? {
        return UIImage(systemName: "sunrise.fill")
    }
    static var sunset: UIImage? {
        return UIImage(systemName: "sunset")
    }
    static var sunset_fill: UIImage? {
        return UIImage(systemName: "sunset.fill")
    }
    static var sun_dust: UIImage? {
        return UIImage(systemName: "sun.dust")
    }
    static var sun_dust_fill: UIImage? {
        return UIImage(systemName: "sun.dust.fill")
    }
    static var sun_haze: UIImage? {
        return UIImage(systemName: "sun.haze")
    }
    static var sun_haze_fill: UIImage? {
        return UIImage(systemName: "sun.haze.fill")
    }
    static var moon: UIImage? {
        return UIImage(systemName: "moon")
    }
    static var moon_fill: UIImage? {
        return UIImage(systemName: "moon.fill")
    }
    static var moon_circle: UIImage? {
        return UIImage(systemName: "moon.circle")
    }
    static var moon_circle_fill: UIImage? {
        return UIImage(systemName: "moon.circle.fill")
    }
    static var zzz: UIImage? {
        return UIImage(systemName: "zzz")
    }
    static var moon_zzz: UIImage? {
        return UIImage(systemName: "moon.zzz")
    }
    static var moon_zzz_fill: UIImage? {
        return UIImage(systemName: "moon.zzz.fill")
    }
    static var sparkles: UIImage? {
        return UIImage(systemName: "sparkles")
    }
    static var moon_stars: UIImage? {
        return UIImage(systemName: "moon.stars")
    }
    static var moon_stars_fill: UIImage? {
        return UIImage(systemName: "moon.stars.fill")
    }
    static var cloud: UIImage? {
        return UIImage(systemName: "cloud")
    }
    static var cloud_fill: UIImage? {
        return UIImage(systemName: "cloud.fill")
    }
    static var cloud_drizzle: UIImage? {
        return UIImage(systemName: "cloud.drizzle")
    }
    static var cloud_drizzle_fill: UIImage? {
        return UIImage(systemName: "cloud.drizzle.fill")
    }
    static var cloud_rain: UIImage? {
        return UIImage(systemName: "cloud.rain")
    }
    static var cloud_rain_fill: UIImage? {
        return UIImage(systemName: "cloud.rain.fill")
    }
    static var cloud_heavyrain: UIImage? {
        return UIImage(systemName: "cloud.heavyrain")
    }
    static var cloud_heavyrain_fill: UIImage? {
        return UIImage(systemName: "cloud.heavyrain.fill")
    }
    static var cloud_fog: UIImage? {
        return UIImage(systemName: "cloud.fog")
    }
    static var cloud_fog_fill: UIImage? {
        return UIImage(systemName: "cloud.fog.fill")
    }
    static var cloud_hail: UIImage? {
        return UIImage(systemName: "cloud.hail")
    }
    static var cloud_hail_fill: UIImage? {
        return UIImage(systemName: "cloud.hail.fill")
    }
    static var cloud_snow: UIImage? {
        return UIImage(systemName: "cloud.snow")
    }
    static var cloud_snow_fill: UIImage? {
        return UIImage(systemName: "cloud.snow.fill")
    }
    static var cloud_sleet: UIImage? {
        return UIImage(systemName: "cloud.sleet")
    }
    static var cloud_sleet_fill: UIImage? {
        return UIImage(systemName: "cloud.sleet.fill")
    }
    static var cloud_bolt: UIImage? {
        return UIImage(systemName: "cloud.bolt")
    }
    static var cloud_bolt_fill: UIImage? {
        return UIImage(systemName: "cloud.bolt.fill")
    }
    static var cloud_bolt_rain: UIImage? {
        return UIImage(systemName: "cloud.bolt.rain")
    }
    static var cloud_bolt_rain_fill: UIImage? {
        return UIImage(systemName: "cloud.bolt.rain.fill")
    }
    static var cloud_sun: UIImage? {
        return UIImage(systemName: "cloud.sun")
    }
    static var cloud_sun_fill: UIImage? {
        return UIImage(systemName: "cloud.sun.fill")
    }
    static var cloud_sun_rain: UIImage? {
        return UIImage(systemName: "cloud.sun.rain")
    }
    static var cloud_sun_rain_fill: UIImage? {
        return UIImage(systemName: "cloud.sun.rain.fill")
    }
    static var cloud_sun_bolt: UIImage? {
        return UIImage(systemName: "cloud.sun.bolt")
    }
    static var cloud_sun_bolt_fill: UIImage? {
        return UIImage(systemName: "cloud.sun.bolt.fill")
    }
    static var cloud_moon: UIImage? {
        return UIImage(systemName: "cloud.moon")
    }
    static var cloud_moon_fill: UIImage? {
        return UIImage(systemName: "cloud.moon.fill")
    }
    static var cloud_moon_rain: UIImage? {
        return UIImage(systemName: "cloud.moon.rain")
    }
    static var cloud_moon_rain_fill: UIImage? {
        return UIImage(systemName: "cloud.moon.rain.fill")
    }
    static var cloud_moon_bolt: UIImage? {
        return UIImage(systemName: "cloud.moon.bolt")
    }
    static var cloud_moon_bolt_fill: UIImage? {
        return UIImage(systemName: "cloud.moon.bolt.fill")
    }
    static var smoke: UIImage? {
        return UIImage(systemName: "smoke")
    }
    static var smoke_fill: UIImage? {
        return UIImage(systemName: "smoke.fill")
    }
    static var wind: UIImage? {
        return UIImage(systemName: "wind")
    }
    static var wind_snow: UIImage? {
        return UIImage(systemName: "wind.snow")
    }
    static var tornado: UIImage? {
        return UIImage(systemName: "tornado")
    }
    static var tropicalstorm: UIImage? {
        return UIImage(systemName: "tropicalstorm")
    }
    static var hurricane: UIImage? {
        return UIImage(systemName: "hurricane")
    }
    static var thermometer_sun: UIImage? {
        return UIImage(systemName: "thermometer.sun")
    }
    static var thermometer_snowflake: UIImage? {
        return UIImage(systemName: "thermometer.snowflake")
    }
    static var thermometer: UIImage? {
        return UIImage(systemName: "thermometer")
    }
    static var umbrella: UIImage? {
        return UIImage(systemName: "umbrella")
    }
    static var umbrella_fill: UIImage? {
        return UIImage(systemName: "umbrella.fill")
    }
    static var flame: UIImage? {
        return UIImage(systemName: "flame")
    }
    static var flame_fill: UIImage? {
        return UIImage(systemName: "flame.fill")
    }
    static var light_min: UIImage? {
        return UIImage(systemName: "light.min")
    }
    static var light_max: UIImage? {
        return UIImage(systemName: "light.max")
    }
    static var rays: UIImage? {
        return UIImage(systemName: "rays")
    }
    static var slowmo: UIImage? {
        return UIImage(systemName: "slowmo")
    }
    static var timelapse: UIImage? {
        return UIImage(systemName: "timelapse")
    }
    static var keyboard: UIImage? {
        return UIImage(systemName: "keyboard")
    }
    static var keyboard_chevron_compact_down: UIImage? {
        return UIImage(systemName: "keyboard.chevron.compact.down")
    }
    static var rectangle_3_offgrid: UIImage? {
        return UIImage(systemName: "rectangle.3.offgrid")
    }
    static var rectangle_3_offgrid_fill: UIImage? {
        return UIImage(systemName: "rectangle.3.offgrid.fill")
    }
    static var square_grid_3x2: UIImage? {
        return UIImage(systemName: "square.grid.3x2")
    }
    static var square_grid_3x2_fill: UIImage? {
        return UIImage(systemName: "square.grid.3x2.fill")
    }
    static var rectangle_grid_3x2: UIImage? {
        return UIImage(systemName: "rectangle.grid.3x2")
    }
    static var rectangle_grid_3x2_fill: UIImage? {
        return UIImage(systemName: "rectangle.grid.3x2.fill")
    }
    static var square_grid_2x2: UIImage? {
        return UIImage(systemName: "square.grid.2x2")
    }
    static var square_grid_2x2_fill: UIImage? {
        return UIImage(systemName: "square.grid.2x2.fill")
    }
    static var rectangle_grid_2x2: UIImage? {
        return UIImage(systemName: "rectangle.grid.2x2")
    }
    static var rectangle_grid_2x2_fill: UIImage? {
        return UIImage(systemName: "rectangle.grid.2x2.fill")
    }
    static var square_grid_4x3_fill: UIImage? {
        return UIImage(systemName: "square.grid.4x3.fill")
    }
    static var rectangle_grid_1x2: UIImage? {
        return UIImage(systemName: "rectangle.grid.1x2")
    }
    static var rectangle_grid_1x2_fill: UIImage? {
        return UIImage(systemName: "rectangle.grid.1x2.fill")
    }
    static var circle_grid_3x3: UIImage? {
        return UIImage(systemName: "circle.grid.3x3")
    }
    static var circle_grid_3x3_fill: UIImage? {
        return UIImage(systemName: "circle.grid.3x3.fill")
    }
    static var checkmark_seal: UIImage? {
        return UIImage(systemName: "checkmark.seal")
    }
    static var checkmark_seal_fill: UIImage? {
        return UIImage(systemName: "checkmark.seal.fill")
    }
    static var xmark_seal: UIImage? {
        return UIImage(systemName: "xmark.seal")
    }
    static var xmark_seal_fill: UIImage? {
        return UIImage(systemName: "xmark.seal.fill")
    }
    static var exclamationmark_triangle: UIImage? {
        return UIImage(systemName: "exclamationmark.triangle")
    }
    static var exclamationmark_triangle_fill: UIImage? {
        return UIImage(systemName: "exclamationmark.triangle.fill")
    }
    static var drop_triangle: UIImage? {
        return UIImage(systemName: "drop.triangle")
    }
    static var drop_triangle_fill: UIImage? {
        return UIImage(systemName: "drop.triangle.fill")
    }
    static var play: UIImage? {
        return UIImage(systemName: "play")
    }
    static var play_fill: UIImage? {
        return UIImage(systemName: "play.fill")
    }
    static var play_circle: UIImage? {
        return UIImage(systemName: "play.circle")
    }
        
        
    static var play_circle_fill: UIImage? {
        return UIImage(systemName: "play.circle.fill")
    }
    static var play_rectangle: UIImage? {
        return UIImage(systemName: "play.rectangle")
    }
    static var play_rectangle_fill: UIImage? {
        return UIImage(systemName: "play.rectangle.fill")
    }
    static var pause: UIImage? {
        return UIImage(systemName: "pause")
    }
    static var pause_fill: UIImage? {
        return UIImage(systemName: "pause.fill")
    }
    static var pause_circle: UIImage? {
        return UIImage(systemName: "pause.circle")
    }
    static var pause_circle_fill: UIImage? {
        return UIImage(systemName: "pause.circle.fill")
    }
    static var pause_rectangle: UIImage? {
        return UIImage(systemName: "pause.rectangle")
    }
    static var pause_rectangle_fill: UIImage? {
        return UIImage(systemName: "pause.rectangle.fill")
    }
    static var stop: UIImage? {
        return UIImage(systemName: "stop")
    }
    static var stop_fill: UIImage? {
        return UIImage(systemName: "stop.fill")
    }
    static var stop_circle: UIImage? {
        return UIImage(systemName: "stop.circle")
    }
    static var stop_circle_fill: UIImage? {
        return UIImage(systemName: "stop.circle.fill")
    }
    static var playpause: UIImage? {
        return UIImage(systemName: "playpause")
    }
    static var playpause_fill: UIImage? {
        return UIImage(systemName: "playpause.fill")
    }
    static var backward: UIImage? {
        return UIImage(systemName: "backward")
    }
    static var backward_fill: UIImage? {
        return UIImage(systemName: "backward.fill")
    }
    static var forward: UIImage? {
        return UIImage(systemName: "forward")
    }
    static var forward_fill: UIImage? {
        return UIImage(systemName: "forward.fill")
    }
    static var backward_end: UIImage? {
        return UIImage(systemName: "backward.end")
    }
    static var backward_end_fill: UIImage? {
        return UIImage(systemName: "backward.end.fill")
    }
    static var forward_end: UIImage? {
        return UIImage(systemName: "forward.end")
    }
    static var forward_end_fill: UIImage? {
        return UIImage(systemName: "forward.end.fill")
    }
    static var backward_end_alt: UIImage? {
        return UIImage(systemName: "backward.end.alt")
    }
    static var backward_end_alt_fill: UIImage? {
        return UIImage(systemName: "backward.end.alt.fill")
    }
    static var forward_end_alt: UIImage? {
        return UIImage(systemName: "forward.end.alt")
    }
    static var forward_end_alt_fill: UIImage? {
        return UIImage(systemName: "forward.end.alt.fill")
    }
    static var eject: UIImage? {
        return UIImage(systemName: "eject")
    }
    static var eject_fill: UIImage? {
        return UIImage(systemName: "eject.fill")
    }
    static var memories: UIImage? {
        return UIImage(systemName: "memories")
    }
    static var memories_badge_plus: UIImage? {
        return UIImage(systemName: "memories.badge.plus")
    }
    static var memories_badge_minus: UIImage? {
        return UIImage(systemName: "memories.badge.minus")
    }
    static var shuffle: UIImage? {
        return UIImage(systemName: "shuffle")
    }
    static var repeat_Image: UIImage? {
        return UIImage(systemName: "repeat")
    }
    static var repeat_1: UIImage? {
        return UIImage(systemName: "repeat.1")
    }
    static var speaker: UIImage? {
        return UIImage(systemName: "speaker")
    }
    static var speaker_fill: UIImage? {
        return UIImage(systemName: "speaker.fill")
    }
    static var speaker_slash: UIImage? {
        return UIImage(systemName: "speaker.slash")
    }
    static var speaker_slash_fill: UIImage? {
        return UIImage(systemName: "speaker.slash.fill")
    }
    static var speaker_zzz: UIImage? {
        return UIImage(systemName: "speaker.zzz")
    }
    static var speaker_zzz_fill: UIImage? {
        return UIImage(systemName: "speaker.zzz.fill")
    }
    static var badge_plus_radiowaves_right: UIImage? {
        return UIImage(systemName: "badge.plus.radiowaves.right")
    }
    static var music_note: UIImage? {
        return UIImage(systemName: "music.note")
    }
    static var music_note_list: UIImage? {
        return UIImage(systemName: "music.note.list")
    }
    static var music_mic: UIImage? {
        return UIImage(systemName: "music.mic")
    }
    static var goforward: UIImage? {
        return UIImage(systemName: "goforward")
    }
    static var gobackward: UIImage? {
        return UIImage(systemName: "gobackward")
    }
    static var goforward_10: UIImage? {
        return UIImage(systemName: "goforward.10")
    }
    static var gobackward_10: UIImage? {
        return UIImage(systemName: "gobackward.10")
    }
    static var goforward_15: UIImage? {
        return UIImage(systemName: "goforward.15")
    }
    static var gobackward_15: UIImage? {
        return UIImage(systemName: "gobackward.15")
    }
    static var goforward_30: UIImage? {
        return UIImage(systemName: "goforward.30")
    }
    static var gobackward_30: UIImage? {
        return UIImage(systemName: "gobackward.30")
    }
    static var goforward_45: UIImage? {
        return UIImage(systemName: "goforward.45")
    }
    static var gobackward_45: UIImage? {
        return UIImage(systemName: "gobackward.45")
    }
    static var goforward_60: UIImage? {
        return UIImage(systemName: "goforward.60")
    }
    static var gobackward_60: UIImage? {
        return UIImage(systemName: "gobackward.60")
    }
    static var goforward_75: UIImage? {
        return UIImage(systemName: "goforward.75")
    }
    static var gobackward_75: UIImage? {
        return UIImage(systemName: "gobackward.75")
    }
    static var goforward_90: UIImage? {
        return UIImage(systemName: "goforward.90")
    }
    static var gobackward_90: UIImage? {
        return UIImage(systemName: "gobackward.90")
    }
    static var goforward_plus: UIImage? {
        return UIImage(systemName: "goforward.plus")
    }
    static var gobackward_minus: UIImage? {
        return UIImage(systemName: "gobackward.minus")
    }
    static var magnifyingglass: UIImage? {
        return UIImage(systemName: "magnifyingglass")
    }
    static var magnifyingglass_circle: UIImage? {
        return UIImage(systemName: "magnifyingglass.circle")
    }
    static var magnifyingglass_circle_fill: UIImage? {
        return UIImage(systemName: "magnifyingglass.circle.fill")
    }
    static var plus_magnifyingglass: UIImage? {
        return UIImage(systemName: "plus.magnifyingglass")
    }
    static var minus_magnifyingglass: UIImage? {
        return UIImage(systemName: "minus.magnifyingglass")
    }
    static var magnifyingglass_1: UIImage? {
        return UIImage(systemName: "1.magnifyingglass")
    }
    static var mic: UIImage? {
        return UIImage(systemName: "mic")
    }
    static var mic_fill: UIImage? {
        return UIImage(systemName: "mic.fill")
    }
    static var mic_circle: UIImage? {
        return UIImage(systemName: "mic.circle")
    }
    static var mic_circle_fill: UIImage? {
        return UIImage(systemName: "mic.circle.fill")
    }
    static var mic_slash: UIImage? {
        return UIImage(systemName: "mic.slash")
    }
    static var mic_slash_fill: UIImage? {
        return UIImage(systemName: "mic.slash.fill")
    }
    static var circle: UIImage? {
        return UIImage(systemName: "circle")
    }
    static var circle_fill: UIImage? {
        return UIImage(systemName: "circle.fill")
    }
    static var smallcircle_fill_circle: UIImage? {
        return UIImage(systemName: "smallcircle.fill.circle")
    }
    static var smallcircle_fill_circle_fill: UIImage? {
        return UIImage(systemName: "smallcircle.fill.circle.fill")
    }
    static var smallcircle_circle: UIImage? {
        return UIImage(systemName: "smallcircle.circle")
    }
    static var smallcircle_circle_fill: UIImage? {
        return UIImage(systemName: "smallcircle.circle.fill")
    }
    static var capsule: UIImage? {
        return UIImage(systemName: "capsule")
    }
    static var capsule_fill: UIImage? {
        return UIImage(systemName: "capsule.fill")
    }
    static var square: UIImage? {
        return UIImage(systemName: "square")
    }
    static var square_fill: UIImage? {
        return UIImage(systemName: "square.fill")
    }
    static var square_split_2x1: UIImage? {
        return UIImage(systemName: "square.split.2x1")
    }
    static var square_split_2x1_fill: UIImage? {
        return UIImage(systemName: "square.split.2x1.fill")
    }
    static var square_split_1x2: UIImage? {
        return UIImage(systemName: "square.split.1x2")
    }
    static var square_split_1x2_fill: UIImage? {
        return UIImage(systemName: "square.split.1x2.fill")
    }
    static var square_split_2x2: UIImage? {
        return UIImage(systemName: "square.split.2x2")
    }
    static var square_split_2x2_fill: UIImage? {
        return UIImage(systemName: "square.split.2x2.fill")
    }
    static var dot_square: UIImage? {
        return UIImage(systemName: "dot.square")
    }
    static var dot_square_fill: UIImage? {
        return UIImage(systemName: "dot.square.fill")
    }
    static var square_on_square: UIImage? {
        return UIImage(systemName: "square.on.square")
    }
    static var square_fill_on_square_fill: UIImage? {
        return UIImage(systemName: "square.fill.on.square.fill")
    }
    static var plus_square_on_square: UIImage? {
        return UIImage(systemName: "plus.square.on.square")
    }
    static var plus_square_fill_on_square_fill: UIImage? {
        return UIImage(systemName: "plus.square.fill.on.square.fill")
    }
    static var square_on_circle: UIImage? {
        return UIImage(systemName: "square.on.circle")
    }
    static var square_fill_on_circle_fill: UIImage? {
        return UIImage(systemName: "square.fill.on.circle.fill")
    }
    static var square_stack: UIImage? {
        return UIImage(systemName: "square.stack")
    }
    static var square_stack_fill: UIImage? {
        return UIImage(systemName: "square.stack.fill")
    }
    static var app: UIImage? {
        return UIImage(systemName: "app")
    }
    static var app_fill: UIImage? {
        return UIImage(systemName: "app.fill")
    }
    static var rectangle: UIImage? {
        return UIImage(systemName: "rectangle")
    }
    static var rectangle_fill: UIImage? {
        return UIImage(systemName: "rectangle.fill")
    }
    static var rectangle_split_3x1: UIImage? {
        return UIImage(systemName: "rectangle.split.3x1")
    }
    static var rectangle_split_3x1_fill: UIImage? {
        return UIImage(systemName: "rectangle.split.3x1.fill")
    }
    static var rectangle_split_3x3: UIImage? {
        return UIImage(systemName: "rectangle.split.3x3")
    }
    static var rectangle_on_rectangle: UIImage? {
        return UIImage(systemName: "rectangle.on.rectangle")
    }
    static var rectangle_fill_on_rectangle_fill: UIImage? {
        return UIImage(systemName: "rectangle.fill.on.rectangle.fill")
    }
    static var plus_rectangle_on_rectangle: UIImage? {
        return UIImage(systemName: "plus.rectangle.on.rectangle")
    }
    static var plus_rectangle_fill_on_rectangle_fill: UIImage? {
        return UIImage(systemName: "plus.rectangle.fill.on.rectangle.fill")
    }
    static var triangle: UIImage? {
        return UIImage(systemName: "triangle")
    }
    static var triangle_fill: UIImage? {
        return UIImage(systemName: "triangle.fill")
    }
    static var hexagon: UIImage? {
        return UIImage(systemName: "hexagon")
    }
    static var hexagon_fill: UIImage? {
        return UIImage(systemName: "hexagon.fill")
    }
    static var suit_heart: UIImage? {
        return UIImage(systemName: "suit.heart")
    }
    static var suit_heart_fill: UIImage? {
        return UIImage(systemName: "suit.heart.fill")
    }
    static var suit_club: UIImage? {
        return UIImage(systemName: "suit.club")
    }
    static var suit_club_fill: UIImage? {
        return UIImage(systemName: "suit.club.fill")
    }
    static var suit_spade: UIImage? {
        return UIImage(systemName: "suit.spade")
    }
    static var suit_spade_fill: UIImage? {
        return UIImage(systemName: "suit.spade.fill")
    }
    static var suit_diamond: UIImage? {
        return UIImage(systemName: "suit.diamond")
    }
    static var suit_diamond_fill: UIImage? {
        return UIImage(systemName: "suit.diamond.fill")
    }
    static var heart: UIImage? {
        return UIImage(systemName: "heart")
    }
    static var heart_fill: UIImage? {
        return UIImage(systemName: "heart.fill")
    }
    static var heart_circle: UIImage? {
        return UIImage(systemName: "heart.circle")
    }
    static var heart_circle_fill: UIImage? {
        return UIImage(systemName: "heart.circle.fill")
    }
    static var heart_slash: UIImage? {
        return UIImage(systemName: "heart.slash")
    }
    static var heart_slash_fill: UIImage? {
        return UIImage(systemName: "heart.slash.fill")
    }
    static var heart_slash_circle: UIImage? {
        return UIImage(systemName: "heart.slash.circle")
    }
    static var heart_slash_circle_fill: UIImage? {
        return UIImage(systemName: "heart.slash.circle.fill")
    }
    static var rhombus: UIImage? {
        return UIImage(systemName: "rhombus")
    }
    static var rhombus_fill: UIImage? {
        return UIImage(systemName: "rhombus.fill")
    }
    static var star: UIImage? {
        return UIImage(systemName: "star")
    }
    static var star_fill: UIImage? {
        return UIImage(systemName: "star.fill")
    }
    static var star_circle: UIImage? {
        return UIImage(systemName: "star.circle")
    }
    static var star_circle_fill: UIImage? {
        return UIImage(systemName: "star.circle.fill")
    }
    static var star_slash: UIImage? {
        return UIImage(systemName: "star.slash")
    }
    static var star_slash_fill: UIImage? {
        return UIImage(systemName: "star.slash.fill")
    }
    static var flag: UIImage? {
        return UIImage(systemName: "flag")
    }
    static var flag_fill: UIImage? {
        return UIImage(systemName: "flag.fill")
    }
    static var flag_circle: UIImage? {
        return UIImage(systemName: "flag.circle")
    }
    static var flag_circle_fill: UIImage? {
        return UIImage(systemName: "flag.circle.fill")
    }
    static var flag_slash: UIImage? {
        return UIImage(systemName: "flag.slash")
    }
    static var flag_slash_fill: UIImage? {
        return UIImage(systemName: "flag.slash.fill")
    }
    static var location: UIImage? {
        return UIImage(systemName: "location")
    }
    static var location_fill: UIImage? {
        return UIImage(systemName: "location.fill")
    }
    static var location_slash: UIImage? {
        return UIImage(systemName: "location.slash")
    }
    static var location_slash_fill: UIImage? {
        return UIImage(systemName: "location.slash.fill")
    }
    static var location_north: UIImage? {
        return UIImage(systemName: "location.north")
    }
    static var location_north_fill: UIImage? {
        return UIImage(systemName: "location.north.fill")
    }
    static var location_circle: UIImage? {
        return UIImage(systemName: "location.circle")
    }
    static var location_circle_fill: UIImage? {
        return UIImage(systemName: "location.circle.fill")
    }
    static var location_north_line: UIImage? {
        return UIImage(systemName: "location.north.line")
    }
    static var location_north_line_fill: UIImage? {
        return UIImage(systemName: "location.north.line.fill")
    }
    static var bell: UIImage? {
        return UIImage(systemName: "bell")
    }
    static var bell_fill: UIImage? {
        return UIImage(systemName: "bell.fill")
    }
    static var bell_circle: UIImage? {
        return UIImage(systemName: "bell.circle")
    }
    static var bell_circle_fill: UIImage? {
        return UIImage(systemName: "bell.circle.fill")
    }
    static var bell_slash: UIImage? {
        return UIImage(systemName: "bell.slash")
    }
    static var bell_slash_fill: UIImage? {
        return UIImage(systemName: "bell.slash.fill")
    }
    static var tag: UIImage? {
        return UIImage(systemName: "tag")
    }
    static var tag_fill: UIImage? {
        return UIImage(systemName: "tag.fill")
    }
    static var tag_circle: UIImage? {
        return UIImage(systemName: "tag.circle")
    }
    static var tag_circle_fill: UIImage? {
        return UIImage(systemName: "tag.circle.fill")
    }
    static var bolt: UIImage? {
        return UIImage(systemName: "bolt")
    }
    static var bolt_fill: UIImage? {
        return UIImage(systemName: "bolt.fill")
    }
    static var bolt_circle: UIImage? {
        return UIImage(systemName: "bolt.circle")
    }
    static var bolt_circle_fill: UIImage? {
        return UIImage(systemName: "bolt.circle.fill")
    }
    static var bolt_slash: UIImage? {
        return UIImage(systemName: "bolt.slash")
    }
    static var bolt_slash_fill: UIImage? {
        return UIImage(systemName: "bolt.slash.fill")
    }
    static var bolt_badge_a: UIImage? {
        return UIImage(systemName: "bolt.badge.a")
    }
    static var bolt_badge_a_fill: UIImage? {
        return UIImage(systemName: "bolt.badge.a.fill")
    }
    static var bolt_horizontal: UIImage? {
        return UIImage(systemName: "bolt.horizontal")
    }
    static var bolt_horizontal_fill: UIImage? {
        return UIImage(systemName: "bolt.horizontal.fill")
    }
    static var bolt_horizontal_circle: UIImage? {
        return UIImage(systemName: "bolt.horizontal.circle")
    }
    static var bolt_horizontal_circle_fill: UIImage? {
        return UIImage(systemName: "bolt.horizontal.circle.fill")
    }
    static var eye: UIImage? {
        return UIImage(systemName: "eye")
    }
    static var eye_fill: UIImage? {
        return UIImage(systemName: "eye.fill")
    }
    static var eye_slash: UIImage? {
        return UIImage(systemName: "eye.slash")
    }
    static var eye_slash_fill: UIImage? {
        return UIImage(systemName: "eye.slash.fill")
    }
    static var eyeglasses: UIImage? {
        return UIImage(systemName: "eyeglasses")
    }
    static var icloud: UIImage? {
        return UIImage(systemName: "icloud")
    }
    static var icloud_fill: UIImage? {
        return UIImage(systemName: "icloud.fill")
    }
    static var icloud_circle: UIImage? {
        return UIImage(systemName: "icloud.circle")
    }
    static var icloud_circle_fill: UIImage? {
        return UIImage(systemName: "icloud.circle.fill")
    }
    static var icloud_slash: UIImage? {
        return UIImage(systemName: "icloud.slash")
    }
    static var icloud_slash_fill: UIImage? {
        return UIImage(systemName: "icloud.slash.fill")
    }
    static var exclamationmark_icloud: UIImage? {
        return UIImage(systemName: "exclamationmark.icloud")
    }
    static var exclamationmark_icloud_fill: UIImage? {
        return UIImage(systemName: "exclamationmark.icloud.fill")
    }
    static var xmark_icloud: UIImage? {
        return UIImage(systemName: "xmark.icloud")
    }
    static var xmark_icloud_fill: UIImage? {
        return UIImage(systemName: "xmark.icloud.fill")
    }
    static var link_icloud: UIImage? {
        return UIImage(systemName: "link.icloud")
    }
    static var link_icloud_fill: UIImage? {
        return UIImage(systemName: "link.icloud.fill")
    }
    static var bolt_horizontal_icloud: UIImage? {
        return UIImage(systemName: "bolt.horizontal.icloud")
    }
    static var bolt_horizontal_icloud_fill: UIImage? {
        return UIImage(systemName: "bolt.horizontal.icloud.fill")
    }
    static var person_icloud: UIImage? {
        return UIImage(systemName: "person.icloud")
    }
    static var person_icloud_fill: UIImage? {
        return UIImage(systemName: "person.icloud.fill")
    }
    static var lock_icloud: UIImage? {
        return UIImage(systemName: "lock.icloud")
    }
    static var lock_icloud_fill: UIImage? {
        return UIImage(systemName: "lock.icloud.fill")
    }
    static var arrow_clockwise_icloud: UIImage? {
        return UIImage(systemName: "arrow.clockwise.icloud")
    }
    static var arrow_clockwise_icloud_fill: UIImage? {
        return UIImage(systemName: "arrow.clockwise.icloud.fill")
    }
    static var arrow_counterclockwise_icloud: UIImage? {
        return UIImage(systemName: "arrow.counterclockwise.icloud")
    }
    static var arrow_counterclockwise_icloud_fill: UIImage? {
        return UIImage(systemName: "arrow.counterclockwise.icloud.fill")
    }
    static var icloud_and_arrow_down: UIImage? {
        return UIImage(systemName: "icloud.and.arrow.down")
    }
    static var icloud_and_arrow_down_fill: UIImage? {
        return UIImage(systemName: "icloud.and.arrow.down.fill")
    }
    static var icloud_and_arrow_up: UIImage? {
        return UIImage(systemName: "icloud.and.arrow.up")
    }
    static var icloud_and_arrow_up_fill: UIImage? {
        return UIImage(systemName: "icloud.and.arrow.up.fill")
    }
    static var camera: UIImage? {
        return UIImage(systemName: "camera")
    }
    static var camera_fill: UIImage? {
        return UIImage(systemName: "camera.fill")
    }
    static var camera_circle: UIImage? {
        return UIImage(systemName: "camera.circle")
    }
    static var camera_circle_fill: UIImage? {
        return UIImage(systemName: "camera.circle.fill")
    }
    static var camera_on_rectangle: UIImage? {
        return UIImage(systemName: "camera.on.rectangle")
    }
    static var camera_on_rectangle_fill: UIImage? {
        return UIImage(systemName: "camera.on.rectangle.fill")
    }
    static var message: UIImage? {
        return UIImage(systemName: "message")
    }
    static var message_fill: UIImage? {
        return UIImage(systemName: "message.fill")
    }
    static var message_circle: UIImage? {
        return UIImage(systemName: "message.circle")
    }
    static var message_circle_fill: UIImage? {
        return UIImage(systemName: "message.circle.fill")
    }
    static var bubble_right: UIImage? {
        return UIImage(systemName: "bubble.right")
    }
    static var bubble_right_fill: UIImage? {
        return UIImage(systemName: "bubble.right.fill")
    }
    static var bubble_left: UIImage? {
        return UIImage(systemName: "bubble.left")
    }
    static var bubble_left_fill: UIImage? {
        return UIImage(systemName: "bubble.left.fill")
    }
    static var exclamationmark_bubble: UIImage? {
        return UIImage(systemName: "exclamationmark.bubble")
    }
    static var exclamationmark_bubble_fill: UIImage? {
        return UIImage(systemName: "exclamationmark.bubble.fill")
    }
    static var quote_bubble: UIImage? {
        return UIImage(systemName: "quote.bubble")
    }
    static var quote_bubble_fill: UIImage? {
        return UIImage(systemName: "quote.bubble.fill")
    }
    static var text_bubble: UIImage? {
        return UIImage(systemName: "text.bubble")
    }
    static var text_bubble_fill: UIImage? {
        return UIImage(systemName: "text.bubble.fill")
    }
    static var captions_bubble: UIImage? {
        return UIImage(systemName: "captions.bubble")
    }
    static var captions_bubble_fill: UIImage? {
        return UIImage(systemName: "captions.bubble.fill")
    }
    static var plus_bubble: UIImage? {
        return UIImage(systemName: "plus.bubble")
    }
    static var plus_bubble_fill: UIImage? {
        return UIImage(systemName: "plus.bubble.fill")
    }
    static var bubble_middle_bottom: UIImage? {
        return UIImage(systemName: "bubble.middle.bottom")
    }
    static var bubble_middle_bottom_fill: UIImage? {
        return UIImage(systemName: "bubble.middle.bottom.fill")
    }
    static var bubble_middle_top: UIImage? {
        return UIImage(systemName: "bubble.middle.top")
    }
    static var bubble_middle_top_fill: UIImage? {
        return UIImage(systemName: "bubble.middle.top.fill")
    }
    static var bubble_left_and_bubble_right: UIImage? {
        return UIImage(systemName: "bubble.left.and.bubble.right")
    }
    static var bubble_left_and_bubble_right_fill: UIImage? {
        return UIImage(systemName: "bubble.left.and.bubble.right.fill")
    }
    static var phone: UIImage? {
        return UIImage(systemName: "phone")
    }
    static var phone_fill: UIImage? {
        return UIImage(systemName: "phone.fill")
    }
    static var phone_circle: UIImage? {
        return UIImage(systemName: "phone.circle")
    }
    static var phone_circle_fill: UIImage? {
        return UIImage(systemName: "phone.circle.fill")
    }
    static var phone_badge_plus: UIImage? {
        return UIImage(systemName: "phone.badge.plus")
    }
    static var phone_fill_badge_plus: UIImage? {
        return UIImage(systemName: "phone.fill.badge.plus")
    }
    static var phone_arrow_up_right: UIImage? {
        return UIImage(systemName: "phone.arrow.up.right")
    }
    static var phone_fill_arrow_up_right: UIImage? {
        return UIImage(systemName: "phone.fill.arrow.up.right")
    }
    static var phone_arrow_down_left: UIImage? {
        return UIImage(systemName: "phone.arrow.down.left")
    }
    static var phone_fill_arrow_down_left: UIImage? {
        return UIImage(systemName: "phone.fill.arrow.down.left")
    }
    static var phone_arrow_right: UIImage? {
        return UIImage(systemName: "phone.arrow.right")
    }
    static var phone_fill_arrow_right: UIImage? {
        return UIImage(systemName: "phone.fill.arrow.right")
    }
    static var phone_down: UIImage? {
        return UIImage(systemName: "phone.down")
    }
    static var phone_down_fill: UIImage? {
        return UIImage(systemName: "phone.down.fill")
    }
    static var phone_down_circle: UIImage? {
        return UIImage(systemName: "phone.down.circle")
    }
    static var phone_down_circle_fill: UIImage? {
        return UIImage(systemName: "phone.down.circle.fill")
    }
    static var teletype: UIImage? {
        return UIImage(systemName: "teletype")
    }
    static var teletype_answer: UIImage? {
        return UIImage(systemName: "teletype.answer")
    }
    static var video: UIImage? {
        return UIImage(systemName: "video")
    }
    static var video_fill: UIImage? {
        return UIImage(systemName: "video.fill")
    }
    static var video_circle: UIImage? {
        return UIImage(systemName: "video.circle")
    }
    static var video_circle_fill: UIImage? {
        return UIImage(systemName: "video.circle.fill")
    }
    static var video_slash: UIImage? {
        return UIImage(systemName: "video.slash")
    }
    static var video_slash_fill: UIImage? {
        return UIImage(systemName: "video.slash.fill")
    }
    static var video_badge_plus: UIImage? {
        return UIImage(systemName: "video.badge.plus")
    }
    static var arrow_up_right_video: UIImage? {
        return UIImage(systemName: "arrow.up.right.video")
    }
    static var arrow_up_right_video_fill: UIImage? {
        return UIImage(systemName: "arrow.up.right.video.fill")
    }
    static var arrow_down_left_video: UIImage? {
        return UIImage(systemName: "arrow.down.left.video")
    }
    static var arrow_down_left_video_fill: UIImage? {
        return UIImage(systemName: "arrow.down.left.video.fill")
    }
    static var questionmark_video: UIImage? {
        return UIImage(systemName: "questionmark.video")
    }
    static var questionmark_video_fill: UIImage? {
        return UIImage(systemName: "questionmark.video.fill")
    }
    static var envelope: UIImage? {
        return UIImage(systemName: "envelope")
    }
    static var envelope_fill: UIImage? {
        return UIImage(systemName: "envelope.fill")
    }
    static var envelope_circle: UIImage? {
        return UIImage(systemName: "envelope.circle")
    }
    static var envelope_circle_fill: UIImage? {
        return UIImage(systemName: "envelope.circle.fill")
    }
    static var envelope_open: UIImage? {
        return UIImage(systemName: "envelope.open")
    }
    static var envelope_open_fill: UIImage? {
        return UIImage(systemName: "envelope.open.fill")
    }
    static var envelope_badge: UIImage? {
        return UIImage(systemName: "envelope.badge")
    }
    static var envelope_badge_fill: UIImage? {
        return UIImage(systemName: "envelope.badge.fill")
    }
    static var gear: UIImage? {
        return UIImage(systemName: "gear")
    }
    static var signature: UIImage? {
        return UIImage(systemName: "signature")
    }
    static var scissors: UIImage? {
        return UIImage(systemName: "scissors")
    }
    static var ellipsis: UIImage? {
        return UIImage(systemName: "ellipsis")
    }
    static var ellipsis_circle: UIImage? {
        return UIImage(systemName: "ellipsis.circle")
    }
    static var ellipsis_circle_fill: UIImage? {
        return UIImage(systemName: "ellipsis.circle.fill")
    }
    static var bag: UIImage? {
        return UIImage(systemName: "bag")
    }
    static var bag_fill: UIImage? {
        return UIImage(systemName: "bag.fill")
    }
    static var bag_badge_plus: UIImage? {
        return UIImage(systemName: "bag.badge.plus")
    }
    static var bag_fill_badge_plus: UIImage? {
        return UIImage(systemName: "bag.fill.badge.plus")
    }
    static var bag_badge_minus: UIImage? {
        return UIImage(systemName: "bag.badge.minus")
    }
    static var bag_fill_badge_minus: UIImage? {
        return UIImage(systemName: "bag.fill.badge.minus")
    }
    static var cart: UIImage? {
        return UIImage(systemName: "cart")
    }
    static var cart_fill: UIImage? {
        return UIImage(systemName: "cart.fill")
    }
    static var cart_badge_plus: UIImage? {
        return UIImage(systemName: "cart.badge.plus")
    }
    static var cart_fill_badge_plus: UIImage? {
        return UIImage(systemName: "cart.fill.badge.plus")
    }
    static var cart_badge_minus: UIImage? {
        return UIImage(systemName: "cart.badge.minus")
    }
    static var cart_fill_badge_minus: UIImage? {
        return UIImage(systemName: "cart.fill.badge.minus")
    }
    static var creditcard: UIImage? {
        return UIImage(systemName: "creditcard")
    }
    static var creditcard_fill: UIImage? {
        return UIImage(systemName: "creditcard.fill")
    }
    static var wand_and_rays: UIImage? {
        return UIImage(systemName: "wand.and.rays")
    }
    static var wand_and_rays_inverse: UIImage? {
        return UIImage(systemName: "wand.and.rays.inverse")
    }
    static var wand_and_stars: UIImage? {
        return UIImage(systemName: "wand.and.stars")
    }
    static var wand_and_stars_inverse: UIImage? {
        return UIImage(systemName: "wand.and.stars.inverse")
    }
    static var crop: UIImage? {
        return UIImage(systemName: "crop")
    }
    static var crop_rotate: UIImage? {
        return UIImage(systemName: "crop.rotate")
    }
    static var nosign: UIImage? {
        return UIImage(systemName: "nosign")
    }
    static var gauge: UIImage? {
        return UIImage(systemName: "gauge")
    }
    static var gauge_badge_plus: UIImage? {
        return UIImage(systemName: "gauge.badge.plus")
    }
    static var gauge_badge_minus: UIImage? {
        return UIImage(systemName: "gauge.badge.minus")
    }
    static var speedometer: UIImage? {
        return UIImage(systemName: "speedometer")
    }
    static var metronome: UIImage? {
        return UIImage(systemName: "metronome")
    }
    static var tuningfork: UIImage? {
        return UIImage(systemName: "tuningfork")
    }
    static var paintbrush: UIImage? {
        return UIImage(systemName: "paintbrush")
    }
    static var paintbrush_fill: UIImage? {
        return UIImage(systemName: "paintbrush.fill")
    }
    static var bandage: UIImage? {
        return UIImage(systemName: "bandage")
    }
    static var bandage_fill: UIImage? {
        return UIImage(systemName: "bandage.fill")
    }
    static var wrench: UIImage? {
        return UIImage(systemName: "wrench")
    }
    static var wrench_fill: UIImage? {
        return UIImage(systemName: "wrench.fill")
    }
    static var hammer: UIImage? {
        return UIImage(systemName: "hammer")
    }
    static var hammer_fill: UIImage? {
        return UIImage(systemName: "hammer.fill")
    }
    static var eyedropper: UIImage? {
        return UIImage(systemName: "eyedropper")
    }
    static var eyedropper_halffull: UIImage? {
        return UIImage(systemName: "eyedropper.halffull")
    }
    static var eyedropper_full: UIImage? {
        return UIImage(systemName: "eyedropper.full")
    }
    static var printer: UIImage? {
        return UIImage(systemName: "printer")
    }
    static var printer_fill: UIImage? {
        return UIImage(systemName: "printer.fill")
    }
    static var briefcase: UIImage? {
        return UIImage(systemName: "briefcase")
    }
    static var briefcase_fill: UIImage? {
        return UIImage(systemName: "briefcase.fill")
    }
    static var house: UIImage? {
        return UIImage(systemName: "house")
    }
    static var house_fill: UIImage? {
        return UIImage(systemName: "house.fill")
    }
    static var lock: UIImage? {
        return UIImage(systemName: "lock")
    }
    static var lock_fill: UIImage? {
        return UIImage(systemName: "lock.fill")
    }
    static var lock_circle: UIImage? {
        return UIImage(systemName: "lock.circle")
    }
    static var lock_circle_fill: UIImage? {
        return UIImage(systemName: "lock.circle.fill")
    }
    static var lock_shield: UIImage? {
        return UIImage(systemName: "lock.shield")
    }
    static var lock_shield_fill: UIImage? {
        return UIImage(systemName: "lock.shield.fill")
    }
    static var lock_slash: UIImage? {
        return UIImage(systemName: "lock.slash")
    }
    static var lock_slash_fill: UIImage? {
        return UIImage(systemName: "lock.slash.fill")
    }
    static var lock_open: UIImage? {
        return UIImage(systemName: "lock.open")
    }
    static var lock_open_fill: UIImage? {
        return UIImage(systemName: "lock.open.fill")
    }
    static var lock_rotation: UIImage? {
        return UIImage(systemName: "lock.rotation")
    }
    static var lock_rotation_open: UIImage? {
        return UIImage(systemName: "lock.rotation.open")
    }
    static var wifi: UIImage? {
        return UIImage(systemName: "wifi")
    }
    static var wifi_slash: UIImage? {
        return UIImage(systemName: "wifi.slash")
    }
    static var wifi_exclamationmark: UIImage? {
        return UIImage(systemName: "wifi.exclamationmark")
    }
    static var pin: UIImage? {
        return UIImage(systemName: "pin")
    }
    static var pin_fill: UIImage? {
        return UIImage(systemName: "pin.fill")
    }
    static var pin_slash: UIImage? {
        return UIImage(systemName: "pin.slash")
    }
    static var pin_slash_fill: UIImage? {
        return UIImage(systemName: "pin.slash.fill")
    }
    static var mappin: UIImage? {
        return UIImage(systemName: "mappin")
    }
    static var mappin_slash: UIImage? {
        return UIImage(systemName: "mappin.slash")
    }
    static var mappin_and_ellipse: UIImage? {
        return UIImage(systemName: "mappin.and.ellipse")
    }
    static var map: UIImage? {
        return UIImage(systemName: "map")
    }
    static var map_fill: UIImage? {
        return UIImage(systemName: "map.fill")
    }
    static var safari: UIImage? {
        return UIImage(systemName: "safari")
    }
    static var safari_fill: UIImage? {
        return UIImage(systemName: "safari.fill")
    }
    static var rotate_left: UIImage? {
        return UIImage(systemName: "rotate.left")
    }
    static var rotate_left_fill: UIImage? {
        return UIImage(systemName: "rotate.left.fill")
    }
    static var rotate_right: UIImage? {
        return UIImage(systemName: "rotate.right")
    }
    static var rotate_right_fill: UIImage? {
        return UIImage(systemName: "rotate.right.fill")
    }
    static var selection_pin_in_out: UIImage? {
        return UIImage(systemName: "selection.pin.in.out")
    }
    static var desktopcomputer: UIImage? {
        return UIImage(systemName: "desktopcomputer")
    }
    static var headphones: UIImage? {
        return UIImage(systemName: "headphones")
    }
    static var hifispeaker: UIImage? {
        return UIImage(systemName: "hifispeaker")
    }
    static var hifispeaker_fill: UIImage? {
        return UIImage(systemName: "hifispeaker.fill")
    }
    static var tv: UIImage? {
        return UIImage(systemName: "tv")
    }
    static var tv_fill: UIImage? {
        return UIImage(systemName: "tv.fill")
    }
    static var tv_circle: UIImage? {
        return UIImage(systemName: "tv.circle")
    }
    static var tv_circle_fill: UIImage? {
        return UIImage(systemName: "tv.circle.fill")
    }
    static var airplayvideo: UIImage? {
        return UIImage(systemName: "airplayvideo")
    }
    static var airplayaudio: UIImage? {
        return UIImage(systemName: "airplayaudio")
    }
    static var dot_radiowaves_left_and_right: UIImage? {
        return UIImage(systemName: "dot.radiowaves.left.and.right")
    }
    static var dot_radiowaves_right: UIImage? {
        return UIImage(systemName: "dot.radiowaves.right")
    }
    static var antenna_radiowaves_left_and_right: UIImage? {
        return UIImage(systemName: "antenna.radiowaves.left.and.right")
    }
    static var guitars: UIImage? {
        return UIImage(systemName: "guitars")
    }
    static var airplane: UIImage? {
        return UIImage(systemName: "airplane")
    }
    static var car_fill: UIImage? {
        return UIImage(systemName: "car.fill")
    }
    static var tram_fill: UIImage? {
        return UIImage(systemName: "tram.fill")
    }
    static var bed_double: UIImage? {
        return UIImage(systemName: "bed.double")
    }
    static var bed_double_fill: UIImage? {
        return UIImage(systemName: "bed.double.fill")
    }
    static var hare: UIImage? {
        return UIImage(systemName: "hare")
    }
    static var hare_fill: UIImage? {
        return UIImage(systemName: "hare.fill")
    }
    static var tortoise: UIImage? {
        return UIImage(systemName: "tortoise")
    }
    static var tortoise_fill: UIImage? {
        return UIImage(systemName: "tortoise.fill")
    }
    static var ant: UIImage? {
        return UIImage(systemName: "ant")
    }
    static var ant_fill: UIImage? {
        return UIImage(systemName: "ant.fill")
    }
    static var ant_circle: UIImage? {
        return UIImage(systemName: "ant.circle")
    }
    static var ant_circle_fill: UIImage? {
        return UIImage(systemName: "ant.circle.fill")
    }
    static var film: UIImage? {
        return UIImage(systemName: "film")
    }
    static var film_fill: UIImage? {
        return UIImage(systemName: "film.fill")
    }
    static var sportscourt: UIImage? {
        return UIImage(systemName: "sportscourt")
    }
    static var sportscourt_fill: UIImage? {
        return UIImage(systemName: "sportscourt.fill")
    }
    static var qrcode: UIImage? {
        return UIImage(systemName: "qrcode")
    }
    static var barcode: UIImage? {
        return UIImage(systemName: "barcode")
    }
    static var viewfinder: UIImage? {
        return UIImage(systemName: "viewfinder")
    }
    static var viewfinder_circle: UIImage? {
        return UIImage(systemName: "viewfinder.circle")
    }
    static var viewfinder_circle_fill: UIImage? {
        return UIImage(systemName: "viewfinder.circle.fill")
    }
    static var barcode_viewfinder: UIImage? {
        return UIImage(systemName: "barcode.viewfinder")
    }
    static var qrcode_viewfinder: UIImage? {
        return UIImage(systemName: "qrcode.viewfinder")
    }
    static var camera_viewfinder: UIImage? {
        return UIImage(systemName: "camera.viewfinder")
    }
    static var faceid: UIImage? {
        return UIImage(systemName: "faceid")
    }
    static var doc_text_viewfinder: UIImage? {
        return UIImage(systemName: "doc.text.viewfinder")
    }
    static var photo: UIImage? {
        return UIImage(systemName: "photo")
    }
    static var photo_fill: UIImage? {
        return UIImage(systemName: "photo.fill")
    }
    static var rectangle_badge_checkmark: UIImage? {
        return UIImage(systemName: "rectangle.badge.checkmark")
    }
    static var rectangle_fill_badge_checkmark: UIImage? {
        return UIImage(systemName: "rectangle.fill.badge.checkmark")
    }
    static var rectangle_badge_xmark: UIImage? {
        return UIImage(systemName: "rectangle.badge.xmark")
    }
    static var rectangle_fill_badge_xmark: UIImage? {
        return UIImage(systemName: "rectangle.fill.badge.xmark")
    }
    static var photo_on_rectangle: UIImage? {
        return UIImage(systemName: "photo.on.rectangle")
    }
    static var photo_fill_on_rectangle_fill: UIImage? {
        return UIImage(systemName: "photo.fill.on.rectangle.fill")
    }
    static var rectangle_on_rectangle_angled: UIImage? {
        return UIImage(systemName: "rectangle.on.rectangle.angled")
    }
    static var rectangle_fill_on_rectangle_angled_fill: UIImage? {
        return UIImage(systemName: "rectangle.fill.on.rectangle.angled.fill")
    }
    static var rectangle_stack: UIImage? {
        return UIImage(systemName: "rectangle.stack")
    }
    static var rectangle_stack_fill: UIImage? {
        return UIImage(systemName: "rectangle.stack.fill")
    }
    static var rectangle_stack_badge_plus: UIImage? {
        return UIImage(systemName: "rectangle.stack.badge.plus")
    }
    static var rectangle_stack_fill_badge_plus: UIImage? {
        return UIImage(systemName: "rectangle.stack.fill.badge.plus")
    }
    static var rectangle_stack_badge_minus: UIImage? {
        return UIImage(systemName: "rectangle.stack.badge.minus")
    }
    static var rectangle_stack_fill_badge_minus: UIImage? {
        return UIImage(systemName: "rectangle.stack.fill.badge.minus")
    }
    static var rectangle_stack_badge_person_crop: UIImage? {
        return UIImage(systemName: "rectangle.stack.badge.person.crop")
    }
    static var rectangle_stack_fill_badge_person_crop: UIImage? {
        return UIImage(systemName: "rectangle.stack.fill.badge.person.crop")
    }
    static var sidebar_left: UIImage? {
        return UIImage(systemName: "sidebar.left")
    }
    static var sidebar_right: UIImage? {
        return UIImage(systemName: "sidebar.right")
    }
    static var macwindow: UIImage? {
        return UIImage(systemName: "macwindow")
    }
    static var uiwindow_split_2x1: UIImage? {
        return UIImage(systemName: "uiwindow.split.2x1")
    }
    static var squares_below_rectangle: UIImage? {
        return UIImage(systemName: "squares.below.rectangle")
    }
    static var rectangle_split_3x3_fill: UIImage? {
        return UIImage(systemName: "rectangle.split.3x3.fill")
    }
    static var pano: UIImage? {
        return UIImage(systemName: "pano")
    }
    static var pano_fill: UIImage? {
        return UIImage(systemName: "pano.fill")
    }
    static var square_and_line_vertical_and_square: UIImage? {
        return UIImage(systemName: "square.and.line.vertical.and.square")
    }
    static var square_fill_and_line_vertical_and_square: UIImage? {
        return UIImage(systemName: "square.fill.and.line.vertical.and.square")
    }
    static var square_and_line_vertical_and_square_fill: UIImage? {
        return UIImage(systemName: "square.and.line.vertical.and.square.fill")
    }
    static var flowchart: UIImage? {
        return UIImage(systemName: "flowchart")
    }
    static var flowchart_fill: UIImage? {
        return UIImage(systemName: "flowchart.fill")
    }
    static var shield: UIImage? {
        return UIImage(systemName: "shield")
    }
    static var shield_fill: UIImage? {
        return UIImage(systemName: "shield.fill")
    }
    static var shield_slash: UIImage? {
        return UIImage(systemName: "shield.slash")
    }
    static var shield_slash_fill: UIImage? {
        return UIImage(systemName: "shield.slash.fill")
    }
    static var slider_horizontal_3: UIImage? {
        return UIImage(systemName: "slider.horizontal.3")
    }
    static var slider_horizontal_below_rectangle: UIImage? {
        return UIImage(systemName: "slider.horizontal.below.rectangle")
    }
    static var cube: UIImage? {
        return UIImage(systemName: "cube")
    }
    static var cube_fill: UIImage? {
        return UIImage(systemName: "cube.fill")
    }
    static var arkit: UIImage? {
        return UIImage(systemName: "arkit")
    }
    static var square_stack_3d_down_right: UIImage? {
        return UIImage(systemName: "square.stack.3d.down.right")
    }
    static var square_stack_3d_down_right_fill: UIImage? {
        return UIImage(systemName: "square.stack.3d.down.right.fill")
    }
    static var square_stack_3d_up: UIImage? {
        return UIImage(systemName: "square.stack.3d.up")
    }
    static var square_stack_3d_up_fill: UIImage? {
        return UIImage(systemName: "square.stack.3d.up.fill")
    }
    static var square_stack_3d_up_slash: UIImage? {
        return UIImage(systemName: "square.stack.3d.up.slash")
    }
    static var square_stack_3d_up_slash_fill: UIImage? {
        return UIImage(systemName: "square.stack.3d.up.slash.fill")
    }
    static var livephoto: UIImage? {
        return UIImage(systemName: "livephoto")
    }
    static var livephoto_slash: UIImage? {
        return UIImage(systemName: "livephoto.slash")
    }
    static var livephoto_play: UIImage? {
        return UIImage(systemName: "livephoto.play")
    }
    static var scope: UIImage? {
        return UIImage(systemName: "scope")
    }
    static var helm: UIImage? {
        return UIImage(systemName: "helm")
    }
    static var clock: UIImage? {
        return UIImage(systemName: "clock")
    }
    static var clock_fill: UIImage? {
        return UIImage(systemName: "clock.fill")
    }
    static var alarm: UIImage? {
        return UIImage(systemName: "alarm")
    }
    static var alarm_fill: UIImage? {
        return UIImage(systemName: "alarm.fill")
    }
    static var stopwatch: UIImage? {
        return UIImage(systemName: "stopwatch")
    }
    static var stopwatch_fill: UIImage? {
        return UIImage(systemName: "stopwatch.fill")
    }
    static var timer: UIImage? {
        return UIImage(systemName: "timer")
    }
    static var gamecontroller: UIImage? {
        return UIImage(systemName: "gamecontroller")
    }
    static var gamecontroller_fill: UIImage? {
        return UIImage(systemName: "gamecontroller.fill")
    }
    static var ear: UIImage? {
        return UIImage(systemName: "ear")
    }
    static var hand_raised: UIImage? {
        return UIImage(systemName: "hand.raised")
    }
    static var hand_raised_fill: UIImage? {
        return UIImage(systemName: "hand.raised.fill")
    }
    static var hand_raised_slash: UIImage? {
        return UIImage(systemName: "hand.raised.slash")
    }
    static var hand_raised_slash_fill: UIImage? {
        return UIImage(systemName: "hand.raised.slash.fill")
    }
    static var hand_thumbsup: UIImage? {
        return UIImage(systemName: "hand.thumbsup")
    }
    static var hand_thumbsup_fill: UIImage? {
        return UIImage(systemName: "hand.thumbsup.fill")
    }
    static var hand_thumbsdown: UIImage? {
        return UIImage(systemName: "hand.thumbsdown")
    }
    static var hand_thumbsdown_fill: UIImage? {
        return UIImage(systemName: "hand.thumbsdown.fill")
    }
    static var hand_draw: UIImage? {
        return UIImage(systemName: "hand.draw")
    }
    static var hand_draw_fill: UIImage? {
        return UIImage(systemName: "hand.draw.fill")
    }
    static var hand_point_left: UIImage? {
        return UIImage(systemName: "hand.point.left")
    }
    static var hand_point_left_fill: UIImage? {
        return UIImage(systemName: "hand.point.left.fill")
    }
    static var hand_point_right: UIImage? {
        return UIImage(systemName: "hand.point.right")
    }
    static var hand_point_right_fill: UIImage? {
        return UIImage(systemName: "hand.point.right.fill")
    }
    static var rectangle_compress_vertical: UIImage? {
        return UIImage(systemName: "rectangle.compress.vertical")
    }
    static var rectangle_expand_vertical: UIImage? {
        return UIImage(systemName: "rectangle.expand.vertical")
    }
    static var rectangle_and_arrow_up_right_and_arrow_down_left: UIImage? {
        return UIImage(systemName: "rectangle.and.arrow.up.right.and.arrow.down.left")
    }
    static var rectangle_and_arrow_up_right_and_arrow_down_left_slash: UIImage? {
        return UIImage(systemName: "rectangle.and.arrow.up.right.and.arrow.down.left.slash")
    }
    static var chart_bar: UIImage? {
        return UIImage(systemName: "chart.bar")
    }
    static var chart_bar_fill: UIImage? {
        return UIImage(systemName: "chart.bar.fill")
    }
    static var chart_pie: UIImage? {
        return UIImage(systemName: "chart.pie")
    }
    static var chart_pie_fill: UIImage? {
        return UIImage(systemName: "chart.pie.fill")
    }
    static var burst: UIImage? {
        return UIImage(systemName: "burst")
    }
    static var burst_fill: UIImage? {
        return UIImage(systemName: "burst.fill")
    }
    static var waveform_path_ecg: UIImage? {
        return UIImage(systemName: "waveform.path.ecg")
    }
    static var waveform_path: UIImage? {
        return UIImage(systemName: "waveform.path")
    }
    static var waveform_path_badge_plus: UIImage? {
        return UIImage(systemName: "waveform.path.badge.plus")
    }
    static var waveform_path_badge_minus: UIImage? {
        return UIImage(systemName: "waveform.path.badge.minus")
    }
    static var waveform: UIImage? {
        return UIImage(systemName: "waveform")
    }
    static var waveform_circle: UIImage? {
        return UIImage(systemName: "waveform.circle")
    }
    static var waveform_circle_fill: UIImage? {
        return UIImage(systemName: "waveform.circle.fill")
    }
    static var staroflife: UIImage? {
        return UIImage(systemName: "staroflife")
    }
    static var staroflife_fill: UIImage? {
        return UIImage(systemName: "staroflife.fill")
    }
    static var gift: UIImage? {
        return UIImage(systemName: "gift")
    }
    static var gift_fill: UIImage? {
        return UIImage(systemName: "gift.fill")
    }
    static var plus_app: UIImage? {
        return UIImage(systemName: "plus.app")
    }
    static var plus_app_fill: UIImage? {
        return UIImage(systemName: "plus.app.fill")
    }
    static var app_badge: UIImage? {
        return UIImage(systemName: "app.badge")
    }
    static var app_badge_fill: UIImage? {
        return UIImage(systemName: "app.badge.fill")
    }
    static var app_gift: UIImage? {
        return UIImage(systemName: "app.gift")
    }
    static var app_gift_fill: UIImage? {
        return UIImage(systemName: "app.gift.fill")
    }
    static var hourglass: UIImage? {
        return UIImage(systemName: "hourglass")
    }
    static var purchased: UIImage? {
        return UIImage(systemName: "purchased")
    }
    static var purchased_circle: UIImage? {
        return UIImage(systemName: "purchased.circle")
    }
    static var purchased_circle_fill: UIImage? {
        return UIImage(systemName: "purchased.circle.fill")
    }
    static var perspective: UIImage? {
        return UIImage(systemName: "perspective")
    }
    static var skew: UIImage? {
        return UIImage(systemName: "skew")
    }
    static var grid: UIImage? {
        return UIImage(systemName: "grid")
    }
    static var grid_circle: UIImage? {
        return UIImage(systemName: "grid.circle")
    }
    static var grid_circle_fill: UIImage? {
        return UIImage(systemName: "grid.circle.fill")
    }
    static var burn: UIImage? {
        return UIImage(systemName: "burn")
    }
    static var recordingtape: UIImage? {
        return UIImage(systemName: "recordingtape")
    }
    static var battery_100: UIImage? {
        return UIImage(systemName: "battery.100")
    }
    static var battery_25: UIImage? {
        return UIImage(systemName: "battery.25")
    }
    static var battery_0: UIImage? {
        return UIImage(systemName: "battery.0")
    }
    static var lightbulb: UIImage? {
        return UIImage(systemName: "lightbulb")
    }
    static var lightbulb_fill: UIImage? {
        return UIImage(systemName: "lightbulb.fill")
    }
    static var lightbulb_slash: UIImage? {
        return UIImage(systemName: "lightbulb.slash")
    }
    static var lightbulb_slash_fill: UIImage? {
        return UIImage(systemName: "lightbulb.slash.fill")
    }
    static var list_dash: UIImage? {
        return UIImage(systemName: "list.dash")
    }
    static var list_bullet: UIImage? {
        return UIImage(systemName: "list.bullet")
    }
    static var list_bullet_indent: UIImage? {
        return UIImage(systemName: "list.bullet.indent")
    }
    static var list_number: UIImage? {
        return UIImage(systemName: "list.number")
    }
    static var increase_indent: UIImage? {
        return UIImage(systemName: "increase.indent")
    }
    static var decrease_indent: UIImage? {
        return UIImage(systemName: "decrease.indent")
    }
    static var decrease_quotelevel: UIImage? {
        return UIImage(systemName: "decrease.quotelevel")
    }
    static var increase_quotelevel: UIImage? {
        return UIImage(systemName: "increase.quotelevel")
    }
    static var list_bullet_below_rectangle: UIImage? {
        return UIImage(systemName: "list.bullet.below.rectangle")
    }
    static var text_badge_plus: UIImage? {
        return UIImage(systemName: "text.badge.plus")
    }
    static var text_badge_minus: UIImage? {
        return UIImage(systemName: "text.badge.minus")
    }
    static var text_badge_checkmark: UIImage? {
        return UIImage(systemName: "text.badge.checkmark")
    }
    static var text_badge_xmark: UIImage? {
        return UIImage(systemName: "text.badge.xmark")
    }
    static var text_badge_star: UIImage? {
        return UIImage(systemName: "text.badge.star")
    }
    static var text_insert: UIImage? {
        return UIImage(systemName: "text.insert")
    }
    static var text_append: UIImage? {
        return UIImage(systemName: "text.append")
    }
    static var text_quote: UIImage? {
        return UIImage(systemName: "text.quote")
    }
    static var text_alignleft: UIImage? {
        return UIImage(systemName: "text.alignleft")
    }
    static var text_aligncenter: UIImage? {
        return UIImage(systemName: "text.aligncenter")
    }
    static var text_alignright: UIImage? {
        return UIImage(systemName: "text.alignright")
    }
    static var text_justify: UIImage? {
        return UIImage(systemName: "text.justify")
    }
    static var text_justifyleft: UIImage? {
        return UIImage(systemName: "text.justifyleft")
    }
    static var text_justifyright: UIImage? {
        return UIImage(systemName: "text.justifyright")
    }
    static var textformat_size: UIImage? {
        return UIImage(systemName: "textformat.size")
    }
    static var textformat: UIImage? {
        return UIImage(systemName: "textformat")
    }
    static var textformat_alt: UIImage? {
        return UIImage(systemName: "textformat.alt")
    }
    static var textformat_superscript: UIImage? {
        return UIImage(systemName: "textformat.superscript")
    }
    static var textformat_subscript: UIImage? {
        return UIImage(systemName: "textformat.subscript")
    }
    static var textformat_abc: UIImage? {
        return UIImage(systemName: "textformat.abc")
    }
    static var textformat_abc_dottedunderline: UIImage? {
        return UIImage(systemName: "textformat.abc.dottedunderline")
    }
    static var bold: UIImage? {
        return UIImage(systemName: "bold")
    }
    static var italic: UIImage? {
        return UIImage(systemName: "italic")
    }
    static var underline: UIImage? {
        return UIImage(systemName: "underline")
    }
    static var strikethrough: UIImage? {
        return UIImage(systemName: "strikethrough")
    }
    static var bold_italic_underline: UIImage? {
        return UIImage(systemName: "bold.italic.underline")
    }
    static var bold_underline: UIImage? {
        return UIImage(systemName: "bold.underline")
    }
    static var view_2d: UIImage? {
        return UIImage(systemName: "view.2d")
    }
    static var view_3d: UIImage? {
        return UIImage(systemName: "view.3d")
    }
    static var fx: UIImage? {
        return UIImage(systemName: "fx")
    }
    static var f_cursive: UIImage? {
        return UIImage(systemName: "f.cursive")
    }
    static var f_cursive_circle: UIImage? {
        return UIImage(systemName: "f.cursive.circle")
    }
    static var f_cursive_circle_fill: UIImage? {
        return UIImage(systemName: "f.cursive.circle.fill")
    }
    static var sum: UIImage? {
        return UIImage(systemName: "sum")
    }
    static var percent: UIImage? {
        return UIImage(systemName: "percent")
    }
    static var function: UIImage? {
        return UIImage(systemName: "function")
    }
    static var textformat_123: UIImage? {
        return UIImage(systemName: "textformat.123")
    }
    static var info: UIImage? {
        return UIImage(systemName: "info")
    }
    static var info_circle: UIImage? {
        return UIImage(systemName: "info.circle")
    }
    static var info_circle_fill: UIImage? {
        return UIImage(systemName: "info.circle.fill")
    }
    static var at: UIImage? {
        return UIImage(systemName: "at")
    }
    static var at_badge_plus: UIImage? {
        return UIImage(systemName: "at.badge.plus")
    }
    static var at_badge_minus: UIImage? {
        return UIImage(systemName: "at.badge.minus")
    }
    static var questionmark: UIImage? {
        return UIImage(systemName: "questionmark")
    }
    static var questionmark_circle: UIImage? {
        return UIImage(systemName: "questionmark.circle")
    }
    static var questionmark_circle_fill: UIImage? {
        return UIImage(systemName: "questionmark.circle.fill")
    }
    static var questionmark_square: UIImage? {
        return UIImage(systemName: "questionmark.square")
    }
    static var questionmark_square_fill: UIImage? {
        return UIImage(systemName: "questionmark.square.fill")
    }
    static var questionmark_diamond: UIImage? {
        return UIImage(systemName: "questionmark.diamond")
    }
    static var questionmark_diamond_fill: UIImage? {
        return UIImage(systemName: "questionmark.diamond.fill")
    }
    static var exclamationmark: UIImage? {
        return UIImage(systemName: "exclamationmark")
    }
    static var exclamationmark_circle: UIImage? {
        return UIImage(systemName: "exclamationmark.circle")
    }
    static var exclamationmark_circle_fill: UIImage? {
        return UIImage(systemName: "exclamationmark.circle.fill")
    }
    static var exclamationmark_square: UIImage? {
        return UIImage(systemName: "exclamationmark.square")
    }
    static var exclamationmark_square_fill: UIImage? {
        return UIImage(systemName: "exclamationmark.square.fill")
    }
    static var exclamationmark_octagon: UIImage? {
        return UIImage(systemName: "exclamationmark.octagon")
    }
    static var exclamationmark_octagon_fill: UIImage? {
        return UIImage(systemName: "exclamationmark.octagon.fill")
    }
    static var exclamationmark_shield: UIImage? {
        return UIImage(systemName: "exclamationmark.shield")
    }
    static var exclamationmark_shield_fill: UIImage? {
        return UIImage(systemName: "exclamationmark.shield.fill")
    }
    static var plus: UIImage? {
        return UIImage(systemName: "plus")
    }
    static var plus_circle: UIImage? {
        return UIImage(systemName: "plus.circle")
    }
    static var plus_circle_fill: UIImage? {
        return UIImage(systemName: "plus.circle.fill")
    }
    static var plus_square: UIImage? {
        return UIImage(systemName: "plus.square")
    }
    static var plus_square_fill: UIImage? {
        return UIImage(systemName: "plus.square.fill")
    }
    static var plus_rectangle: UIImage? {
        return UIImage(systemName: "plus.rectangle")
    }
    static var plus_rectangle_fill: UIImage? {
        return UIImage(systemName: "plus.rectangle.fill")
    }
    static var minus: UIImage? {
        return UIImage(systemName: "minus")
    }
    static var minus_circle: UIImage? {
        return UIImage(systemName: "minus.circle")
    }
    static var minus_circle_fill: UIImage? {
        return UIImage(systemName: "minus.circle.fill")
    }
    static var minus_square: UIImage? {
        return UIImage(systemName: "minus.square")
    }
    static var minus_square_fill: UIImage? {
        return UIImage(systemName: "minus.square.fill")
    }
    static var minus_rectangle: UIImage? {
        return UIImage(systemName: "minus.rectangle")
    }
    static var minus_rectangle_fill: UIImage? {
        return UIImage(systemName: "minus.rectangle.fill")
    }
    static var plusminus: UIImage? {
        return UIImage(systemName: "plusminus")
    }
    static var plusminus_circle: UIImage? {
        return UIImage(systemName: "plusminus.circle")
    }
    static var plusminus_circle_fill: UIImage? {
        return UIImage(systemName: "plusminus.circle.fill")
    }
    static var multiply: UIImage? {
        return UIImage(systemName: "multiply")
    }
    static var multiply_circle: UIImage? {
        return UIImage(systemName: "multiply.circle")
    }
    static var multiply_circle_fill: UIImage? {
        return UIImage(systemName: "multiply.circle.fill")
    }
    static var multiply_square: UIImage? {
        return UIImage(systemName: "multiply.square")
    }
    static var multiply_square_fill: UIImage? {
        return UIImage(systemName: "multiply.square.fill")
    }
    static var xmark_rectangle: UIImage? {
        return UIImage(systemName: "xmark.rectangle")
    }
    static var xmark_rectangle_fill: UIImage? {
        return UIImage(systemName: "xmark.rectangle.fill")
    }
    static var xmark_shield: UIImage? {
        return UIImage(systemName: "xmark.shield")
    }
    static var xmark_shield_fill: UIImage? {
        return UIImage(systemName: "xmark.shield.fill")
    }
    static var xmark_octagon: UIImage? {
        return UIImage(systemName: "xmark.octagon")
    }
    static var xmark_octagon_fill: UIImage? {
        return UIImage(systemName: "xmark.octagon.fill")
    }
    static var divide: UIImage? {
        return UIImage(systemName: "divide")
    }
    static var divide_circle: UIImage? {
        return UIImage(systemName: "divide.circle")
    }
    static var divide_circle_fill: UIImage? {
        return UIImage(systemName: "divide.circle.fill")
    }
    static var divide_square: UIImage? {
        return UIImage(systemName: "divide.square")
    }
    static var divide_square_fill: UIImage? {
        return UIImage(systemName: "divide.square.fill")
    }
    static var equal: UIImage? {
        return UIImage(systemName: "equal")
    }
    static var equal_circle: UIImage? {
        return UIImage(systemName: "equal.circle")
    }
    static var equal_circle_fill: UIImage? {
        return UIImage(systemName: "equal.circle.fill")
    }
    static var equal_square: UIImage? {
        return UIImage(systemName: "equal.square")
    }
    static var equal_square_fill: UIImage? {
        return UIImage(systemName: "equal.square.fill")
    }
    static var lessthan: UIImage? {
        return UIImage(systemName: "lessthan")
    }
    static var lessthan_circle: UIImage? {
        return UIImage(systemName: "lessthan.circle")
    }
    static var lessthan_circle_fill: UIImage? {
        return UIImage(systemName: "lessthan.circle.fill")
    }
    static var lessthan_square: UIImage? {
        return UIImage(systemName: "lessthan.square")
    }
    static var lessthan_square_fill: UIImage? {
        return UIImage(systemName: "lessthan.square.fill")
    }
    static var greaterthan: UIImage? {
        return UIImage(systemName: "greaterthan")
    }
    static var greaterthan_circle: UIImage? {
        return UIImage(systemName: "greaterthan.circle")
    }
    static var greaterthan_circle_fill: UIImage? {
        return UIImage(systemName: "greaterthan.circle.fill")
    }
    static var greaterthan_square: UIImage? {
        return UIImage(systemName: "greaterthan.square")
    }
    static var greaterthan_square_fill: UIImage? {
        return UIImage(systemName: "greaterthan.square.fill")
    }
    static var number: UIImage? {
        return UIImage(systemName: "number")
    }
    static var number_circle: UIImage? {
        return UIImage(systemName: "number.circle")
    }
    static var number_circle_fill: UIImage? {
        return UIImage(systemName: "number.circle.fill")
    }
    static var number_square: UIImage? {
        return UIImage(systemName: "number.square")
    }
    static var number_square_fill: UIImage? {
        return UIImage(systemName: "number.square.fill")
    }
    static var x_squareroot: UIImage? {
        return UIImage(systemName: "x.squareroot")
    }
    static var xmark: UIImage? {
        return UIImage(systemName: "xmark")
    }
    static var xmark_circle: UIImage? {
        return UIImage(systemName: "xmark.circle")
    }
    static var xmark_circle_fill: UIImage? {
        return UIImage(systemName: "xmark.circle.fill")
    }
    static var xmark_square: UIImage? {
        return UIImage(systemName: "xmark.square")
    }
    static var xmark_square_fill: UIImage? {
        return UIImage(systemName: "xmark.square.fill")
    }
    static var checkmark: UIImage? {
        return UIImage(systemName: "checkmark")
    }
    static var checkmark_circle: UIImage? {
        return UIImage(systemName: "checkmark.circle")
    }
    static var checkmark_circle_fill: UIImage? {
        return UIImage(systemName: "checkmark.circle.fill")
    }
    static var checkmark_square: UIImage? {
        return UIImage(systemName: "checkmark.square")
    }
    static var checkmark_square_fill: UIImage? {
        return UIImage(systemName: "checkmark.square.fill")
    }
    static var checkmark_rectangle: UIImage? {
        return UIImage(systemName: "checkmark.rectangle")
    }
    static var checkmark_rectangle_fill: UIImage? {
        return UIImage(systemName: "checkmark.rectangle.fill")
    }
    static var checkmark_shield: UIImage? {
        return UIImage(systemName: "checkmark.shield")
    }
    static var checkmark_shield_fill: UIImage? {
        return UIImage(systemName: "checkmark.shield.fill")
    }
    static var chevron_left: UIImage? {
        return UIImage(systemName: "chevron.left")
    }
    static var chevron_left_circle: UIImage? {
        return UIImage(systemName: "chevron.left.circle")
    }
    static var chevron_left_circle_fill: UIImage? {
        return UIImage(systemName: "chevron.left.circle.fill")
    }
    static var chevron_left_square: UIImage? {
        return UIImage(systemName: "chevron.left.square")
    }
    static var chevron_left_square_fill: UIImage? {
        return UIImage(systemName: "chevron.left.square.fill")
    }
    static var chevron_right: UIImage? {
        return UIImage(systemName: "chevron.right")
    }
    static var chevron_right_circle: UIImage? {
        return UIImage(systemName: "chevron.right.circle")
    }
    static var chevron_right_circle_fill: UIImage? {
        return UIImage(systemName: "chevron.right.circle.fill")
    }
    static var chevron_right_square: UIImage? {
        return UIImage(systemName: "chevron.right.square")
    }
    static var chevron_right_square_fill: UIImage? {
        return UIImage(systemName: "chevron.right.square.fill")
    }
    static var chevron_left_2: UIImage? {
        return UIImage(systemName: "chevron.left.2")
    }
    static var chevron_right_2: UIImage? {
        return UIImage(systemName: "chevron.right.2")
    }
    static var chevron_up: UIImage? {
        return UIImage(systemName: "chevron.up")
    }
    static var chevron_up_circle: UIImage? {
        return UIImage(systemName: "chevron.up.circle")
    }
    static var chevron_up_circle_fill: UIImage? {
        return UIImage(systemName: "chevron.up.circle.fill")
    }
    static var chevron_up_square: UIImage? {
        return UIImage(systemName: "chevron.up.square")
    }
    static var chevron_up_square_fill: UIImage? {
        return UIImage(systemName: "chevron.up.square.fill")
    }
    static var chevron_down: UIImage? {
        return UIImage(systemName: "chevron.down")
    }
    static var chevron_down_circle: UIImage? {
        return UIImage(systemName: "chevron.down.circle")
    }
    static var chevron_down_circle_fill: UIImage? {
        return UIImage(systemName: "chevron.down.circle.fill")
    }
    static var chevron_down_square: UIImage? {
        return UIImage(systemName: "chevron.down.square")
    }
    static var chevron_down_square_fill: UIImage? {
        return UIImage(systemName: "chevron.down.square.fill")
    }
    static var control: UIImage? {
        return UIImage(systemName: "control")
    }
    static var projective: UIImage? {
        return UIImage(systemName: "projective")
    }
    static var chevron_up_chevron_down: UIImage? {
        return UIImage(systemName: "chevron.up.chevron.down")
    }
    static var chevron_compact_up: UIImage? {
        return UIImage(systemName: "chevron.compact.up")
    }
    static var chevron_compact_down: UIImage? {
        return UIImage(systemName: "chevron.compact.down")
    }
    static var chevron_compact_left: UIImage? {
        return UIImage(systemName: "chevron.compact.left")
    }
    static var chevron_compact_right: UIImage? {
        return UIImage(systemName: "chevron.compact.right")
    }
    static var arrow_left: UIImage? {
        return UIImage(systemName: "arrow.left")
    }
    static var arrow_left_circle: UIImage? {
        return UIImage(systemName: "arrow.left.circle")
    }
    static var arrow_left_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.left.circle.fill")
    }
    static var arrow_left_square: UIImage? {
        return UIImage(systemName: "arrow.left.square")
    }
    static var arrow_left_square_fill: UIImage? {
        return UIImage(systemName: "arrow.left.square.fill")
    }
    static var arrow_right: UIImage? {
        return UIImage(systemName: "arrow.right")
    }
    static var arrow_right_circle: UIImage? {
        return UIImage(systemName: "arrow.right.circle")
    }
    static var arrow_right_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.right.circle.fill")
    }
    static var arrow_right_square: UIImage? {
        return UIImage(systemName: "arrow.right.square")
    }
    static var arrow_right_square_fill: UIImage? {
        return UIImage(systemName: "arrow.right.square.fill")
    }
    static var arrow_up: UIImage? {
        return UIImage(systemName: "arrow.up")
    }
    static var arrow_up_circle: UIImage? {
        return UIImage(systemName: "arrow.up.circle")
    }
    static var arrow_up_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.up.circle.fill")
    }
    static var arrow_up_square: UIImage? {
        return UIImage(systemName: "arrow.up.square")
    }
    static var arrow_up_square_fill: UIImage? {
        return UIImage(systemName: "arrow.up.square.fill")
    }
    static var arrow_down: UIImage? {
        return UIImage(systemName: "arrow.down")
    }
    static var arrow_down_circle: UIImage? {
        return UIImage(systemName: "arrow.down.circle")
    }
    static var arrow_down_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.down.circle.fill")
    }
    static var arrow_down_square: UIImage? {
        return UIImage(systemName: "arrow.down.square")
    }
    static var arrow_down_square_fill: UIImage? {
        return UIImage(systemName: "arrow.down.square.fill")
    }
    static var arrow_up_left: UIImage? {
        return UIImage(systemName: "arrow.up.left")
    }
    static var arrow_up_left_circle: UIImage? {
        return UIImage(systemName: "arrow.up.left.circle")
    }
    static var arrow_up_left_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.up.left.circle.fill")
    }
    static var arrow_up_left_square: UIImage? {
        return UIImage(systemName: "arrow.up.left.square")
    }
    static var arrow_up_left_square_fill: UIImage? {
        return UIImage(systemName: "arrow.up.left.square.fill")
    }
    static var arrow_up_right: UIImage? {
        return UIImage(systemName: "arrow.up.right")
    }
    static var arrow_up_right_circle: UIImage? {
        return UIImage(systemName: "arrow.up.right.circle")
    }
    static var arrow_up_right_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.up.right.circle.fill")
    }
    static var arrow_up_right_square: UIImage? {
        return UIImage(systemName: "arrow.up.right.square")
    }
    static var arrow_up_right_square_fill: UIImage? {
        return UIImage(systemName: "arrow.up.right.square.fill")
    }
    static var arrow_down_left: UIImage? {
        return UIImage(systemName: "arrow.down.left")
    }
    static var arrow_down_left_circle: UIImage? {
        return UIImage(systemName: "arrow.down.left.circle")
    }
    static var arrow_down_left_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.down.left.circle.fill")
    }
    static var arrow_down_left_square: UIImage? {
        return UIImage(systemName: "arrow.down.left.square")
    }
    static var arrow_down_left_square_fill: UIImage? {
        return UIImage(systemName: "arrow.down.left.square.fill")
    }
    static var arrow_down_right: UIImage? {
        return UIImage(systemName: "arrow.down.right")
    }
    static var arrow_down_right_circle: UIImage? {
        return UIImage(systemName: "arrow.down.right.circle")
    }
    static var arrow_down_right_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.down.right.circle.fill")
    }
    static var arrow_down_right_square: UIImage? {
        return UIImage(systemName: "arrow.down.right.square")
    }
    static var arrow_down_right_square_fill: UIImage? {
        return UIImage(systemName: "arrow.down.right.square.fill")
    }
    static var arrow_up_arrow_down: UIImage? {
        return UIImage(systemName: "arrow.up.arrow.down")
    }
    static var arrow_up_arrow_down_circle: UIImage? {
        return UIImage(systemName: "arrow.up.arrow.down.circle")
    }
    static var arrow_up_arrow_down_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.up.arrow.down.circle.fill")
    }
    static var arrow_up_arrow_down_square: UIImage? {
        return UIImage(systemName: "arrow.up.arrow.down.square")
    }
    static var arrow_up_arrow_down_square_fill: UIImage? {
        return UIImage(systemName: "arrow.up.arrow.down.square.fill")
    }
    static var arrow_turn_down_left: UIImage? {
        return UIImage(systemName: "arrow.turn.down.left")
    }
    static var arrow_turn_up_left: UIImage? {
        return UIImage(systemName: "arrow.turn.up.left")
    }
    static var arrow_turn_down_right: UIImage? {
        return UIImage(systemName: "arrow.turn.down.right")
    }
    static var arrow_turn_up_right: UIImage? {
        return UIImage(systemName: "arrow.turn.up.right")
    }
    static var arrow_turn_right_up: UIImage? {
        return UIImage(systemName: "arrow.turn.right.up")
    }
    static var arrow_turn_left_up: UIImage? {
        return UIImage(systemName: "arrow.turn.left.up")
    }
    static var arrow_turn_right_down: UIImage? {
        return UIImage(systemName: "arrow.turn.right.down")
    }
    static var arrow_turn_left_down: UIImage? {
        return UIImage(systemName: "arrow.turn.left.down")
    }
    static var arrow_uturn_left: UIImage? {
        return UIImage(systemName: "arrow.uturn.left")
    }
    static var arrow_uturn_left_circle: UIImage? {
        return UIImage(systemName: "arrow.uturn.left.circle")
    }
    static var arrow_uturn_left_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.left.circle.fill")
    }
    static var arrow_uturn_left_square: UIImage? {
        return UIImage(systemName: "arrow.uturn.left.square")
    }
    static var arrow_uturn_left_square_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.left.square.fill")
    }
    static var arrow_uturn_right: UIImage? {
        return UIImage(systemName: "arrow.uturn.right")
    }
    static var arrow_uturn_right_circle: UIImage? {
        return UIImage(systemName: "arrow.uturn.right.circle")
    }
    static var arrow_uturn_right_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.right.circle.fill")
    }
    static var arrow_uturn_right_square: UIImage? {
        return UIImage(systemName: "arrow.uturn.right.square")
    }
    static var arrow_uturn_right_square_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.right.square.fill")
    }
    static var arrow_uturn_up: UIImage? {
        return UIImage(systemName: "arrow.uturn.up")
    }
    static var arrow_uturn_up_circle: UIImage? {
        return UIImage(systemName: "arrow.uturn.up.circle")
    }
    static var arrow_uturn_up_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.up.circle.fill")
    }
    static var arrow_uturn_up_square: UIImage? {
        return UIImage(systemName: "arrow.uturn.up.square")
    }
    static var arrow_uturn_up_square_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.up.square.fill")
    }
    static var arrow_uturn_down: UIImage? {
        return UIImage(systemName: "arrow.uturn.down")
    }
    static var arrow_uturn_down_circle: UIImage? {
        return UIImage(systemName: "arrow.uturn.down.circle")
    }
    static var arrow_uturn_down_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.down.circle.fill")
    }
    static var arrow_uturn_down_square: UIImage? {
        return UIImage(systemName: "arrow.uturn.down.square")
    }
    static var arrow_uturn_down_square_fill: UIImage? {
        return UIImage(systemName: "arrow.uturn.down.square.fill")
    }
    static var arrow_left_and_right: UIImage? {
        return UIImage(systemName: "arrow.left.and.right")
    }
    static var arrow_left_and_right_circle: UIImage? {
        return UIImage(systemName: "arrow.left.and.right.circle")
    }
    static var arrow_left_and_right_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.left.and.right.circle.fill")
    }
    static var arrow_left_and_right_square: UIImage? {
        return UIImage(systemName: "arrow.left.and.right.square")
    }
    static var arrow_left_and_right_square_fill: UIImage? {
        return UIImage(systemName: "arrow.left.and.right.square.fill")
    }
    static var arrow_up_and_down: UIImage? {
        return UIImage(systemName: "arrow.up.and.down")
    }
    static var arrow_up_and_down_circle: UIImage? {
        return UIImage(systemName: "arrow.up.and.down.circle")
    }
    static var arrow_up_and_down_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.up.and.down.circle.fill")
    }
    static var arrow_up_and_down_square: UIImage? {
        return UIImage(systemName: "arrow.up.and.down.square")
    }
    static var arrow_up_and_down_square_fill: UIImage? {
        return UIImage(systemName: "arrow.up.and.down.square.fill")
    }
    static var arrow_up_to_line: UIImage? {
        return UIImage(systemName: "arrow.up.to.line")
    }
    static var arrow_down_to_line: UIImage? {
        return UIImage(systemName: "arrow.down.to.line")
    }
    static var arrow_left_to_line: UIImage? {
        return UIImage(systemName: "arrow.left.to.line")
    }
    static var arrow_right_to_line: UIImage? {
        return UIImage(systemName: "arrow.right.to.line")
    }
    static var arrow_clockwise: UIImage? {
        return UIImage(systemName: "arrow.clockwise")
    }
    static var arrow_clockwise_circle: UIImage? {
        return UIImage(systemName: "arrow.clockwise.circle")
    }
    static var arrow_clockwise_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.clockwise.circle.fill")
    }
    static var arrow_counterclockwise: UIImage? {
        return UIImage(systemName: "arrow.counterclockwise")
    }
    static var arrow_counterclockwise_circle: UIImage? {
        return UIImage(systemName: "arrow.counterclockwise.circle")
    }
    static var arrow_counterclockwise_circle_fill: UIImage? {
        return UIImage(systemName: "arrow.counterclockwise.circle.fill")
    }
    static var arrow_up_left_and_arrow_down_right: UIImage? {
        return UIImage(systemName: "arrow.up.left.and.arrow.down.right")
    }
    static var arrow_down_right_and_arrow_up_left: UIImage? {
        return UIImage(systemName: "arrow.down.right.and.arrow.up.left")
    }
    static var return_Image: UIImage? {
        return UIImage(systemName: "return")
    }
    static var arrow_2_squarepath: UIImage? {
        return UIImage(systemName: "arrow.2.squarepath")
    }
    static var arrow_3_trianglepath: UIImage? {
        return UIImage(systemName: "arrow.3.trianglepath")
    }
    static var arrowtriangle_left: UIImage? {
        return UIImage(systemName: "arrowtriangle.left")
    }
    static var arrowtriangle_left_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.left.fill")
    }
    static var arrowtriangle_left_circle: UIImage? {
        return UIImage(systemName: "arrowtriangle.left.circle")
    }
    static var arrowtriangle_left_circle_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.left.circle.fill")
    }
    static var arrowtriangle_left_square: UIImage? {
        return UIImage(systemName: "arrowtriangle.left.square")
    }
    static var arrowtriangle_left_square_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.left.square.fill")
    }
    static var arrowtriangle_right: UIImage? {
        return UIImage(systemName: "arrowtriangle.right")
    }
    static var arrowtriangle_right_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.right.fill")
    }
    static var arrowtriangle_right_circle: UIImage? {
        return UIImage(systemName: "arrowtriangle.right.circle")
    }
    static var arrowtriangle_right_circle_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.right.circle.fill")
    }
    static var arrowtriangle_right_square: UIImage? {
        return UIImage(systemName: "arrowtriangle.right.square")
    }
    static var arrowtriangle_right_square_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.right.square.fill")
    }
    static var arrowtriangle_up: UIImage? {
        return UIImage(systemName: "arrowtriangle.up")
    }
    static var arrowtriangle_up_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.up.fill")
    }
    static var arrowtriangle_up_circle: UIImage? {
        return UIImage(systemName: "arrowtriangle.up.circle")
    }
    static var arrowtriangle_up_circle_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.up.circle.fill")
    }
    static var arrowtriangle_up_square: UIImage? {
        return UIImage(systemName: "arrowtriangle.up.square")
    }
    static var arrowtriangle_up_square_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.up.square.fill")
    }
    static var arrowtriangle_down: UIImage? {
        return UIImage(systemName: "arrowtriangle.down")
    }
    static var arrowtriangle_down_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.down.fill")
    }
    static var arrowtriangle_down_circle: UIImage? {
        return UIImage(systemName: "arrowtriangle.down.circle")
    }
    static var arrowtriangle_down_circle_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.down.circle.fill")
    }
    static var arrowtriangle_down_square: UIImage? {
        return UIImage(systemName: "arrowtriangle.down.square")
    }
    static var arrowtriangle_down_square_fill: UIImage? {
        return UIImage(systemName: "arrowtriangle.down.square.fill")
    }
    static var slash_circle: UIImage? {
        return UIImage(systemName: "slash.circle")
    }
    static var slash_circle_fill: UIImage? {
        return UIImage(systemName: "slash.circle.fill")
    }
    static var asterisk_circle: UIImage? {
        return UIImage(systemName: "asterisk.circle")
    }
    static var asterisk_circle_fill: UIImage? {
        return UIImage(systemName: "asterisk.circle.fill")
    }
    static var a_circle: UIImage? {
        return UIImage(systemName: "a.circle")
    }
    static var a_circle_fill: UIImage? {
        return UIImage(systemName: "a.circle.fill")
    }
    static var a_square: UIImage? {
        return UIImage(systemName: "a.square")
    }
    static var a_square_fill: UIImage? {
        return UIImage(systemName: "a.square.fill")
    }
    static var b_circle: UIImage? {
        return UIImage(systemName: "b.circle")
    }
    static var b_circle_fill: UIImage? {
        return UIImage(systemName: "b.circle.fill")
    }
    static var b_square: UIImage? {
        return UIImage(systemName: "b.square")
    }
    static var b_square_fill: UIImage? {
        return UIImage(systemName: "b.square.fill")
    }
    static var c_circle: UIImage? {
        return UIImage(systemName: "c.circle")
    }
    static var c_circle_fill: UIImage? {
        return UIImage(systemName: "c.circle.fill")
    }
    static var c_square: UIImage? {
        return UIImage(systemName: "c.square")
    }
    static var c_square_fill: UIImage? {
        return UIImage(systemName: "c.square.fill")
    }
    static var d_circle: UIImage? {
        return UIImage(systemName: "d.circle")
    }
    static var d_circle_fill: UIImage? {
        return UIImage(systemName: "d.circle.fill")
    }
    static var d_square: UIImage? {
        return UIImage(systemName: "d.square")
    }
    static var d_square_fill: UIImage? {
        return UIImage(systemName: "d.square.fill")
    }
    static var e_circle: UIImage? {
        return UIImage(systemName: "e.circle")
    }
    static var e_circle_fill: UIImage? {
        return UIImage(systemName: "e.circle.fill")
    }
    static var e_square: UIImage? {
        return UIImage(systemName: "e.square")
    }
    static var e_square_fill: UIImage? {
        return UIImage(systemName: "e.square.fill")
    }
    static var f_circle: UIImage? {
        return UIImage(systemName: "f.circle")
    }
    static var f_circle_fill: UIImage? {
        return UIImage(systemName: "f.circle.fill")
    }
    static var f_square: UIImage? {
        return UIImage(systemName: "f.square")
    }
    static var f_square_fill: UIImage? {
        return UIImage(systemName: "f.square.fill")
    }
    static var g_circle: UIImage? {
        return UIImage(systemName: "g.circle")
    }
    static var g_circle_fill: UIImage? {
        return UIImage(systemName: "g.circle.fill")
    }
    static var g_square: UIImage? {
        return UIImage(systemName: "g.square")
    }
    static var g_square_fill: UIImage? {
        return UIImage(systemName: "g.square.fill")
    }
    static var h_circle: UIImage? {
        return UIImage(systemName: "h.circle")
    }
    static var h_circle_fill: UIImage? {
        return UIImage(systemName: "h.circle.fill")
    }
    static var h_square: UIImage? {
        return UIImage(systemName: "h.square")
    }
    static var h_square_fill: UIImage? {
        return UIImage(systemName: "h.square.fill")
    }
    static var i_circle: UIImage? {
        return UIImage(systemName: "i.circle")
    }
    static var i_circle_fill: UIImage? {
        return UIImage(systemName: "i.circle.fill")
    }
    static var i_square: UIImage? {
        return UIImage(systemName: "i.square")
    }
    static var i_square_fill: UIImage? {
        return UIImage(systemName: "i.square.fill")
    }
    static var j_circle: UIImage? {
        return UIImage(systemName: "j.circle")
    }
    static var j_circle_fill: UIImage? {
        return UIImage(systemName: "j.circle.fill")
    }
    static var j_square: UIImage? {
        return UIImage(systemName: "j.square")
    }
    static var j_square_fill: UIImage? {
        return UIImage(systemName: "j.square.fill")
    }
    static var k_circle: UIImage? {
        return UIImage(systemName: "k.circle")
    }
    static var k_circle_fill: UIImage? {
        return UIImage(systemName: "k.circle.fill")
    }
    static var k_square: UIImage? {
        return UIImage(systemName: "k.square")
    }
    static var k_square_fill: UIImage? {
        return UIImage(systemName: "k.square.fill")
    }
    static var l_circle: UIImage? {
        return UIImage(systemName: "l.circle")
    }
    static var l_circle_fill: UIImage? {
        return UIImage(systemName: "l.circle.fill")
    }
    static var l_square: UIImage? {
        return UIImage(systemName: "l.square")
    }
    static var l_square_fill: UIImage? {
        return UIImage(systemName: "l.square.fill")
    }
    static var m_circle: UIImage? {
        return UIImage(systemName: "m.circle")
    }
    static var m_circle_fill: UIImage? {
        return UIImage(systemName: "m.circle.fill")
    }
    static var m_square: UIImage? {
        return UIImage(systemName: "m.square")
    }
    static var m_square_fill: UIImage? {
        return UIImage(systemName: "m.square.fill")
    }
    static var n_circle: UIImage? {
        return UIImage(systemName: "n.circle")
    }
    static var n_circle_fill: UIImage? {
        return UIImage(systemName: "n.circle.fill")
    }
    static var n_square: UIImage? {
        return UIImage(systemName: "n.square")
    }
    static var n_square_fill: UIImage? {
        return UIImage(systemName: "n.square.fill")
    }
    static var o_circle: UIImage? {
        return UIImage(systemName: "o.circle")
    }
    static var o_circle_fill: UIImage? {
        return UIImage(systemName: "o.circle.fill")
    }
    static var o_square: UIImage? {
        return UIImage(systemName: "o.square")
    }
    static var o_square_fill: UIImage? {
        return UIImage(systemName: "o.square.fill")
    }
    static var p_circle: UIImage? {
        return UIImage(systemName: "p.circle")
    }
    static var p_circle_fill: UIImage? {
        return UIImage(systemName: "p.circle.fill")
    }
    static var p_square: UIImage? {
        return UIImage(systemName: "p.square")
    }
    static var p_square_fill: UIImage? {
        return UIImage(systemName: "p.square.fill")
    }
    static var q_circle: UIImage? {
        return UIImage(systemName: "q.circle")
    }
    static var q_circle_fill: UIImage? {
        return UIImage(systemName: "q.circle.fill")
    }
    static var q_square: UIImage? {
        return UIImage(systemName: "q.square")
    }
    static var q_square_fill: UIImage? {
        return UIImage(systemName: "q.square.fill")
    }
    static var r_circle: UIImage? {
        return UIImage(systemName: "r.circle")
    }
    static var r_circle_fill: UIImage? {
        return UIImage(systemName: "r.circle.fill")
    }
    static var r_square: UIImage? {
        return UIImage(systemName: "r.square")
    }
    static var r_square_fill: UIImage? {
        return UIImage(systemName: "r.square.fill")
    }
    static var s_circle: UIImage? {
        return UIImage(systemName: "s.circle")
    }
    static var s_circle_fill: UIImage? {
        return UIImage(systemName: "s.circle.fill")
    }
    static var s_square: UIImage? {
        return UIImage(systemName: "s.square")
    }
    static var s_square_fill: UIImage? {
        return UIImage(systemName: "s.square.fill")
    }
    static var t_circle: UIImage? {
        return UIImage(systemName: "t.circle")
    }
    static var t_circle_fill: UIImage? {
        return UIImage(systemName: "t.circle.fill")
    }
    static var t_square: UIImage? {
        return UIImage(systemName: "t.square")
    }
    static var t_square_fill: UIImage? {
        return UIImage(systemName: "t.square.fill")
    }
    static var u_circle: UIImage? {
        return UIImage(systemName: "u.circle")
    }
    static var u_circle_fill: UIImage? {
        return UIImage(systemName: "u.circle.fill")
    }
    static var u_square: UIImage? {
        return UIImage(systemName: "u.square")
    }
    static var u_square_fill: UIImage? {
        return UIImage(systemName: "u.square.fill")
    }
    static var v_circle: UIImage? {
        return UIImage(systemName: "v.circle")
    }
    static var v_circle_fill: UIImage? {
        return UIImage(systemName: "v.circle.fill")
    }
    static var v_square: UIImage? {
        return UIImage(systemName: "v.square")
    }
    static var v_square_fill: UIImage? {
        return UIImage(systemName: "v.square.fill")
    }
    static var w_circle: UIImage? {
        return UIImage(systemName: "w.circle")
    }
    static var w_circle_fill: UIImage? {
        return UIImage(systemName: "w.circle.fill")
    }
    static var w_square: UIImage? {
        return UIImage(systemName: "w.square")
    }
    static var w_square_fill: UIImage? {
        return UIImage(systemName: "w.square.fill")
    }
    static var x_circle: UIImage? {
        return UIImage(systemName: "x.circle")
    }
    static var x_circle_fill: UIImage? {
        return UIImage(systemName: "x.circle.fill")
    }
    static var x_square: UIImage? {
        return UIImage(systemName: "x.square")
    }
    static var x_square_fill: UIImage? {
        return UIImage(systemName: "x.square.fill")
    }
    static var y_circle: UIImage? {
        return UIImage(systemName: "y.circle")
    }
    static var y_circle_fill: UIImage? {
        return UIImage(systemName: "y.circle.fill")
    }
    static var y_square: UIImage? {
        return UIImage(systemName: "y.square")
    }
    static var y_square_fill: UIImage? {
        return UIImage(systemName: "y.square.fill")
    }
    static var z_circle: UIImage? {
        return UIImage(systemName: "z.circle")
    }
    static var z_circle_fill: UIImage? {
        return UIImage(systemName: "z.circle.fill")
    }
    static var z_square: UIImage? {
        return UIImage(systemName: "z.square")
    }
    static var z_square_fill: UIImage? {
        return UIImage(systemName: "z.square.fill")
    }
    static var dollarsign_circle: UIImage? {
        return UIImage(systemName: "dollarsign.circle")
    }
    static var dollarsign_circle_fill: UIImage? {
        return UIImage(systemName: "dollarsign.circle.fill")
    }
    static var dollarsign_square: UIImage? {
        return UIImage(systemName: "dollarsign.square")
    }
    static var dollarsign_square_fill: UIImage? {
        return UIImage(systemName: "dollarsign.square.fill")
    }
    static var centsign_circle: UIImage? {
        return UIImage(systemName: "centsign.circle")
    }
    static var centsign_circle_fill: UIImage? {
        return UIImage(systemName: "centsign.circle.fill")
    }
    static var centsign_square: UIImage? {
        return UIImage(systemName: "centsign.square")
    }
    static var centsign_square_fill: UIImage? {
        return UIImage(systemName: "centsign.square.fill")
    }
    static var yensign_circle: UIImage? {
        return UIImage(systemName: "yensign.circle")
    }
    static var yensign_circle_fill: UIImage? {
        return UIImage(systemName: "yensign.circle.fill")
    }
    static var yensign_square: UIImage? {
        return UIImage(systemName: "yensign.square")
    }
    static var yensign_square_fill: UIImage? {
        return UIImage(systemName: "yensign.square.fill")
    }
    static var sterlingsign_circle: UIImage? {
        return UIImage(systemName: "sterlingsign.circle")
    }
    static var sterlingsign_circle_fill: UIImage? {
        return UIImage(systemName: "sterlingsign.circle.fill")
    }
    static var sterlingsign_square: UIImage? {
        return UIImage(systemName: "sterlingsign.square")
    }
    static var sterlingsign_square_fill: UIImage? {
        return UIImage(systemName: "sterlingsign.square.fill")
    }
    static var francsign_circle: UIImage? {
        return UIImage(systemName: "francsign.circle")
    }
    static var francsign_circle_fill: UIImage? {
        return UIImage(systemName: "francsign.circle.fill")
    }
    static var francsign_square: UIImage? {
        return UIImage(systemName: "francsign.square")
    }
    static var francsign_square_fill: UIImage? {
        return UIImage(systemName: "francsign.square.fill")
    }
    static var florinsign_circle: UIImage? {
        return UIImage(systemName: "florinsign.circle")
    }
    static var florinsign_circle_fill: UIImage? {
        return UIImage(systemName: "florinsign.circle.fill")
    }
    static var florinsign_square: UIImage? {
        return UIImage(systemName: "florinsign.square")
    }
    static var florinsign_square_fill: UIImage? {
        return UIImage(systemName: "florinsign.square.fill")
    }
    static var turkishlirasign_circle: UIImage? {
        return UIImage(systemName: "turkishlirasign.circle")
    }
    static var turkishlirasign_circle_fill: UIImage? {
        return UIImage(systemName: "turkishlirasign.circle.fill")
    }
    static var turkishlirasign_square: UIImage? {
        return UIImage(systemName: "turkishlirasign.square")
    }
    static var turkishlirasign_square_fill: UIImage? {
        return UIImage(systemName: "turkishlirasign.square.fill")
    }
    static var rublesign_circle: UIImage? {
        return UIImage(systemName: "rublesign.circle")
    }
    static var rublesign_circle_fill: UIImage? {
        return UIImage(systemName: "rublesign.circle.fill")
    }
    static var rublesign_square: UIImage? {
        return UIImage(systemName: "rublesign.square")
    }
    static var rublesign_square_fill: UIImage? {
        return UIImage(systemName: "rublesign.square.fill")
    }
    static var eurosign_circle: UIImage? {
        return UIImage(systemName: "eurosign.circle")
    }
    static var eurosign_circle_fill: UIImage? {
        return UIImage(systemName: "eurosign.circle.fill")
    }
    static var eurosign_square: UIImage? {
        return UIImage(systemName: "eurosign.square")
    }
    static var eurosign_square_fill: UIImage? {
        return UIImage(systemName: "eurosign.square.fill")
    }
    static var dongsign_circle: UIImage? {
        return UIImage(systemName: "dongsign.circle")
    }
    static var dongsign_circle_fill: UIImage? {
        return UIImage(systemName: "dongsign.circle.fill")
    }
    static var dongsign_square: UIImage? {
        return UIImage(systemName: "dongsign.square")
    }
    static var dongsign_square_fill: UIImage? {
        return UIImage(systemName: "dongsign.square.fill")
    }
    static var indianrupeesign_circle: UIImage? {
        return UIImage(systemName: "indianrupeesign.circle")
    }
    static var indianrupeesign_circle_fill: UIImage? {
        return UIImage(systemName: "indianrupeesign.circle.fill")
    }
    static var indianrupeesign_square: UIImage? {
        return UIImage(systemName: "indianrupeesign.square")
    }
    static var indianrupeesign_square_fill: UIImage? {
        return UIImage(systemName: "indianrupeesign.square.fill")
    }
    static var tengesign_circle: UIImage? {
        return UIImage(systemName: "tengesign.circle")
    }
    static var tengesign_circle_fill: UIImage? {
        return UIImage(systemName: "tengesign.circle.fill")
    }
    static var tengesign_square: UIImage? {
        return UIImage(systemName: "tengesign.square")
    }
    static var tengesign_square_fill: UIImage? {
        return UIImage(systemName: "tengesign.square.fill")
    }
    static var pesetasign_circle: UIImage? {
        return UIImage(systemName: "pesetasign.circle")
    }
    static var pesetasign_circle_fill: UIImage? {
        return UIImage(systemName: "pesetasign.circle.fill")
    }
    static var pesetasign_square: UIImage? {
        return UIImage(systemName: "pesetasign.square")
    }
    static var pesetasign_square_fill: UIImage? {
        return UIImage(systemName: "pesetasign.square.fill")
    }
    static var pesosign_circle: UIImage? {
        return UIImage(systemName: "pesosign.circle")
    }
    static var pesosign_circle_fill: UIImage? {
        return UIImage(systemName: "pesosign.circle.fill")
    }
    static var pesosign_square: UIImage? {
        return UIImage(systemName: "pesosign.square")
    }
    static var pesosign_square_fill: UIImage? {
        return UIImage(systemName: "pesosign.square.fill")
    }
    static var kipsign_circle: UIImage? {
        return UIImage(systemName: "kipsign.circle")
    }
    static var kipsign_circle_fill: UIImage? {
        return UIImage(systemName: "kipsign.circle.fill")
    }
    static var kipsign_square: UIImage? {
        return UIImage(systemName: "kipsign.square")
    }
    static var kipsign_square_fill: UIImage? {
        return UIImage(systemName: "kipsign.square.fill")
    }
    static var wonsign_circle: UIImage? {
        return UIImage(systemName: "wonsign.circle")
    }
    static var wonsign_circle_fill: UIImage? {
        return UIImage(systemName: "wonsign.circle.fill")
    }
    static var wonsign_square: UIImage? {
        return UIImage(systemName: "wonsign.square")
    }
    static var wonsign_square_fill: UIImage? {
        return UIImage(systemName: "wonsign.square.fill")
    }
    static var lirasign_circle: UIImage? {
        return UIImage(systemName: "lirasign.circle")
    }
    static var lirasign_circle_fill: UIImage? {
        return UIImage(systemName: "lirasign.circle.fill")
    }
    static var lirasign_square: UIImage? {
        return UIImage(systemName: "lirasign.square")
    }
    static var lirasign_square_fill: UIImage? {
        return UIImage(systemName: "lirasign.square.fill")
    }
    static var australsign_circle: UIImage? {
        return UIImage(systemName: "australsign.circle")
    }
    static var australsign_circle_fill: UIImage? {
        return UIImage(systemName: "australsign.circle.fill")
    }
    static var australsign_square: UIImage? {
        return UIImage(systemName: "australsign.square")
    }
    static var australsign_square_fill: UIImage? {
        return UIImage(systemName: "australsign.square.fill")
    }
    static var hryvniasign_circle: UIImage? {
        return UIImage(systemName: "hryvniasign.circle")
    }
    static var hryvniasign_circle_fill: UIImage? {
        return UIImage(systemName: "hryvniasign.circle.fill")
    }
    static var hryvniasign_square: UIImage? {
        return UIImage(systemName: "hryvniasign.square")
    }
    static var hryvniasign_square_fill: UIImage? {
        return UIImage(systemName: "hryvniasign.square.fill")
    }
    static var nairasign_circle: UIImage? {
        return UIImage(systemName: "nairasign.circle")
    }
    static var nairasign_circle_fill: UIImage? {
        return UIImage(systemName: "nairasign.circle.fill")
    }
    static var nairasign_square: UIImage? {
        return UIImage(systemName: "nairasign.square")
    }
    static var nairasign_square_fill: UIImage? {
        return UIImage(systemName: "nairasign.square.fill")
    }
    static var guaranisign_circle: UIImage? {
        return UIImage(systemName: "guaranisign.circle")
    }
    static var guaranisign_circle_fill: UIImage? {
        return UIImage(systemName: "guaranisign.circle.fill")
    }
    static var guaranisign_square: UIImage? {
        return UIImage(systemName: "guaranisign.square")
    }
    static var guaranisign_square_fill: UIImage? {
        return UIImage(systemName: "guaranisign.square.fill")
    }
    static var coloncurrencysign_circle: UIImage? {
        return UIImage(systemName: "coloncurrencysign.circle")
    }
    static var coloncurrencysign_circle_fill: UIImage? {
        return UIImage(systemName: "coloncurrencysign.circle.fill")
    }
    static var coloncurrencysign_square: UIImage? {
        return UIImage(systemName: "coloncurrencysign.square")
    }
    static var coloncurrencysign_square_fill: UIImage? {
        return UIImage(systemName: "coloncurrencysign.square.fill")
    }
    static var cedisign_circle: UIImage? {
        return UIImage(systemName: "cedisign.circle")
    }
    static var cedisign_circle_fill: UIImage? {
        return UIImage(systemName: "cedisign.circle.fill")
    }
    static var cedisign_square: UIImage? {
        return UIImage(systemName: "cedisign.square")
    }
    static var cedisign_square_fill: UIImage? {
        return UIImage(systemName: "cedisign.square.fill")
    }
    static var cruzeirosign_circle: UIImage? {
        return UIImage(systemName: "cruzeirosign.circle")
    }
    static var cruzeirosign_circle_fill: UIImage? {
        return UIImage(systemName: "cruzeirosign.circle.fill")
    }
    static var cruzeirosign_square: UIImage? {
        return UIImage(systemName: "cruzeirosign.square")
    }
    static var cruzeirosign_square_fill: UIImage? {
        return UIImage(systemName: "cruzeirosign.square.fill")
    }
    static var tugriksign_circle: UIImage? {
        return UIImage(systemName: "tugriksign.circle")
    }
    static var tugriksign_circle_fill: UIImage? {
        return UIImage(systemName: "tugriksign.circle.fill")
    }
    static var tugriksign_square: UIImage? {
        return UIImage(systemName: "tugriksign.square")
    }
    static var tugriksign_square_fill: UIImage? {
        return UIImage(systemName: "tugriksign.square.fill")
    }
    static var millsign_circle: UIImage? {
        return UIImage(systemName: "millsign.circle")
    }
    static var millsign_circle_fill: UIImage? {
        return UIImage(systemName: "millsign.circle.fill")
    }
    static var millsign_square: UIImage? {
        return UIImage(systemName: "millsign.square")
    }
    static var millsign_square_fill: UIImage? {
        return UIImage(systemName: "millsign.square.fill")
    }
    static var manatsign_circle: UIImage? {
        return UIImage(systemName: "manatsign.circle")
    }
    static var manatsign_circle_fill: UIImage? {
        return UIImage(systemName: "manatsign.circle.fill")
    }
    static var manatsign_square: UIImage? {
        return UIImage(systemName: "manatsign.square")
    }
    static var manatsign_square_fill: UIImage? {
        return UIImage(systemName: "manatsign.square.fill")
    }
    static var rupeesign_circle: UIImage? {
        return UIImage(systemName: "rupeesign.circle")
    }
    static var rupeesign_circle_fill: UIImage? {
        return UIImage(systemName: "rupeesign.circle.fill")
    }
    static var rupeesign_square: UIImage? {
        return UIImage(systemName: "rupeesign.square")
    }
    static var rupeesign_square_fill: UIImage? {
        return UIImage(systemName: "rupeesign.square.fill")
    }
    static var bahtsign_circle: UIImage? {
        return UIImage(systemName: "bahtsign.circle")
    }
    static var bahtsign_circle_fill: UIImage? {
        return UIImage(systemName: "bahtsign.circle.fill")
    }
    static var bahtsign_square: UIImage? {
        return UIImage(systemName: "bahtsign.square")
    }
    static var bahtsign_square_fill: UIImage? {
        return UIImage(systemName: "bahtsign.square.fill")
    }
    static var larisign_circle: UIImage? {
        return UIImage(systemName: "larisign.circle")
    }
    static var larisign_circle_fill: UIImage? {
        return UIImage(systemName: "larisign.circle.fill")
    }
    static var larisign_square: UIImage? {
        return UIImage(systemName: "larisign.square")
    }
    static var larisign_square_fill: UIImage? {
        return UIImage(systemName: "larisign.square.fill")
    }
    static var bitcoinsign_circle: UIImage? {
        return UIImage(systemName: "bitcoinsign.circle")
    }
    static var bitcoinsign_circle_fill: UIImage? {
        return UIImage(systemName: "bitcoinsign.circle.fill")
    }
    static var bitcoinsign_square: UIImage? {
        return UIImage(systemName: "bitcoinsign.square")
    }
    static var bitcoinsign_square_fill: UIImage? {
        return UIImage(systemName: "bitcoinsign.square.fill")
    }
    static var circle_0: UIImage? {
        return UIImage(systemName: "0.circle")
    }
    static var circle_fill_0: UIImage? {
        return UIImage(systemName: "0.circle.fill")
    }
    static var square_0: UIImage? {
        return UIImage(systemName: "0.square")
    }
    static var square_fill_0: UIImage? {
        return UIImage(systemName: "0.square.fill")
    }
    static var circle_1: UIImage? {
        return UIImage(systemName: "1.circle")
    }
    static var circle_fill_1: UIImage? {
        return UIImage(systemName: "1.circle.fill")
    }
    static var square_1: UIImage? {
        return UIImage(systemName: "1.square")
    }
    static var square_fill_1: UIImage? {
        return UIImage(systemName: "1.square.fill")
    }
    static var circle_2: UIImage? {
        return UIImage(systemName: "2.circle")
    }
    static var circle_fill_2: UIImage? {
        return UIImage(systemName: "2.circle.fill")
    }
    static var square_2: UIImage? {
        return UIImage(systemName: "2.square")
    }
    static var square_fill_2: UIImage? {
        return UIImage(systemName: "2.square.fill")
    }
    static var circle_3: UIImage? {
        return UIImage(systemName: "3.circle")
    }
    static var circle_fill_3: UIImage? {
        return UIImage(systemName: "3.circle.fill")
    }
    static var square_3: UIImage? {
        return UIImage(systemName: "3.square")
    }
    static var square_fill_3: UIImage? {
        return UIImage(systemName: "3.square.fill")
    }
    static var circle_4: UIImage? {
        return UIImage(systemName: "4.circle")
    }
    static var circle_fill_4: UIImage? {
        return UIImage(systemName: "4.circle.fill")
    }
    static var square_4: UIImage? {
        return UIImage(systemName: "4.square")
    }
    static var square_fill_4: UIImage? {
        return UIImage(systemName: "4.square.fill")
    }
    static var alt_circle_4: UIImage? {
        return UIImage(systemName: "4.alt.circle")
    }
    static var alt_circle_fill_4: UIImage? {
        return UIImage(systemName: "4.alt.circle.fill")
    }
    static var alt_square_4: UIImage? {
        return UIImage(systemName: "4.alt.square")
    }
    static var alt_square_fill_4: UIImage? {
        return UIImage(systemName: "4.alt.square.fill")
    }
    static var circle_5: UIImage? {
        return UIImage(systemName: "5.circle")
    }
    static var circle_fill_5: UIImage? {
        return UIImage(systemName: "5.circle.fill")
    }
    static var square_5: UIImage? {
        return UIImage(systemName: "5.square")
    }
    static var square_fill_5: UIImage? {
        return UIImage(systemName: "5.square.fill")
    }
    static var circle_6: UIImage? {
        return UIImage(systemName: "6.circle")
    }
    static var circle_fill_6: UIImage? {
        return UIImage(systemName: "6.circle.fill")
    }
    static var square_6: UIImage? {
        return UIImage(systemName: "6.square")
    }
    static var square_fill_6: UIImage? {
        return UIImage(systemName: "6.square.fill")
    }
    static var alt_circle_6: UIImage? {
        return UIImage(systemName: "6.alt.circle")
    }
    static var alt_circle_fill_6: UIImage? {
        return UIImage(systemName: "6.alt.circle.fill")
    }
    static var alt_square_6: UIImage? {
        return UIImage(systemName: "6.alt.square")
    }
    static var alt_square_fill_6: UIImage? {
        return UIImage(systemName: "6.alt.square.fill")
    }
    static var circle_7: UIImage? {
        return UIImage(systemName: "7.circle")
    }
    static var circle_fill_7: UIImage? {
        return UIImage(systemName: "7.circle.fill")
    }
    static var square_7: UIImage? {
        return UIImage(systemName: "7.square")
    }
    static var square_fill_7: UIImage? {
        return UIImage(systemName: "7.square.fill")
    }
    static var circle_8: UIImage? {
        return UIImage(systemName: "8.circle")
    }
    static var circle_fill_8: UIImage? {
        return UIImage(systemName: "8.circle.fill")
    }
    static var square_8: UIImage? {
        return UIImage(systemName: "8.square")
    }
    static var square_fill_8: UIImage? {
        return UIImage(systemName: "8.square.fill")
    }
    static var circle_9: UIImage? {
        return UIImage(systemName: "9.circle")
    }
    static var circle_fill_9: UIImage? {
        return UIImage(systemName: "9.circle.fill")
    }
    static var square_9: UIImage? {
        return UIImage(systemName: "9.square")
    }
    static var square_fill_9: UIImage? {
        return UIImage(systemName: "9.square.fill")
    }
    static var alt_circle_9: UIImage? {
        return UIImage(systemName: "9.alt.circle")
    }
    static var alt_circle_fill_9: UIImage? {
        return UIImage(systemName: "9.alt.circle.fill")
    }
    static var alt_square_9: UIImage? {
        return UIImage(systemName: "9.alt.square")
    }
    static var alt_square_fill_9: UIImage? {
        return UIImage(systemName: "9.alt.square.fill")
    }
    static var circle_00: UIImage? {
        return UIImage(systemName: "00.circle")
    }
    static var circle_fill_00: UIImage? {
        return UIImage(systemName: "00.circle.fill")
    }
    static var square_00: UIImage? {
        return UIImage(systemName: "00.square")
    }
    static var square_fill_00: UIImage? {
        return UIImage(systemName: "00.square.fill")
    }
    static var circle_01: UIImage? {
        return UIImage(systemName: "01.circle")
    }
    static var circle_fill_01: UIImage? {
        return UIImage(systemName: "01.circle.fill")
    }
    static var square_01: UIImage? {
        return UIImage(systemName: "01.square")
    }
    static var square_fill_01: UIImage? {
        return UIImage(systemName: "01.square.fill")
    }
    static var circle_02: UIImage? {
        return UIImage(systemName: "02.circle")
    }
    static var circle_fill_02: UIImage? {
        return UIImage(systemName: "02.circle.fill")
    }
    static var square_02: UIImage? {
        return UIImage(systemName: "02.square")
    }
    static var square_fill_02: UIImage? {
        return UIImage(systemName: "02.square.fill")
    }
    static var circle_03: UIImage? {
        return UIImage(systemName: "03.circle")
    }
    static var circle_fill_03: UIImage? {
        return UIImage(systemName: "03.circle.fill")
    }
    static var square_03: UIImage? {
        return UIImage(systemName: "03.square")
    }
    static var square_fill_03: UIImage? {
        return UIImage(systemName: "03.square.fill")
    }
    static var circle_04: UIImage? {
        return UIImage(systemName: "04.circle")
    }
    static var circle_fill_04: UIImage? {
        return UIImage(systemName: "04.circle.fill")
    }
    static var square_04: UIImage? {
        return UIImage(systemName: "04.square")
    }
    static var square_fill_04: UIImage? {
        return UIImage(systemName: "04.square.fill")
    }
    static var circle_05: UIImage? {
        return UIImage(systemName: "05.circle")
    }
    static var circle_fill_05: UIImage? {
        return UIImage(systemName: "05.circle.fill")
    }
    static var square_05: UIImage? {
        return UIImage(systemName: "05.square")
    }
    static var square_fill_05: UIImage? {
        return UIImage(systemName: "05.square.fill")
    }
    static var circle_06: UIImage? {
        return UIImage(systemName: "06.circle")
    }
    static var circle_fill_06: UIImage? {
        return UIImage(systemName: "06.circle.fill")
    }
    static var square_06: UIImage? {
        return UIImage(systemName: "06.square")
    }
    static var square_fill_06: UIImage? {
        return UIImage(systemName: "06.square.fill")
    }
    static var circle_07: UIImage? {
        return UIImage(systemName: "07.circle")
    }
    static var circle_fill_07: UIImage? {
        return UIImage(systemName: "07.circle.fill")
    }
    static var square_07: UIImage? {
        return UIImage(systemName: "07.square")
    }
    static var square_fill_07: UIImage? {
        return UIImage(systemName: "07.square.fill")
    }
    static var circle_08: UIImage? {
        return UIImage(systemName: "08.circle")
    }
    static var circle_fill_08: UIImage? {
        return UIImage(systemName: "08.circle.fill")
    }
    static var square_08: UIImage? {
        return UIImage(systemName: "08.square")
    }
    static var square_fill_08: UIImage? {
        return UIImage(systemName: "08.square.fill")
    }
    static var circle_09: UIImage? {
        return UIImage(systemName: "09.circle")
    }
    static var circle_fill_09: UIImage? {
        return UIImage(systemName: "09.circle.fill")
    }
    static var square_09: UIImage? {
        return UIImage(systemName: "09.square")
    }
    static var square_fill_09: UIImage? {
        return UIImage(systemName: "09.square.fill")
    }
    static var circle_10: UIImage? {
        return UIImage(systemName: "10.circle")
    }
    static var circle_fill_10: UIImage? {
        return UIImage(systemName: "10.circle.fill")
    }
    static var square_10: UIImage? {
        return UIImage(systemName: "10.square")
    }
    static var square_fill_10: UIImage? {
        return UIImage(systemName: "10.square.fill")
    }
    static var circle_11: UIImage? {
        return UIImage(systemName: "11.circle")
    }
    static var circle_fill_11: UIImage? {
        return UIImage(systemName: "11.circle.fill")
    }
    static var square_11: UIImage? {
        return UIImage(systemName: "11.square")
    }
    static var square_fill_11: UIImage? {
        return UIImage(systemName: "11.square.fill")
    }
    static var circle_12: UIImage? {
        return UIImage(systemName: "12.circle")
    }
    static var circle_fill_12: UIImage? {
        return UIImage(systemName: "12.circle.fill")
    }
    static var square_12: UIImage? {
        return UIImage(systemName: "12.square")
    }
    static var square_fill_12: UIImage? {
        return UIImage(systemName: "12.square.fill")
    }
    static var circle_13: UIImage? {
        return UIImage(systemName: "13.circle")
    }
    static var circle_fill_13: UIImage? {
        return UIImage(systemName: "13.circle.fill")
    }
    static var square_13: UIImage? {
        return UIImage(systemName: "13.square")
    }
    static var square_fill_13: UIImage? {
        return UIImage(systemName: "13.square.fill")
    }
    static var circle_14: UIImage? {
        return UIImage(systemName: "14.circle")
    }
    static var circle_fill_14: UIImage? {
        return UIImage(systemName: "14.circle.fill")
    }
    static var square_14: UIImage? {
        return UIImage(systemName: "14.square")
    }
    static var square_fill_14: UIImage? {
        return UIImage(systemName: "14.square.fill")
    }
    static var circle_15: UIImage? {
        return UIImage(systemName: "15.circle")
    }
    static var circle_fill_15: UIImage? {
        return UIImage(systemName: "15.circle.fill")
    }
    static var square_15: UIImage? {
        return UIImage(systemName: "15.square")
    }
    static var square_fill_15: UIImage? {
        return UIImage(systemName: "15.square.fill")
    }
    static var circle_16: UIImage? {
        return UIImage(systemName: "16.circle")
    }
    static var circle_fill_16: UIImage? {
        return UIImage(systemName: "16.circle.fill")
    }
    static var square_16: UIImage? {
        return UIImage(systemName: "16.square")
    }
    static var square_fill_16: UIImage? {
        return UIImage(systemName: "16.square.fill")
    }
    static var circle_17: UIImage? {
        return UIImage(systemName: "17.circle")
    }
    static var circle_fill_17: UIImage? {
        return UIImage(systemName: "17.circle.fill")
    }
    static var square_17: UIImage? {
        return UIImage(systemName: "17.square")
    }
    static var square_fill_17: UIImage? {
        return UIImage(systemName: "17.square.fill")
    }
    static var circle_18: UIImage? {
        return UIImage(systemName: "18.circle")
    }
    static var circle_fill_18: UIImage? {
        return UIImage(systemName: "18.circle.fill")
    }
    static var square_18: UIImage? {
        return UIImage(systemName: "18.square")
    }
    static var square_fill_18: UIImage? {
        return UIImage(systemName: "18.square.fill")
    }
    static var circle_19: UIImage? {
        return UIImage(systemName: "19.circle")
    }
    static var circle_fill_19: UIImage? {
        return UIImage(systemName: "19.circle.fill")
    }
    static var square_19: UIImage? {
        return UIImage(systemName: "19.square")
    }
    static var square_fill_19: UIImage? {
        return UIImage(systemName: "19.square.fill")
    }
    static var circle_20: UIImage? {
        return UIImage(systemName: "20.circle")
    }
    static var circle_fill_20: UIImage? {
        return UIImage(systemName: "20.circle.fill")
    }
    static var square_20: UIImage? {
        return UIImage(systemName: "20.square")
    }
    static var square_fill_20: UIImage? {
        return UIImage(systemName: "20.square.fill")
    }
    static var circle_21: UIImage? {
        return UIImage(systemName: "21.circle")
    }
    static var circle_fill_21: UIImage? {
        return UIImage(systemName: "21.circle.fill")
    }
    static var square_21: UIImage? {
        return UIImage(systemName: "21.square")
    }
    static var square_fill_21: UIImage? {
        return UIImage(systemName: "21.square.fill")
    }
    static var circle_22: UIImage? {
        return UIImage(systemName: "22.circle")
    }
    static var circle_fill_22: UIImage? {
        return UIImage(systemName: "22.circle.fill")
    }
    static var square_22: UIImage? {
        return UIImage(systemName: "22.square")
    }
    static var square_fill_22: UIImage? {
        return UIImage(systemName: "22.square.fill")
    }
    static var circle_23: UIImage? {
        return UIImage(systemName: "23.circle")
    }
    static var circle_fill_23: UIImage? {
        return UIImage(systemName: "23.circle.fill")
    }
    static var square_23: UIImage? {
        return UIImage(systemName: "23.square")
    }
    static var square_fill_23: UIImage? {
        return UIImage(systemName: "23.square.fill")
    }
    static var circle_24: UIImage? {
        return UIImage(systemName: "24.circle")
    }
    static var circle_fill_24: UIImage? {
        return UIImage(systemName: "24.circle.fill")
    }
    static var square_24: UIImage? {
        return UIImage(systemName: "24.square")
    }
    static var square_fill_24: UIImage? {
        return UIImage(systemName: "24.square.fill")
    }
    static var circle_25: UIImage? {
        return UIImage(systemName: "25.circle")
    }
    static var circle_fill_25: UIImage? {
        return UIImage(systemName: "25.circle.fill")
    }
    static var square_25: UIImage? {
        return UIImage(systemName: "25.square")
    }
    static var square_fill_25: UIImage? {
        return UIImage(systemName: "25.square.fill")
    }
    static var circle_26: UIImage? {
        return UIImage(systemName: "26.circle")
    }
    static var circle_fill_26: UIImage? {
        return UIImage(systemName: "26.circle.fill")
    }
    static var square_26: UIImage? {
        return UIImage(systemName: "26.square")
    }
    static var square_fill_26: UIImage? {
        return UIImage(systemName: "26.square.fill")
    }
    static var circle_27: UIImage? {
        return UIImage(systemName: "27.circle")
    }
    static var circle_fill_27: UIImage? {
        return UIImage(systemName: "27.circle.fill")
    }
    static var square_27: UIImage? {
        return UIImage(systemName: "27.square")
    }
    static var square_fill_27: UIImage? {
        return UIImage(systemName: "27.square.fill")
    }
    static var circle_28: UIImage? {
        return UIImage(systemName: "28.circle")
    }
    static var circle_fill_28: UIImage? {
        return UIImage(systemName: "28.circle.fill")
    }
    static var square_28: UIImage? {
        return UIImage(systemName: "28.square")
    }
    static var square_fill_28: UIImage? {
        return UIImage(systemName: "28.square.fill")
    }
    static var circle_29: UIImage? {
        return UIImage(systemName: "29.circle")
    }
    static var circle_fill_29: UIImage? {
        return UIImage(systemName: "29.circle.fill")
    }
    static var square_29: UIImage? {
        return UIImage(systemName: "29.square")
    }
    static var square_fill_29: UIImage? {
        return UIImage(systemName: "29.square.fill")
    }
    static var circle_30: UIImage? {
        return UIImage(systemName: "30.circle")
    }
    static var circle_fill_30: UIImage? {
        return UIImage(systemName: "30.circle.fill")
    }
    static var square_30: UIImage? {
        return UIImage(systemName: "30.square")
    }
    static var square_fill_30: UIImage? {
        return UIImage(systemName: "30.square.fill")
    }
    static var circle_31: UIImage? {
        return UIImage(systemName: "31.circle")
    }
    static var circle_fill_31: UIImage? {
        return UIImage(systemName: "31.circle.fill")
    }
    static var square_31: UIImage? {
        return UIImage(systemName: "31.square")
    }
    static var square_fill_31: UIImage? {
        return UIImage(systemName: "31.square.fill")
    }
    static var circle_32: UIImage? {
        return UIImage(systemName: "32.circle")
    }
    static var circle_fill_32: UIImage? {
        return UIImage(systemName: "32.circle.fill")
    }
    static var square_32: UIImage? {
        return UIImage(systemName: "32.square")
    }
    static var square_fill_32: UIImage? {
        return UIImage(systemName: "32.square.fill")
    }
    static var circle_33: UIImage? {
        return UIImage(systemName: "33.circle")
    }
    static var circle_fill_33: UIImage? {
        return UIImage(systemName: "33.circle.fill")
    }
    static var square_33: UIImage? {
        return UIImage(systemName: "33.square")
    }
    static var square_fill_33: UIImage? {
        return UIImage(systemName: "33.square.fill")
    }
    static var circle_34: UIImage? {
        return UIImage(systemName: "34.circle")
    }
    static var circle_fill_34: UIImage? {
        return UIImage(systemName: "34.circle.fill")
    }
    static var square_34: UIImage? {
        return UIImage(systemName: "34.square")
    }
    static var square_fill_34: UIImage? {
        return UIImage(systemName: "34.square.fill")
    }
    static var circle_35: UIImage? {
        return UIImage(systemName: "35.circle")
    }
    static var circle_fill_35: UIImage? {
        return UIImage(systemName: "35.circle.fill")
    }
    static var square_35: UIImage? {
        return UIImage(systemName: "35.square")
    }
    static var square_fill_35: UIImage? {
        return UIImage(systemName: "35.square.fill")
    }
    static var circle_36: UIImage? {
        return UIImage(systemName: "36.circle")
    }
    static var circle_fill_36: UIImage? {
        return UIImage(systemName: "36.circle.fill")
    }
    static var square_36: UIImage? {
        return UIImage(systemName: "36.square")
    }
    static var square_fill_36: UIImage? {
        return UIImage(systemName: "36.square.fill")
    }
    static var circle_37: UIImage? {
        return UIImage(systemName: "37.circle")
    }
    static var circle_fill_37: UIImage? {
        return UIImage(systemName: "37.circle.fill")
    }
    static var square_37: UIImage? {
        return UIImage(systemName: "37.square")
    }
    static var square_fill_37: UIImage? {
        return UIImage(systemName: "37.square.fill")
    }
    static var circle_38: UIImage? {
        return UIImage(systemName: "38.circle")
    }
    static var circle_fill_38: UIImage? {
        return UIImage(systemName: "38.circle.fill")
    }
    static var square_38: UIImage? {
        return UIImage(systemName: "38.square")
    }
    static var square_fill_38: UIImage? {
        return UIImage(systemName: "38.square.fill")
    }
    static var circle_39: UIImage? {
        return UIImage(systemName: "39.circle")
    }
    static var circle_fill_39: UIImage? {
        return UIImage(systemName: "39.circle.fill")
    }
    static var square_39: UIImage? {
        return UIImage(systemName: "39.square")
    }
    static var square_fill_39: UIImage? {
        return UIImage(systemName: "39.square.fill")
    }
    static var circle_40: UIImage? {
        return UIImage(systemName: "40.circle")
    }
    static var circle_fill_40: UIImage? {
        return UIImage(systemName: "40.circle.fill")
    }
    static var square_40: UIImage? {
        return UIImage(systemName: "40.square")
    }
    static var square_fill_40: UIImage? {
        return UIImage(systemName: "40.square.fill")
    }
    static var circle_41: UIImage? {
        return UIImage(systemName: "41.circle")
    }
    static var circle_fill_41: UIImage? {
        return UIImage(systemName: "41.circle.fill")
    }
    static var square_41: UIImage? {
        return UIImage(systemName: "41.square")
    }
    static var square_fill_41: UIImage? {
        return UIImage(systemName: "41.square.fill")
    }
    static var circle_42: UIImage? {
        return UIImage(systemName: "42.circle")
    }
    static var circle_fill_42: UIImage? {
        return UIImage(systemName: "42.circle.fill")
    }
    static var square_42: UIImage? {
        return UIImage(systemName: "42.square")
    }
    static var square_fill_42: UIImage? {
        return UIImage(systemName: "42.square.fill")
    }
    static var circle_43: UIImage? {
        return UIImage(systemName: "43.circle")
    }
    static var circle_fill_43: UIImage? {
        return UIImage(systemName: "43.circle.fill")
    }
    static var square_43: UIImage? {
        return UIImage(systemName: "43.square")
    }
    static var square_fill_43: UIImage? {
        return UIImage(systemName: "43.square.fill")
    }
    static var circle_44: UIImage? {
        return UIImage(systemName: "44.circle")
    }
    static var circle_fill_44: UIImage? {
        return UIImage(systemName: "44.circle.fill")
    }
    static var square_44: UIImage? {
        return UIImage(systemName: "44.square")
    }
    static var square_fill_44: UIImage? {
        return UIImage(systemName: "44.square.fill")
    }
    static var circle_45: UIImage? {
        return UIImage(systemName: "45.circle")
    }
    static var circle_fill_45: UIImage? {
        return UIImage(systemName: "45.circle.fill")
    }
    static var square_45: UIImage? {
        return UIImage(systemName: "45.square")
    }
    static var square_fill_45: UIImage? {
        return UIImage(systemName: "45.square.fill")
    }
    static var circle_46: UIImage? {
        return UIImage(systemName: "46.circle")
    }
    static var circle_fill_46: UIImage? {
        return UIImage(systemName: "46.circle.fill")
    }
    static var square_46: UIImage? {
        return UIImage(systemName: "46.square")
    }
    static var square_fill_46: UIImage? {
        return UIImage(systemName: "46.square.fill")
    }
    static var circle_47: UIImage? {
        return UIImage(systemName: "47.circle")
    }
    static var circle_fill_47: UIImage? {
        return UIImage(systemName: "47.circle.fill")
    }
    static var square_47: UIImage? {
        return UIImage(systemName: "47.square")
    }
    static var square_fill_47: UIImage? {
        return UIImage(systemName: "47.square.fill")
    }
    static var circle_48: UIImage? {
        return UIImage(systemName: "48.circle")
    }
    static var circle_fill_48: UIImage? {
        return UIImage(systemName: "48.circle.fill")
    }
    static var square_48: UIImage? {
        return UIImage(systemName: "48.square")
    }
    static var square_fill_48: UIImage? {
        return UIImage(systemName: "48.square.fill")
    }
    static var circle_49: UIImage? {
        return UIImage(systemName: "49.circle")
    }
    static var circle_fill_49: UIImage? {
        return UIImage(systemName: "49.circle.fill")
    }
    static var square_49: UIImage? {
        return UIImage(systemName: "49.square")
    }
    static var square_fill_49: UIImage? {
        return UIImage(systemName: "49.square.fill")
    }
    static var circle_50: UIImage? {
        return UIImage(systemName: "50.circle")
    }
    static var circle_fill_50: UIImage? {
        return UIImage(systemName: "50.circle.fill")
    }
    static var square_50: UIImage? {
        return UIImage(systemName: "50.square")
    }
    static var square_fill_50: UIImage? {
        return UIImage(systemName: "50.square.fill")
    }
 
}
