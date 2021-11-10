package fr.scabois.scabotheque.bean;

public interface HasIdPositionLibelle extends HasIdLibelle {

//    @Column(name = "n_position")
//    protected Integer position;
    public Integer getPosition();
//    {
//        return position;
//    }

    public void setPosition(Integer position);
//    {
//        this.position = position;
//    }

}
