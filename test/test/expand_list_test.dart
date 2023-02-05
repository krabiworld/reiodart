import 'package:reio/expand.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

class Banana {
  String peel;
  String pulp;

  Banana(this.peel, this.pulp);
}

void main() {
  List<Banana> differentList = [
    Banana('90%', '10%'),
    Banana('20%', '80%'),
    Banana('10%', '90%')
  ];
  List<Banana> sameList = [Banana('40%', '60%'), Banana('40%', '60%')];

  test('compareClassOfList(): different classes', () {
    expect(
        compareClassOfList<Banana>(differentList, sameList, (c) {
          return c.peel + c.pulp;
        }),
        equals(false));
  });

  test('compareClassOfList(): same classes', () {
    expect(
        compareClassOfList<Banana>(sameList, sameList, (c) {
          return c.peel + c.pulp;
        }),
        equals(true));
  });
}
