class Datas {
  String dateSubmitted;
  String reference;
  String collegeName;
  String signUpReferral;
  String bankName;
  String wpUserId;
  String courseProduct;
  String otherCollegeName;
  String fullName;
  String phoneNumber;
  String admissionLetter;
  String cvResume;
  String photo;
  String kycDoc;
  String panCard;
  String passportFront;
  String passportBack;
  String entranceScoreCard;
  String languageScoreCard;
  String workingStatus;
  String businessProof;
  String itrProof;
  String caAuditReport;
  String businessBankAccountStatement;
  String form26as;
  String salarySlip;
  String studentBankStatement;
  String form16;
  String coApplicantName;
  String coApplicantPan;
  String coApplicantAadharCard;
  String coApplicantAddressProof;
  String coApplicantRentAgreement;
  String collateralAttached;
  String fixedDeposit;
  String propertyDocument;
  String sanctionedLoanAmount;
  String availedLoanAmount;
  String status;
  String emailId;

  Datas(
      {this.dateSubmitted,
      this.reference,
      this.collegeName,
      this.signUpReferral,
      this.bankName,
      this.wpUserId,
      this.courseProduct,
      this.otherCollegeName,
      this.fullName,
      this.phoneNumber,
      this.admissionLetter,
      this.cvResume,
      this.photo,
      this.kycDoc,
      this.panCard,
      this.passportFront,
      this.passportBack,
      this.entranceScoreCard,
      this.languageScoreCard,
      this.workingStatus,
      this.businessProof,
      this.itrProof,
      this.caAuditReport,
      this.businessBankAccountStatement,
      this.form26as,
      this.salarySlip,
      this.studentBankStatement,
      this.form16,
      this.coApplicantName,
      this.coApplicantPan,
      this.coApplicantAadharCard,
      this.coApplicantAddressProof,
      this.coApplicantRentAgreement,
      this.collateralAttached,
      this.fixedDeposit,
      this.propertyDocument,
      this.sanctionedLoanAmount,
      this.availedLoanAmount,
      this.status,
      this.emailId});

  factory Datas.fromJson(Map<String, dynamic> json) {
    return Datas(
      dateSubmitted: json['date_submitted'],
      reference: json['reference'],
      collegeName: json['college_name'],
      signUpReferral: json['sign_up_referral'],
      bankName: json['bank_name'],
      wpUserId: json['wp_user_id'],
      courseProduct: json['course_product'],
      otherCollegeName: json['other_college_name'],
      fullName: json['full_name'],
      phoneNumber: json['phone_number'],
      admissionLetter: json['admission_letter'],
      cvResume: json['cv_resume'],
      photo: json['photo'],
      kycDoc: json['kyc_doc'],
      panCard: json['pan_card'],
      passportFront: json['passport_front'],
      passportBack: json['passport_back'],
      entranceScoreCard: json['entrance_score_card'],
      languageScoreCard: json['language_score_card'],
      workingStatus: json['working_status'],
      businessProof: json['business_proof'],
      itrProof: json['itr_proof'],
      caAuditReport: json['ca_audit_report'],
      businessBankAccountStatement: json['business_bank_account_statement'],
      form26as: json['form_26as'],
      salarySlip: json['salary_slip'],
      studentBankStatement: json['student_bank_statement'],
      form16: json['form16'],
      coApplicantName: json['co_applicant_name'],
      coApplicantPan: json['co_applicant_pan'],
      coApplicantAadharCard: json['co_applicant_aadhar_card'],
      coApplicantAddressProof: json['co_applicant_address_proof'],
      coApplicantRentAgreement: json['co_applicant_rent_agreement'],
      collateralAttached: json['collateral_attached'],
      fixedDeposit: json['fixed_deposit'],
      propertyDocument: json['property_document'],
      sanctionedLoanAmount: json['sanctioned_loan_amount'],
      availedLoanAmount: json['availed_loan_amount'],
      status: json['status'],
      emailId: json['email_id'],
    );
  }
}
