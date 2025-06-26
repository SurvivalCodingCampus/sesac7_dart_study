import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';
import 'package:modu_3_dart_study/assignments/2025-06-25/serialization_practice.dart';

void main() {
  test('Employee and Department constructor', () {
    //given
    final Employee kim = Employee("Kim", 30);
    final Department genetics = Department("genetics", kim);
    //when

    //then
    expect(kim.name, equals("Kim"));
    expect(kim.age, equals(30));
    expect(genetics.name, equals("genetics"));
    expect(genetics.leader.name, equals("Kim"));
    expect(genetics.leader.age, equals(30));
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
    expect(newKim.name, equals(kim.name));
    expect(newKim.age, equals(kim.age));
    expect(newGenetics.name, equals(genetics.name));
    expect(newGenetics.leader.name, equals(genetics.leader.name));
    expect(newGenetics.leader.age, equals(genetics.leader.age));
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
    expect(newKim.name, equals(kim.name));
    expect(newKim.age, equals(kim.age));
    expect(newGenetics.name, equals(genetics.name));
    expect(newGenetics.leader.name, equals(genetics.leader.name));
    expect(newGenetics.leader.age, equals(genetics.leader.age));
    expect(newKim != kim, true);
    expect(newGenetics != genetics, true);
  });
}
