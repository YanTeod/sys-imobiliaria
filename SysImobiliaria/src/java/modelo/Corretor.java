package modelo;

import java.util.ArrayList;
import lombok.*;

@Getter
@Setter
public class Corretor {
    private int idCorretor;
    private String nomeCorretor;
    private String login;
    private String senha;
    private String Status;
    private Perfil perfil;
    private int idPerfil;
    private String status;
    ArrayList<Corretor> listaCorretores;

   

   
    
}
