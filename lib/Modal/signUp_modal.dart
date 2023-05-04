class SignUpModal {
  String? id;
  String? image;
  String? name;
  String? mobile;
  String? email;
  String? password;
  String? gender;
  String? otp;
  String? otpVerifyStatus;
  String? status;
  bool? result;
  String? message;

  SignUpModal(
      {this.id,
        this.image,
        this.name,
        this.mobile,
        this.email,
        this.password,
        this.gender,
        this.otp,
        this.otpVerifyStatus,
        this.status,
        this.result,
        this.message});

  SignUpModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    otp = json['otp'];
    otpVerifyStatus = json['otp_verify_status'];
    status = json['status'];
    result = json['result'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['otp'] = this.otp;
    data['otp_verify_status'] = this.otpVerifyStatus;
    data['status'] = this.status;
    data['result'] = this.result;
    data['message'] = this.message;
    return data;
  }
}
