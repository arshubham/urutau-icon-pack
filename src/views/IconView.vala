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

        attach (scrolled, 0, 0, 1, 1);
        attach (new Gtk.Separator (Gtk.Orientation.HORIZONTAL), 0, 1, 1, 1);
        load_icons.begin ();
    }

    private async void load_icons () throws ThreadError {
    SourceFunc callback =  load_icons.callback;
        flow_box.get_children ().@foreach ((child) => {
            child.destroy ();
        });

        var icons = new Gee.ArrayList<string> ();

        icon_theme.set_custom_theme ("urutau-icons");
        ThreadFunc<bool> run = () => {

        icon_theme.list_icons ("Applications").@foreach ((name) => {
            icons.add (name);
            stdout.printf ("%s\n", name);
        });

        icon_theme.set_custom_theme ("elementary");
        icon_theme.list_icons ("Applications").@foreach ((name) => {
            icons.remove (name);
        });
        Idle.add((owned) callback);

        return true;
        };
        new Thread<bool>("thread-example", run);
    yield;

        foreach (string name in icons) {
            var image = new Granite.AsyncImage.from_icon_name_async (name, Gtk.IconSize.DIALOG);
            flow_box.add (image);
            flow_box.show_all ();
        }
    }
    }
}