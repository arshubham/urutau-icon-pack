 namespace PapirusIconPack.Views {

    public class IconRequestView : Gtk.Grid {
    public IconRequestView () {
                var welcome = new Granite.Widgets.Welcome ("Icon Request View", "This is the welcome description");

            this.add (welcome);
            }
    }
}