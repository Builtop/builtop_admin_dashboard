class Dashboard {
  int? usersNum;
  int? adminsNum;
  int? supervisorsNum;
  int? buyersNum;
  int? suppliersNum;
  Dashboard({
    this.usersNum,
    this.adminsNum,
    this.supervisorsNum,
    this.buyersNum,
    this.suppliersNum,
  });

  factory Dashboard.fromJson(Map<String, dynamic> data) {
    return Dashboard(
        usersNum: data['usersNum'],
        adminsNum: data['adminsNum'],
        supervisorsNum: data['supervisorsNum'],
        buyersNum: data['buyersNum'],
        suppliersNum: data['suppliersNum']);
  }
}
