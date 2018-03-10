 namespace PapirusIconPack.Views {

    public class HomeView : Gtk.Grid {
    public HomeView () {
                var welcome = new Granite.Widgets.Welcome ("Home View", "This is the welcome description");

            this.add (welcome);
            }
    }
}