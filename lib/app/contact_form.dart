part of contacts_mvc_app;

class ContactForm extends ui.Composite {

  Contacts _contacts;
  Contact modContact;
  DomainSession _session;
  
  ui.CaptionPanel panel;
  ui.FlexTable layout;
  
  //ui.Label labNocon;
  ui.TextBox Txtnocon = new ui.TextBox();
  
  //ui.Label labPrenom;
  ui.TextBox Txtprenom = new ui.TextBox();
  
  //ui.Label labNom;
  ui.TextBox Txtnom = new ui.TextBox();
  
  //ui.Label labEmail;
  ui.TextBox Txtemail = new ui.TextBox();
  
  //ui.Label labTel;
  ui.TextBox Txttel = new ui.TextBox();
  
  //ui.Label labAdresse;
  ui.TextArea Txtadresse = new ui.TextArea();
  
  ui.Button BtnAdd;
  //ui.Button BtnUpdate;
  
  
  ContactForm(ContactApp contactApp) {
    _session = contactApp.session;
    _contacts = contactApp.contacts;
    
    //ContactList clist= new ContactList(contactApp, _contacts);
       
    Txtnocon.addStyleName("edit");
    Txtprenom.addStyleName("edit");
    Txtnom.addStyleName("edit");
    Txtemail.addStyleName("edit");
    Txttel.addStyleName("edit");
    Txtadresse.addStyleName("edit");
    Txtadresse.setVisibleLines(6);
    Txtadresse.setWidth("350px");
    
    BtnAdd = new ui.Button("Add", new event.ClickHandlerAdapter((event.ClickEvent event) {
      
      var num = Txtnocon.text.trim();
      var prenom = Txtprenom.text.trim();
      var nom = Txtnom.text.trim();
      var email = Txtemail.text.trim();
      var tel = Txttel.text.trim();
      var adresse = Txtadresse.text.trim();
      
      if (num != '' && prenom != '' && nom !='' && email != '' && tel != '' && adresse !=''){
        
        if(BtnAdd.text=="Add"){       
        
          // Ajoute
          
          var contact = new Contact(_contacts.concept);
          
          contact.noCon = num;
          contact.prenom = prenom;
          contact.nom = nom;
          contact.email = email;
          contact.tel = tel;
          contact.adresse = adresse;
          
          _contacts.add(contact);
          contactApp.save();  
                    
          //contactApp.contactlist.panel.setContentWidget(contactApp.contactlist.showListCont(contactApp,_contacts));
          window.location.assign(window.location.href);  
          
          
        }else{
          
          //Modification BtnAdd=Modifier  
          
          var contact1 = new Contact(_contacts.concept);
          
          contact1.noCon = num;
          contact1.prenom = prenom;
          contact1.nom = nom;
          contact1.email = email;
          contact1.tel = tel;
          contact1.adresse = adresse;
          
          _contacts.update(modContact, contact1);
          
          contactApp.save();
          
          contactApp.contactform.BtnAdd.text="Add";
          
          window.location.assign(window.location.href); 
          
        }
        
      }else{
        window.alert("Veuillez remplir tous les champ");
      }         
            
    }));
    
    
    layout = new ui.FlexTable();
    layout.setCellSpacing(3);
    layout.setWidth("500px");
    ui.FlexCellFormatter cellFormatter = layout.getFlexCellFormatter();
    // Add a title to the form
    //layout.setHtml(0, 0, "Enter Search Criteria");
    cellFormatter.setColSpan(0, 0, 2);
    cellFormatter.setHorizontalAlignment(0, 0, i18n.HasHorizontalAlignment.ALIGN_CENTER);
    
    // Add some standard form options
    layout.setHtml(1, 0, "Num Contact:");
    layout.setWidget(1, 1, Txtnocon);
    layout.setHtml(2, 0, "Prenom:");
    layout.setWidget(2, 1, Txtprenom);
    layout.setHtml(3, 0, "Nom:");
    layout.setWidget(3, 1, Txtnom);
    layout.setHtml(4, 0, "Email:");
    layout.setWidget(4, 1, Txtemail);
    layout.setHtml(5, 0, "Téléphone:");
    layout.setWidget(5, 1, Txttel);
    layout.setHtml(6, 0, "Adresse:");
    layout.setWidget(6, 1, Txtadresse);
    layout.setHtml(7, 0, "");
    layout.setWidget(7, 1, BtnAdd);
    
    // Wrap the content in a DecoratorPanel
    ui.DecoratorPanel decPanel = new ui.DecoratorPanel();
    decPanel.setWidget(layout);
    decPanel.setWidth("600px");

    panel = new ui.CaptionPanel("Formulaire Contact");    
    panel.setContentWidget(decPanel);
    panel.getElement().style.border = "2px solid black";
    //panel.getContentWidget().getElement().style.margin = "5px 10px 10px 10px";
    //panel.getContentWidget().getElement().style.padding = "10px 10px 10px 10px";
    //panel.getContentWidget().getElement().style.border = "1px solid #ccf";
    panel.setWidth("809px");
    
    ui.RootPanel.get().add(panel);
    
  }
}