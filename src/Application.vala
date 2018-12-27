/*-
 *  Copyright (c) 2019 George Sofianos
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 *  Authored by: George Sofianos <george.sofianos@outlook.com>
 *  
 */

public class Bumblebee.App : Gtk.Application {

    public static Core.Player player;

    private Gtk.Window main_window;
    private Gtk.Builder builder;
    private Gtk.Image station_cover_image;

    public App () {
        Object (
            application_id: "com.github.gsofianos.bumblebee",
            flags: ApplicationFlags.FLAGS_NONE
        );

        this.set_flags (ApplicationFlags.HANDLES_COMMAND_LINE);
    }

    protected override void activate () {
        if (main_window == null)
            initialize ();
        else if (!main_window.visible)
            main_window.show ();
    }

    private void initialize() {
        create_core_objects ();
        create_user_interface();
    }

    private void create_core_objects() {
        player = new Core.Player ();
    }

    private void create_user_interface() {
        try {
            builder = new Gtk.Builder();
            builder.add_from_file("../data/UI.glade");
    
            main_window = builder.get_object("main_window") as Gtk.Window;
            station_cover_image = builder.get_object("radio_cover") as Gtk.Image;

            var cover_image_pixbuf = new Gdk.Pixbuf.from_file(
                "/home/george/Pictures/dromos.png");

            station_cover_image.pixbuf =  cover_image_pixbuf.scale_simple(
                300,
                300,
                Gdk.BILINEAR);

            main_window.show_all();
            this.add_window(main_window);
            } catch(Error err) {
                print(err.message);
            }
    }

    public override int command_line (ApplicationCommandLine command_line) {
        activate();
  
        string[] args = command_line.get_arguments();
        foreach (string argument in args) {
          if (argument.has_prefix("webradio:")) {
            var webRadio = new Models.WebRadio.from_link(argument);
            var station = new Models.Station(0,webRadio.name,webRadio.url);

            // TODO: move these
            player.add(station);
            player.play();
            break;
          }
        }
        return 0;
      }
}