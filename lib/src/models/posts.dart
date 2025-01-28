class Posts {
  final String logo;
  final String name;
  final String paragraph;
  final List<String> images;
  final int likes;
  final int comments;

  Posts(
      {required this.logo,
      required this.name,
      required this.paragraph,
      required this.images,
      required this.likes,
      required this.comments});
}

List<Posts> postData = [
  Posts(
    logo: "assets/images/image.jpeg", 
    name: "Param ji Lamba", 
    paragraph: "Aditi he Sheetal hai , to phir Nisha kon h , Nisha Nisha hai , to phir Munni kon h , Munni he to Aditi h . behen darr gyi !!", 
    images: [
      "assets/images/image.jpeg","assets/images/reel.jpg","assets/images/image3.jpeg"
    ], 
    likes: 348, 
    comments: 67
  )
];