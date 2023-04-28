class Dashboard {
  int? usersNum;
  int? activeUsersnNum;
  int? pendingUsersnNum;
  int? inActiveUsersnNum;
  int? adminsNum;
  int? supervisorsNum;
  int? buyersNum;
  int? suppliersNum;
  Dashboard({
    this.usersNum,
    this.activeUsersnNum,
    this.pendingUsersnNum,
    this.inActiveUsersnNum,
    this.adminsNum,
    this.supervisorsNum,
    this.buyersNum,
    this.suppliersNum,
  });

  factory Dashboard.fromJson(Map<String, dynamic> data) {
    return Dashboard(
        usersNum: data['usersNum'],
        activeUsersnNum: data['activeUsersnNum'],
        pendingUsersnNum: data['pendingUsersnNum'],
        inActiveUsersnNum: data['inActiveUsersnNum'],
        adminsNum: data['adminsNum'],
        supervisorsNum: data['supervisorsNum'],
        buyersNum: data['buyersNum'],
        suppliersNum: data['suppliersNum']);
  }
}
