/*-
 * Copyright (c) 2018 Shubham Arora (https://github.com/arshubham/urutau-icon-pack)
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA.
 *
 * Authored by: Shubham Arora <shubhamarora@protonmail.com>
 */

 namespace IconPack.Views {

    public class HomeView : Gtk.Grid {

    Gtk.Grid main_grid;
    Gtk.Grid left_grid;
    Gtk.Grid right_grid;

    construct {
        main_grid = new Gtk.Grid();
        // Left Grid
        left_grid = new Gtk.Grid();
        var image = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/com.github.arshubham.urutau-icon-pack.svg");
        var image1 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-1.svg");
        var image2 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-2.svg");
        var image3 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-3.svg");
        var image4 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-4.svg");
        var image5 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-5.svg");
        var image6 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-6.svg");
        var image7 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-7.svg");
        var image8 = new Gtk.Image.from_resource ("/com/github/arshubham/urutau-icon-pack/default-icon-8.svg");
        left_grid.attach (image, 2, 0, 2, 2);
        left_grid.attach (image1, 1, 3, 1, 1);
        left_grid.attach (image2, 2, 3, 1, 1);
        left_grid.attach (image3, 3, 3, 1, 1);
        left_grid.attach (image4, 4, 3, 1, 1);
        left_grid.attach (image5, 1, 4, 1, 1);
        left_grid.attach (image6, 2, 4, 1, 1);
        left_grid.attach (image7, 3, 4, 1, 1) ;
        left_grid.attach (image8, 4, 4, 1, 1);

        left_grid.set_margin_start (20);
        left_grid.set_margin_end (20);
        left_grid.set_row_spacing (30);
        left_grid.set_column_spacing (30);
        left_grid.set_row_baseline_position (0, Gtk.BaselinePosition.CENTER);
        left_grid.set_row_homogeneous (true);
        left_grid.set_hexpand (true);
        left_grid.set_halign (Gtk.Align.CENTER);

        // Right Grid
        right_grid = new Gtk.Grid ();
        var download_icon_pack_button = new Gtk.Button.with_label ("Download Icon Pack");
        var apply_icon_pack_button = new Gtk.Button.with_label ("Apply Icon Pack");
        var reset_icon_pack_button = new Gtk.Button.with_label ("Reset Default Icon Pack");
        var remove_icon_pack_button = new Gtk.Button.with_label ("Remove and Reset Icon Pack");

        download_icon_pack_button.get_style_context ().add_class ("suggested-action");
        remove_icon_pack_button.get_style_context ().add_class ("destructive-action");

        right_grid.attach(download_icon_pack_button, 0, 0 ,1, 1);
        right_grid.attach(apply_icon_pack_button, 0, 1 , 1, 1);
        right_grid.attach(reset_icon_pack_button, 0, 2 , 1, 1);
        right_grid.attach(remove_icon_pack_button, 0, 3 , 1 , 1);
        right_grid.set_column_homogeneous (true);
        right_grid.set_row_spacing (30);
        right_grid.set_column_spacing (30);
        right_grid.set_hexpand (true);
        right_grid.set_halign (Gtk.Align.CENTER);

        var icon_pack_name = new Gtk.Label ("Urutau Icon Pack");
        icon_pack_name.margin_top = 12;
        icon_pack_name.margin_start = 24;
        icon_pack_name.margin_end = 24;
        icon_pack_name.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);

        var num_app_icons = new Gtk.Label ("App Icons: 500+");
        num_app_icons.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        var num_action_icons = new Gtk.Label ("Action Icons: 100+");
        num_action_icons.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        var num_panel_icons = new Gtk.Label ("Panel Icons: 200+");
        num_panel_icons.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);


        var num_places_icons = new Gtk.Label ("Places Icons: 50+");
        num_places_icons.get_style_context ().add_class (Granite.STYLE_CLASS_H4_LABEL);

        var card = new Gtk.Grid ();
        card.orientation = Gtk.Orientation.VERTICAL;
        card.get_style_context ().add_class (Granite.STYLE_CLASS_CARD);
        card.add (icon_pack_name);
        card.add (num_app_icons);
        card.add (num_action_icons);
        card.add (num_panel_icons);
        card.add (num_places_icons);
        card.halign = Gtk.Align.CENTER;

        main_grid.set_row_spacing (50);
        main_grid.set_column_spacing (50);
        main_grid.set_halign (Gtk.Align.FILL);
        main_grid.attach (left_grid,0, 0, 1, 2);
        main_grid.attach (right_grid,1, 0, 1, 1);
        main_grid.attach (card,1, 1, 1, 1);
        main_grid.set_row_baseline_position (0, Gtk.BaselinePosition.CENTER);
        main_grid.set_hexpand (true);
        main_grid.set_margin_top (20);
        main_grid.set_column_homogeneous(true);
		this.add (main_grid);
    }
    }
}