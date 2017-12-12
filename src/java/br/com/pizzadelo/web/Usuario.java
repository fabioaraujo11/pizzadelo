package br.com.pizzadelo.web;


import java.sql.PreparedStatement;

public class Usuario {

    static Usuario getUsuario() {
        Usuario usuario = new Usuario();
        return usuario;
    }
    private String nm_usuario;
    private String nm_email_usuario;
    private String cd_password_usuario;
    private char nm_tipo_usuario;
    private char ic_sexo_M_F;
    private String cd_cpf_usuario;

    public Usuario() {
    }

    
    
    public Usuario(String nm_usuario, String nm_email_usuario, String cd_password_usuario, char nm_tipo_usuario, char ic_sexo_M_F, String cd_cpf_usuario) {
        this.nm_usuario = nm_usuario;
        this.nm_email_usuario = nm_email_usuario;
        this.cd_password_usuario = cd_password_usuario;
        this.nm_tipo_usuario = nm_tipo_usuario;
        this.ic_sexo_M_F = ic_sexo_M_F;
        this.cd_cpf_usuario = cd_cpf_usuario;
    }
    

    public static void setUsuarios(String nm_usuario, String nm_email_usuario, String cd_password_usuario, char nm_tipo_usuario, char ic_sexo_M_F, String cd_cpf_usuario) throws Exception {
       Usuario usuario = new Usuario(nm_usuario, nm_email_usuario, cd_password_usuario, nm_tipo_usuario, ic_sexo_M_F, cd_cpf_usuario);
        Usuario.criarUsuario(usuario);
    }

    public static void inserirXablocs() {
        Usuario usuario = new Usuario("Fabio Araujo", "fabio_araujo11@hotmail.com", "123", 'A', 'M', "47182262878");
    }

    
    
    public static void limparUsuario(Usuario usuario){
        usuario = null;
    }

    public static void criarUsuario(Usuario usuario)
            throws Exception {
        String SQL = "INSERT INTO usuario VALUES(?,?,?,?,?,?)";
        PreparedStatement s = Database.getConnection().prepareStatement(SQL);
            s.setString(1, usuario.getCd_cpf_usuario());
            s.setString(2, usuario.getNm_email_usuario());
            s.setString(3, usuario.getNm_usuario());
            s.setString(4, usuario.getCd_password_usuario());
            s.setString(5, "U");
            s.setString(6, String.valueOf(usuario.getIc_sexo_M_F()));
            s.execute();
            s.close();
       
    }
    public String getNm_usuario() {
        return nm_usuario;
    }

    public void setNm_usuario(String nm_usuario) {
        this.nm_usuario = nm_usuario;
    }

    public String getNm_email_usuario() {
        return nm_email_usuario;
    }

    public void setNm_email_usuario(String nm_email_usuario) {
        this.nm_email_usuario = nm_email_usuario;
    }

    public String getCd_password_usuario() {
        return cd_password_usuario;
    }

    public void setCd_password_usuario(String cd_password_usuario) {
        this.cd_password_usuario = cd_password_usuario;
    }

    public char getNm_tipo_usuario() {
        return nm_tipo_usuario;
    }

    public void setNm_tipo_usuario(char nm_tipo_usuario) {
        this.nm_tipo_usuario = nm_tipo_usuario;
    }

    public char getIc_sexo_M_F() {
        return ic_sexo_M_F;
    }

    public void setIc_sexo_M_F(char ic_sexo_M_F) {
        this.ic_sexo_M_F = ic_sexo_M_F;
    }

    public String getCd_cpf_usuario() {
        return cd_cpf_usuario;
    }

    public void setCd_cpf_usuario(String cd_cpf_usuario) {
        this.cd_cpf_usuario = cd_cpf_usuario;
    }

    
    
}
