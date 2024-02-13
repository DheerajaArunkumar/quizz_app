class Questiondb {
  static List<Map> homepageList = [
    {
      "title": "Literature",
      "itemimage":
          "https://t4.ftcdn.net/jpg/04/85/82/09/240_F_485820982_5MB1YkqGJo1r6PqObeILNkBiovSkS6gL.jpg",
    },
    {
      "title": "Sports",
      "itemimage":
          "https://i.pinimg.com/736x/0c/12/b5/0c12b581d454483e5002cd5173868c95.jpg",
    },
    {
      "title": "Science",
      "itemimage":
          "https://i.pinimg.com/564x/11/3b/c3/113bc3c47d9f1ea09fbcfee38f25feac.jpg",
    },
    {
      "title": "It",
      "itemimage":
          "https://t3.ftcdn.net/jpg/07/22/51/06/240_F_722510664_siNA6gEySBWqx6yubGFwUpdUIZ9ic1ui.jpg",
    },
  ];
  // void main() {
  static List<Map<String, dynamic>> literaturequestion = [
    {
      "question": "Who wrote the poem 'The Road Not Taken'?",
      "options": [
        "Robert Frost",
        "Emily Dickinson",
        "Langston Hughes",
        "Walt Whitman"
      ],
      "answer": 0
    },
    {
      "question": "What is the poetic form with fourteen lines?",
      "options": ["Haiku", "Sonnet", "Limerick", "Elegy"],
      "answer": 1
    },
    {
      "question": "Which poet wrote 'Howl'?",
      "options": [
        "Allen Ginsberg",
        "Sylvia Plath",
        "T.S. Eliot",
        "E.E. Cummings"
      ],
      "answer": 0
    },
    {
      "question": "What is the term for a poem expressing mourning?",
      "options": ["Ode", "Elegy", "Ballad", "Sonnet"],
      "answer": 1
    },
    {
      "question": "Who wrote the poem 'The Raven'?",
      "options": [
        "Edgar Allan Poe",
        "William Wordsworth",
        "Emily Dickinson",
        "John Keats"
      ],
      "answer": 0
    }
  ];

  static List<Map<String, dynamic>> sportsquestion = [
    {
      "question": "Which sport is played with a shuttlecock?",
      "options": ["Badminton", "Tennis", "Squash", "Table Tennis"],
      "answer": 0
    },
    {
      "question": "What is the term used for a perfect score in bowling?",
      "options": ["Strike", "Spare", "Turkey", "300"],
      "answer": 3
    },
    {
      "question": "In which country was the sport of curling invented?",
      "options": ["Scotland", "Canada", "Norway", "Russia"],
      "answer": 0
    },
    {
      "question": "Which sport is known as the 'king of sports'?",
      "options": ["Soccer", "Cricket", "Baseball", "Polo"],
      "answer": 3
    },
    {
      "question": "Who is considered the fastest man alive in track and field?",
      "options": ["Usain Bolt", "Carl Lewis", "Jesse Owens", "Michael Johnson"],
      "answer": 0
    }
  ];

  static List<Map<String, dynamic>> sciencequestion = [
    {
      "question": "What is the chemical symbol for gold?",
      "options": ["Au", "Ag", "Fe", "Cu"],
      "answer": 0
    },
    {
      "question": "Who developed the theory of relativity?",
      "options": [
        "Albert Einstein",
        "Isaac Newton",
        "Stephen Hawking",
        "Galileo Galilei"
      ],
      "answer": 0
    },
    {
      "question":
          "What is the process by which plants make their own food called?",
      "options": [
        "Photosynthesis",
        "Respiration",
        "Transpiration",
        "Fermentation"
      ],
      "answer": 0
    },
    {
      "question":
          "Which gas makes up the largest percentage of the Earth's atmosphere?",
      "options": ["Nitrogen", "Oxygen", "Carbon Dioxide", "Argon"],
      "answer": 0
    },
    {
      "question": "What is the smallest unit of matter?",
      "options": ["Atom", "Molecule", "Cell", "Electron"],
      "answer": 0
    }
  ];

  static List<Map<String, dynamic>> itquestions = [
    {
      "question": "What does 'HTML' stand for?",
      "options": [
        "Hyper Text Markup Language",
        "Hyperlinks and Text Markup Language",
        "Home Tool Markup Language",
        "Hyperlinks Tool Markup Language"
      ],
      "answer": 0
    },
    {
      "question":
          "Which programming language is commonly used for building Android apps?",
      "options": ["Java", "Python", "C++", "Swift"],
      "answer": 0
    },
    {
      "question":
          "What is the term for a software program designed to prevent unauthorized access to or from a private network?",
      "options": ["Firewall", "Router", "Modem", "Antivirus"],
      "answer": 0
    },
    {
      "question": "What does 'URL' stand for?",
      "options": [
        "Uniform Resource Locator",
        "Universal Resource Locator",
        "Uniform Resource Link",
        "Universal Resource Link"
      ],
      "answer": 0
    },
    {
      "question": "Which company developed the Java programming language?",
      "options": ["Sun Microsystems", "Microsoft", "Apple", "Google"],
      "answer": 0
    }
  ];

  static var questions;
}
