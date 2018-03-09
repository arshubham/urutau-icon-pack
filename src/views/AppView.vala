/*-
 * Copyright (c) 2018 Shubham Arora (https://github.com/arshubham/papirus-icon-pack)
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

using PapirusIconPack.Widgets;
using PapirusIconPack.Configs;

namespace PapirusIconPack.Views {

    public class AppView : Gtk.Grid {

        private Gtk.ApplicationWindow app;
        public HeaderBar headerbar;

        public AppView (Gtk.ApplicationWindow app) {
            this.app = app;
            this.app.set_default_size (800, 700);
            this.app.set_size_request (800, 700);
            this.app.deletable = true;
            this.app.resizable = true;

            this.headerbar = new HeaderBar ();
            this.app.set_titlebar (this.headerbar);
        }
    }
}
