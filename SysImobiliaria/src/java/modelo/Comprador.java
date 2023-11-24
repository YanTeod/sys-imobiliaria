
package modelo;

import java.util.ArrayList;
import lombok.*;

@Getter
@Setter
public class Comprador {

    private int idComprador;
    private String nome;
    private String email;
    private String telefone;
    private String cpf;
    private ArrayList<Comprador> listaCompradores;

}
