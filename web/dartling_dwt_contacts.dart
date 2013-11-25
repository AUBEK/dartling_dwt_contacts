import 'package:contacts_mvc/contacts_mvc.dart';
import 'package:contacts_mvc/contacts_mvc_app.dart';

void main() {
  
  var repo = new ContactsRepo();
  var domain = repo.getDomainModels('contacts');
  new ContactApp(domain);
  
}

