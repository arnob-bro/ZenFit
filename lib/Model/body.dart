class Body{
  double? neck;
  double? shoulders;
  double? leftUpperArm;
  double? rightUpperArm;
  double? leftForearm;
  double? rightForearm;
  double? leftThigh;
  double? rightThigh;
  double? leftCalf;
  double? rightCalf;
  double? bodyWeight;
  double? chest;
  double? waist;
  double? hips;
  int? date;

  Body({
    required this.neck,
    required this.shoulders,
    required this.leftUpperArm,
    required this.rightUpperArm,
    required this.leftForearm,
    required this.rightForearm,
    required this.leftThigh,
    required this.rightThigh,
    required this.leftCalf,
    required this.rightCalf,
    required this.bodyWeight,
    required this.chest,
    required this.waist,
    required this.hips,
    required this.date,
  });

  Map<String, dynamic> toJson() => {
    'neck' : neck,
    'shoulders' : shoulders,
    'leftUpperArm' : leftUpperArm,
    'rightUpperArm' : rightUpperArm,
    'leftForearm' : leftForearm,
    'rightForeArm' : rightForearm,
    'leftThigh' : leftThigh,
    'rightThigh' : rightThigh,
    'leftCalf' : leftCalf,
    'rightCalf' : rightCalf,
    'bodyWeight' : bodyWeight,
    'chest' : chest,
    'waist' : waist,
    'hips' : hips,
    'date' : date
  };

}