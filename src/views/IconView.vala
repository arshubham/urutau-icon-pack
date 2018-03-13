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

    public class IconView : Gtk.Grid {
         private Gtk.FlowBox flow_box;
         private Gtk.IconTheme icon_theme = new Gtk.IconTheme();

    construct {
        flow_box = new Gtk.FlowBox ();
        flow_box.set_activate_on_single_click (true);

        var scrolled = new Gtk.ScrolledWindow (null, null);
        scrolled.expand = true;
        scrolled.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        scrolled.add (flow_box);

        Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
        var load_button_applications = new Gtk.Button.with_label ("Load Applications Icons");
        load_button_applications.clicked.connect (() => load_icons.begin ("Applications"));
        load_button_applications.margin = 6;


        var load_button_actions = new Gtk.Button.with_label ("Load Actions Icons");
        load_button_actions.clicked.connect (() => load_icons.begin ("Actions"));
        load_button_actions.margin = 6;

        var load_button_categories = new Gtk.Button.with_label ("Load Categories Icons");
        load_button_categories.clicked.connect (() => load_icons.begin ("Categories"));
        load_button_categories.margin = 6;

        var load_button_devices = new Gtk.Button.with_label ("Load Devices Icons");
        load_button_devices.clicked.connect (() => load_icons.begin ("Devices"));
        load_button_devices.margin = 6;

        var load_button_mime = new Gtk.Button.with_label ("Load MimeTypes Icons");
        load_button_mime.clicked.connect (() => load_icons.begin ("MimeTypes"));
        load_button_mime.margin = 6;


        box.pack_start (load_button_applications, false, false, 0);
		box.pack_start (load_button_actions, false, false, 0);
		box.pack_start (load_button_categories, false, false, 0);
		box.pack_start (load_button_devices, false, false, 0);
		box.pack_start (load_button_mime, false, false, 0);
        attach (scrolled, 0, 0, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1, 1, 1);
        attach (box, 0, 2, 1, 1);

    }

    private async void load_icons (string type) throws ThreadError {
    SourceFunc callback =  load_icons.callback;
        flow_box.get_children ().@foreach ((child) => {
            child.destroy ();
        });

        var icons = new Gee.ArrayList<string> ();
        Gtk.Settings.get_default().gtk_icon_theme_name = "urutau-icons" ;
        icon_theme.set_custom_theme ("urutau-icons");


        icon_theme.list_icons (type).@foreach ((name) => {
            icons.add (name);
        });

        icon_theme.set_custom_theme ("elementary");
        icon_theme.list_icons (type).@foreach ((name) => {
            icons.remove (name);
        });

        foreach (string name in icons) {
            var image = new Granite.AsyncImage.from_icon_name_async (name, Gtk.IconSize.DIALOG);
            flow_box.add (image);
            flow_box.show_all ();
        }
    }
    }
}