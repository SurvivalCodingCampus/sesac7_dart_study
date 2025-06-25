import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-25/serialization_practice.dart';

void main() {
  test('Employee and Deparment constructor', () {
    //given
    final Employee kim = Employee("Kim", 30);
    final Department genetics = Department("genetics", kim);
    //when

    //then
    expect(kim.name == "Kim", true);
    expect(kim.age == 30, true);
    expect(genetics.name == "genetics", true);
    expect(genetics.leader.name == "Kim", true);
    expect(genetics.leader.age == 30, true);
  });

  test('Json Employee and Department', () {
    //given
    final Employee kim = Employee("Kim", 30);
    final Department genetics = Department("genetics", kim);
    //when
    final kimMap = kim.toJson();
    final newKim = Employee.fromJson(kimMap);
    final geneticsMap = genetics.toJson();
    final newGenetics = Department.fromJson(geneticsMap);
    //then
    expect(newKim.name == kim.name, true);
    expect(newKim.age == kim.age, true);
    expect(newGenetics.name == genetics.name, true);
    expect(newGenetics.leader.name == genetics.leader.name, true);
    expect(newGenetics.leader.age == genetics.leader.age, true);
    expect(newKim != kim, true);
    expect(newGenetics != genetics, true);
  });
  test('Employee and Department Serialization', () {
    //given
    final Employee kim = Employee("Kim", 30);
    final Department genetics = Department("genetics", kim);
    //when
    final File kimFile = File('kim.txt');
    final File geneticsFile = File('genetics.txt');
    kimFile.writeAsStringSync(jsonEncode(kim.toJson()));
    geneticsFile.writeAsStringSync(jsonEncode(genetics.toJson()));

    final String serializedKim = kimFile.readAsStringSync();
    final String serializedGenetics = geneticsFile.readAsStringSync();

    final mapKim = jsonDecode(serializedKim);
    final mapGenetics = jsonDecode(serializedGenetics);

    final Employee newKim = Employee.fromJson(mapKim);
    final Department newGenetics = Department.fromJson(mapGenetics);
    // then
    expect(newKim.name == kim.name, true);
    expect(newKim.age == kim.age, true);
    expect(newGenetics.name == genetics.name, true);
    expect(newGenetics.leader.name == genetics.leader.name, true);
    expect(newGenetics.leader.age == genetics.leader.age, true);
    expect(newKim != kim, true);
    expect(newGenetics != genetics, true);
  });
}
