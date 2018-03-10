 namespace PapirusIconPack.Views {

    public class IconView : Gtk.Grid {
        public IconView () {
                var welcome = new Granite.Widgets.Welcome ("Icon View", "This is the welcome description");

            this.add (welcome);
            }
    }
}