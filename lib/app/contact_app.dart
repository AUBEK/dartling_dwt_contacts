part of contacts_mvc_app;

/**
 * Contacrt Application entry point.
 */
class ContactApp {
  
  ContactsModels domain;
  DomainSession session;
  //Tasks tasks;
  Contacts contacts;
  
  ContactForm contactform;
  ContactList contactlist;
  
  /**
   * Create new instance of [ContactApp].
   */
  ContactApp(this.domain) {
    
    session = domain.newSession();
    MvcEntries model = domain.getModelEntries('mvc');
    contacts = model.contacts;

    contactform = new ContactForm(this);
    ContactFct contactfct = new ContactFct(this);
    contactlist = new ContactList(this, contacts);
    
  }

  /**
   * Save list of contact to local storage.
   */
  save() {
    window.localStorage['contacts-dartling-dwt'] = JSON.encode(contacts.toJson());
  }

}