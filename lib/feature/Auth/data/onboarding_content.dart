class OnbordingContent {
  String image;
  String title;
  String discription;

  OnbordingContent({ required this.image,required this.title,required this.discription});
}

List<OnbordingContent> contents = [
  OnbordingContent(
    title: 'Meet Doctors Online',
    image: 'assets/images/onboardingone.png',
    discription: "Connect with Specialized Doctors Online for ""Convenient and Comprehensive Medical"
    "Consultations."
  ),
  OnbordingContent(
    title: 'Connect with Specialists',
    image: 'assets/images/onboardingsec.png',
    discription: "Connect with Specialized Doctors Online for ""Convenient and Comprehensive Medical"
    "Consultations."
  
  ),
  OnbordingContent(
    title: 'Thousands of Online Specialists',
    image: 'assets/images/onboarding3.png',
    discription: "Connect with Specialized Doctors Online for ""Convenient and Comprehensive Medical"
    "Consultations."
  ),
];
