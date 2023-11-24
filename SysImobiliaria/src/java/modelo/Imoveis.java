package modelo;

import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import lombok.*;

@Getter
@Setter
public class Imoveis {

    private int idImovel;
    private String tipo;
    private double precoM2;
    private String localizacao;
    private double areaUtil;
    private double areaTotal;
    private int comodos;
    private Proprietario proprietario;
    private int vagasGaragem;
    private String status;
    private LocalDate dataInicial;

    ArrayList<Imoveis> listaImoveis;

    public Imoveis() {
        this.proprietario = new Proprietario();
        
    }

}
