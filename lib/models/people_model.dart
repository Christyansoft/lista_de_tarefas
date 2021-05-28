class PeopleModel {
  String name;
  int age;

  PeopleModel(
    this.name,
    this.age,
  );

  @override
  String toString() {
    return ('Nome: $name, Idade: ${age.toString()}');
  }
}
