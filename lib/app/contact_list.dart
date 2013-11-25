part of contacts_mvc_app;

class ContactList extends ui.Composite {
  
  //Contact contact;
  ui.CaptionPanel panel;
  ui.Grid grid;
  
  Contacts _contacts;

  ContactList(ContactApp contactApp, this._contacts) {
    
    DomainSession session = contactApp.session;
    Contacts contacts = contactApp.contacts;
    
    
    ui.RootPanel.get().add(new ui.Html("<br/>"));
    
    /*var cont = new Contact(contacts.concept);
    cont.noCon="CN001";
    cont.prenom="aurel";
    cont.nom="BK";
    cont.email="aure@yahoo.fr";
    cont.tel="567-86790087";
    cont.adresse="2455 rue grand matin quebec";
    contacts.add(cont);
    contactApp.save();*/
    //var nb = contacts.count;
    
    /*grid = new ui.Grid(5,8);    
    grid.addStyleName("cw-FlexTable");
    grid.getElement().style.border="1px solid black";
    grid.setCellPadding(6);*/
        
    panel = new ui.CaptionPanel("Liste des Contacts");
    
    panel.setContentWidget(showListCont(contactApp,contacts));
    
    panel.getElement().style.border = "2px solid black";
    //panel.getContentWidget().getElement().style.margin = "5px 10px 10px 10px";
    //panel.getContentWidget().getElement().style.padding = "10px 10px 10px 10px";
    //panel.getContentWidget().getElement().style.border = "1px solid #ccf";
    panel.setWidth("807px");            
   
    ui.RootPanel.get().add(panel);
    
  }

  
  ui.Grid showListCont(ContactApp contactApp,Contacts contacts){
    
    
    grid = new ui.Grid(5,8);    
    grid.addStyleName("cw-FlexTable");
    grid.getElement().style.border="1px solid black";
    grid.setCellPadding(6);
    
    int numRows = grid.getRowCount();
    int numColumns = grid.getColumnCount();  
    grid.setIsWidget(0, 0, new ui.Html("Num"));
    grid.setIsWidget(0, 1, new ui.Html("Prenom"));
    grid.setIsWidget(0, 2, new ui.Html("Nom"));
    grid.setIsWidget(0, 3, new ui.Html("Email"));
    grid.setIsWidget(0, 4, new ui.Html("Téléphone"));
    grid.setIsWidget(0, 5, new ui.Html("Adresse"));
    grid.setIsWidget(0, 6, new ui.Html("Modifier"));
    grid.setIsWidget(0, 7, new ui.Html("Supprimer"));
    
    String json = window.localStorage['contacts-dartling-dwt'];
    
    print(json);
    
    if (json != null) {
      try {
        contacts.fromJson(JSON.decode(json));
        var row = 1;
          for (Contact contact in contacts) {
          
            grid.setIsWidget(row, 0, new ui.Html(contact.noCon));
            grid.setIsWidget(row, 1, new ui.Html(contact.prenom));
            grid.setIsWidget(row, 2, new ui.Html(contact.nom));
            grid.setIsWidget(row, 3, new ui.Html(contact.email));
            grid.setIsWidget(row, 4, new ui.Html(contact.tel));
            grid.setIsWidget(row, 5, new ui.Html(contact.adresse));
            grid.setIsWidget(row, 6, new ui.Button("Update", 
                new event.ClickHandlerAdapter((event.ClickEvent event) {
                  
                  contactApp.contactform.Txtnocon.text = contact.noCon;
                  contactApp.contactform.Txtprenom.text = contact.prenom;
                  contactApp.contactform.Txtnom.text = contact.nom;
                  contactApp.contactform.Txtemail.text = contact.email;
                  contactApp.contactform.Txttel.text = contact.tel;
                  contactApp.contactform.Txtadresse.text = contact.adresse;  
                  contactApp.contactform.Txtnocon.enabled=false;
                  
                  contactApp.contactform.modContact = contact; //contact a mod
                  
                  contactApp.contactform.BtnAdd.text="Modifier";
                  
                  
              
                })));
            grid.setIsWidget(row, 7, new ui.Button("Delete", 
                new event.ClickHandlerAdapter((event.ClickEvent event) {
                  
                  if(window.confirm("Voulez vous supprimer ce contact?!!")){
                    
                    contacts.remove(contact);
                    contactApp.save();                     
                    window.location.assign(window.location.href);
                    
                  }
                  
                })));            
                     
            row++;
          
        }
      } on Exception catch(e) {
        print(e);
      }
    } 
    
    return grid;
  }
  
}