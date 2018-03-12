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

    Gtk.Grid grid;
    Gtk.Grid sub_grid1;
    Gtk.Grid sub_grid2;

    construct {
        grid = new Gtk.Grid();
        grid.set_row_homogeneous (true);
        sub_grid1 = new Gtk.Grid();
        var image = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image1 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image2 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image3 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image4 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image5 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image6 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image7 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        var image8 = new Granite.AsyncImage.from_icon_name_async ("firefox", Gtk.IconSize.DIALOG);
        sub_grid1.attach(image, 2, 0, 2, 1);
        sub_grid1.attach(image1, 1, 1, 1, 1);
        sub_grid1.attach(image2, 2, 1, 1, 1);
        sub_grid1.attach(image3, 3, 1, 1, 1);
        sub_grid1.attach(image4, 4, 1, 1, 1);
        sub_grid1.attach(image5, 1, 2, 1, 1);
        sub_grid1.attach(image6, 2, 2, 1, 1);
        sub_grid1.attach(image7, 3, 2, 1, 1);
        sub_grid1.attach(image8, 4, 2, 1, 1);
        sub_grid1.set_margin_start (20);
        sub_grid1.set_margin_end (20);
        sub_grid1.set_row_spacing (30);
        sub_grid1.set_column_spacing (30);
        sub_grid1.set_row_baseline_position (0, Gtk.BaselinePosition.CENTER);
        sub_grid1.set_row_homogeneous (true);
        sub_grid1.set_hexpand (true);
        sub_grid1.set_halign (Gtk.Align.CENTER);
        sub_grid2 = new Gtk.Grid ();
        var button = new Gtk.Button.with_label ("Download and Apply Icon Pack");
        var button1 = new Gtk.Button.with_label ("Apply Icon Pack");
        var button2 = new Gtk.Button.with_label ("Reset Default Icon Pack");
        var button3 = new Gtk.Button.with_label ("Remove and Reset Icon Pack");
        button.get_style_context ().add_class ("suggested-action");
        button3.get_style_context ().add_class ("destructive-action");
        sub_grid2.attach(button, 0, 0 ,2, 1);
        sub_grid2.attach(button1, 0, 1 , 2, 1);
        sub_grid2.attach(button2, 0, 2 , 2, 1);
        sub_grid2.attach(button3, 0, 3 ,2 , 1);
        sub_grid2.set_row_homogeneous (true);
        sub_grid2.set_row_spacing (30);
        sub_grid2.set_column_spacing (30);
        sub_grid2.set_hexpand (true);
        sub_grid2.set_halign (Gtk.Align.CENTER);


        grid.set_row_spacing (50);
        grid.set_column_spacing (50);
        grid.set_halign (Gtk.Align.FILL);
        grid.attach (sub_grid1,0, 0, 1, 1);
        grid.attach (sub_grid2,1, 0, 1, 1);
        grid.set_row_baseline_position (0, Gtk.BaselinePosition.CENTER);
        grid.set_hexpand (true);
        grid.set_margin_top (20);

        grid.set_column_homogeneous(true);
		this.add (grid);
    }
    }
}