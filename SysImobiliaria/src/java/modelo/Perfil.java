package modelo;

import java.util.ArrayList;
import lombok.*;

@Getter
@Setter
public class Perfil {

    private int idPerfil;
    private String perfil;
    ArrayList<Menu> listaVinculados;

    public Perfil() {
    }

    public Perfil(int id, String perfil) {
        this.idPerfil = id;
        this.perfil = perfil;
    }

    @Override
    public String toString() {
        return getPerfil();
    }

}
