package modelo;

import java.util.ArrayList;
import lombok.*;

@Getter
@Setter
public class Proprietario {

    private int idProprietario;
    private String nome;
    private String email;
    private String cpf;
    private String telefone;
    private boolean status;
    ArrayList<Proprietario> listaProprietarios;

}
