package modelo;

import lombok.*;

@Getter
@Setter
public class Menu {

    private int idMenu;
    private String menu;
    private String link;
 
    public Menu() {
    }

    public Menu(int idMenu, String menu, String link, String icone) {
        this.idMenu = idMenu;
        this.menu = menu;
        this.link = link;

    }

}
