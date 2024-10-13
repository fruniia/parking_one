import 'package:parking_one/models/person.dart';
import 'package:parking_one/repositories/repository.dart';

class PersonRepository extends Repository<Parking> {
  PersonRepository._privateConstructor();

  static final PersonRepository _instance =
      PersonRepository._privateConstructor();

  factory PersonRepository() => _instance;
  static final List<Parking> _persons = [];

  List<Parking> get allPersons => _persons;

  void addPerson(Parking person) {
    _persons.add(person);
    add(person);
  }

  void removePerson(Parking person) {
    _persons.remove(person);
    delete(person);
  }

  //Only option is to update name
  void updatePerson(int index, Parking updatedPerson) {
    _persons[index].name = updatedPerson.name;
    update(index, updatedPerson);
  }
}
