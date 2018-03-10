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

using IconPack.Configs;

namespace IconPack.Views {

    public class AppView : Gtk.Grid {

        private Gtk.ApplicationWindow app;
        private Gtk.HeaderBar headerbar;
        private Granite.Widgets.ModeButton view_mode;
        private IconPack.Views.HomeView home_view;
        private IconPack.Views.IconView icon_view;
        private IconPack.Views.IconRequestView icon_request_view;
        private IconPack.Views.FaqView faq_view;
        private Gtk.Stack content;

        construct {
            build_headerbar ();
            build_mode_buttons ();
            build_views ();
        }

        public AppView (Gtk.ApplicationWindow app) {
            this.app = app;
            app.set_default_size (1000, 700);
            app.set_size_request (1000, 700);
            app.resizable = false;
            app.deletable = true;
            app.set_titlebar (headerbar);

            var box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
            box.pack_end (content, true, true, 0);


            this.add (box);
            this.show_all ();
        }

        void build_headerbar () {

            headerbar = new Gtk.HeaderBar ();
            headerbar.title = _ ("Papirus Icon Pack");
            headerbar.show_close_button = true;
        }

        private void build_mode_buttons () {
            view_mode = new Granite.Widgets.ModeButton ();
            view_mode.margin = 1;
            view_mode.margin_right = 20;
            view_mode.append_text (_("Home"));
            view_mode.append_text (_("Icons"));
            view_mode.append_text (_("Icon Request"));
            view_mode.append_text (_("FAQ"));
            view_mode.selected = 0;

              view_mode.mode_changed.connect (
                () => {
                    switch (view_mode.selected) {
                    case 1 :
                        show_icons ();
                        break;
                    case 2 :
                        show_icon_request ();
                        break;
                    case 3 :
                        show_faq ();
                        break;
                    default :
                        show_home ();
                        break;
                    }
             });

            headerbar.set_custom_title (view_mode);
        }

        private void build_views () {
            content = new Gtk.Stack ();
            content.transition_type = Gtk.StackTransitionType.OVER_LEFT_RIGHT;
            content.transition_duration = 500;
            content.hhomogeneous = true;
            content.vhomogeneous = true;
            home_view = new HomeView ();
            icon_view = new IconView ();
            icon_request_view = new IconRequestView ();
            faq_view = new FaqView ();
            content.add_named (home_view, "home");
            content.add_named (icon_view, "icons");
            content.add_named (icon_request_view, "request");
            content.add_named (faq_view, "faq");
            content.visible_child_name = "home";
        }

        private void show_home () {

            content.visible_child_name = "home";

        }

          private void show_icons () {

            content.visible_child_name = "icons";

        }
        private void show_icon_request () {

            content.visible_child_name = "request";

        }
        private void show_faq () {

            content.visible_child_name = "faq";

        }
    }
}
