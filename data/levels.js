window.STATIC_LEVELS = [
  {
    id: "slovenia",
    name: "Slovenia",
    emoji: "🇸🇮",
    unlocked: true,
    mapPosition: { x: 51, y: 30 },
    theme: "forest",
    collectibles: [
      {
        id: "brown_bear",
        name: "Brown Bear",
        latinName: "Ursus arctos",
        emoji: "🐻",
        fact: "Slovenia has one of the densest brown bear populations in Europe — over 1,000 bears live in the forests here!",
        x: 320, y: 300,
        forAge: "both",
        rare: false
      },
      {
        id: "honey",
        name: "Carniolan Honey",
        latinName: "Apis mellifera carnica",
        emoji: "🍯",
        fact: "Beekeeping is a protected cultural heritage in Slovenia. The Carniolan bee is famous all over the world for being calm and incredibly hardworking.",
        x: 620, y: 240,
        forAge: "both",
        rare: false
      },
      {
        id: "proteus",
        name: "Cave Olm",
        latinName: "Proteus anguinus",
        emoji: "🦎",
        fact: "The olm is a blind cave salamander found only in Slovenian caves. It can survive without food for 10 years and live to over 100!",
        x: 900, y: 280,
        forAge: "both",
        rare: false,
        power: "glide",
        powerName: "Cave Glide",
        powerDesc: "Hold ↑ while falling to drift slowly like a cave creature.",
        powerEmoji: "🌊"
      },
      {
        id: "lake_bled",
        name: "Lake Bled",
        latinName: "Lacus Bledensis",
        emoji: "🏔️",
        fact: "Lake Bled has a tiny island in the middle with a church. You have to row a wooden pletna boat to reach it — there is no motor boat allowed!",
        x: 1180, y: 220,
        forAge: "both",
        rare: false
      },
      {
        id: "triglav",
        name: "Mount Triglav",
        latinName: "Mons Tricornis",
        emoji: "⛰️",
        fact: "Triglav is Slovenia's highest peak at 2,864 metres. Every Slovenian is expected to climb it at least once in their lifetime!",
        x: 1480, y: 140,
        forAge: "11",
        rare: true,
        power: "double_jump",
        powerName: "Mountain Leap",
        powerDesc: "Press ↑ again in the air to leap a second time — like jumping from peak to peak.",
        powerEmoji: "⛰️"
      }
    ],
    postcard: {
      message: "Hey guys! I'm writing this from a tiny village surrounded by mountains and forest. Yesterday I saw a deer right outside my window. The people here make incredible honey and the rivers are the most amazing shade of turquoise. One day I'll take you both to Lake Bled — you can row a little wooden boat to an island with a church on it. Can't wait to explore more of the world with you!",
      backgroundColour: "#2D6A4F"
    }
  },
  {
    id: "japan",
    name: "Japan",
    emoji: "🇯🇵",
    unlocked: true,
    mapPosition: { x: 80, y: 32 },
    theme: "coastal",
    collectibles: [
      {
        id: "torii_gate",
        name: "Torii Gate",
        latinName: "Porta Shinto",
        emoji: "⛩️",
        fact: "Torii gates mark the entrance to Shinto shrines. They are painted red because in Japan, red keeps away evil spirits and bad luck!",
        x: 300, y: 280,
        forAge: "both",
        rare: false
      },
      {
        id: "cherry_blossom",
        name: "Cherry Blossom",
        latinName: "Prunus serrulata",
        emoji: "🌸",
        fact: "Every spring, Japan's cherry trees bloom for just one or two weeks. Families sit under them for picnics — a tradition called hanami, or 'flower viewing'.",
        x: 580, y: 230,
        forAge: "both",
        rare: false,
        power: "glide",
        powerName: "Blossom Float",
        powerDesc: "Hold ↑ while falling to drift slowly down like a petal.",
        powerEmoji: "🌸"
      },
      {
        id: "sushi",
        name: "Nigiri Sushi",
        latinName: "Oryza cum pisce",
        emoji: "🍣",
        fact: "Sushi was originally street food in Japan in the 1800s. The chef would prepare it right in front of you in seconds. Today it is eaten all around the world!",
        x: 860, y: 260,
        forAge: "both",
        rare: false
      },
      {
        id: "shinkansen",
        name: "Bullet Train",
        latinName: "Shinkansen velocissimus",
        emoji: "🚅",
        fact: "Japan's bullet trains travel at 320 km/h — faster than a cheetah! In 60 years of running, they have never had a single fatal accident.",
        x: 1150, y: 200,
        forAge: "both",
        rare: false,
        power: "dash",
        powerName: "Bullet Dash",
        powerDesc: "Press Z or Shift to burst forward at bullet-train speed.",
        powerEmoji: "⚡"
      },
      {
        id: "mt_fuji",
        name: "Mount Fuji",
        latinName: "Fujiyama sacra",
        emoji: "🗻",
        fact: "Mount Fuji is Japan's highest mountain and an active volcano. About 200,000 people climb it every year — even children your age!",
        x: 1460, y: 150,
        forAge: "11",
        rare: true,
        power: "double_jump",
        powerName: "Fuji Leap",
        powerDesc: "Press ↑ again in the air for a second jump — like leaping between cloud levels.",
        powerEmoji: "🗻"
      }
    ],
    postcard: {
      message: "Hello from Japan! I'm in a tiny ramen shop eating noodles while snow falls outside. The city is electric — millions of people, vending machines everywhere, a bullet train that blurs the trees. I went to a Shinto shrine at sunrise and it was the most peaceful place I've ever stood. I wish you could see the cherry blossoms in spring — the whole city turns pink. Sending so much love!",
      backgroundColour: "#1A3A5C"
    }
  },
  {
    // INDONESIA — Chapter 1: The Rainforest (placeholder facts — edit in admin)
    id: "indonesia",
    name: "Indonesia",
    emoji: "🇮🇩",
    unlocked: true,
    mapPosition: { x: 79, y: 62 },
    theme: "jungle",
    collectibles: [
      { id: "orangutan", name: "Orangutan", latinName: "Pongo pygmaeus", emoji: "🦧",
        fact: "(Add your orangutan story here.)", x: 780, y: 250, forAge: "both", rare: false },
      { id: "proboscis", name: "Proboscis Monkey", latinName: "Nasalis larvatus", emoji: "🐒",
        fact: "(Add your proboscis monkey story here.)", x: 1260, y: 240, forAge: "both", rare: false },
      { id: "gibbon", name: "Gibbon", latinName: "Hylobatidae", emoji: "🐒",
        fact: "(Add your gibbon story here.)", x: 2100, y: 180, forAge: "both", rare: false,
        power: "glide", powerName: "Canopy Swing", powerDesc: "Hold ↑ while falling to glide between the trees.", powerEmoji: "🌿" },
      { id: "scuba", name: "Scuba Gear", latinName: "", emoji: "🤿",
        fact: "(The key to the deep — with this I could dive into the reef.)", x: 3420, y: 260, forAge: "both", rare: false },
    ],
    postcard: {
      message: "(Chapter 1 ends here for now — the reef, the islands, and Bali come next.)",
      backgroundColour: "#1c5a44"
    }
  }
];
