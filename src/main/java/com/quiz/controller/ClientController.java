package com.quiz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.dao.QuestionDao;
import com.quiz.model.Question;

import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController {

	@GetMapping("/")
	public String chome(Model model) {
		String[] facts = {
		        "“You’re basically a limited edition.” 🧬✨<br>Even identical twins have different personalities — so if you ever feel basic, remember: there’s literally no copy of you on Earth. Mic drop 🎤😌",
		        "“Your playlist is your personality’s diary.” 🎧<br>Pop lovers = party energy 💃, Lo-fi fans = deep thinkers 🧠, and metalheads = calm souls who just need loud therapy 🎸🔥",
		        "“Your face snitches on your feelings.” 😅<br>You can say “I’m fine,” but your eyebrows, hands, and eye-rolls are like: she’s lying, bro. 🤨🙄",
		        "“You age like fine wine… personality-wise.” 🍷<br>The older you get, the less drama you tolerate and the more peace you crave — maturity is just learning to say “nah, I’m good.” 😌🛋️",
		        "“Life is your personal editor.” 🖋️🌍<br>Every friendship, heartbreak, and weird phase (yes, even the 2014 cringy one) helped write your current personality. You’re a walking remix 🎶✨",
		        "“Your vibe decides your tribe.” 😌💫<br>You attract people with similar energy — so if you keep meeting drama, maybe your Wi-Fi’s set to “chaotic frequency.” 📡🔥",
		        "“Your brain has a favorite season.” 🧠🍂☀️<br>Some people feel extra creative in the rain 🌧️, while others only function when it’s sunny ☀️ — your mood literally changes with the weather like a walking forecast app! 📱🌈",
		        "“You’re secretly 3 people in one.” 😏🤹‍♀️<br>There’s the ‘you’ at home (lazy genius 🛋️), the ‘you’ with friends (comedian energy 😂), and the ‘you’ in public (polite and confused 🫠). All valid. All iconic.",
		        "“Confidence isn’t volume — it’s Wi-Fi strength.” 📶😎<br>Some people shout it, some just radiate it quietly. Either way, when your signal’s strong, everyone notices. 💥",
		        "“Your personality has a color palette.” 🎨✨<br>If you were a color, your confidence might be gold 💛, your calmness sky blue 💙, and your chaos neon pink 💖 — basically, you’re your own aesthetic!"
		    };
		int randomIndex = (int) (Math.random() * facts.length);
	    model.addAttribute("personalityFact", facts[randomIndex]);

	    return "cHome";

	}
	
	@Autowired
	private QuestionDao quesDao;

	@GetMapping("/quiz")
	public String showQuestion(HttpSession session, Model model) {
	    List<Question> questions = quesDao.getAllQuestion();

	    // Track current index
	    Integer index = (Integer) session.getAttribute("quizIndex");
	    if (index == null) index = 0;

	    // If quiz is complete
	    if (index >= questions.size()) {
	        return "redirect:/result";
	    }

	    // Get current question
	    Question current = questions.get(index);
	    model.addAttribute("question", current);

	    return "quiz";
	}
	@PostMapping("/nextQuestion")
	public String nextQuestion(@RequestParam("qid") int qid,
	                           @RequestParam("selected") int selected,
	                           HttpSession session) {

	    // Store answer as integer count per QID
	    Map<Integer, Integer> answerMap = (Map<Integer, Integer>) session.getAttribute("answerMap");
	    if (answerMap == null) answerMap = new HashMap<>();

	    answerMap.put(qid, selected); // e.g., QID 1 → Option 2
	    session.setAttribute("answerMap", answerMap);

	    // Move to next question
	    Integer index = (Integer) session.getAttribute("quizIndex");
	    if (index == null) index = 0;
	    session.setAttribute("quizIndex", index + 1);

	    return "redirect:/quiz";
	}
	
	
	@GetMapping("/result")
	public String showResult(HttpSession session, Model model) {
	    Map<Integer, Integer> answerMap = (Map<Integer, Integer>) session.getAttribute("answerMap");

	    int count1 = 0, count2 = 0, count3 = 0;

	    for (int selected : answerMap.values()) {
	        if (selected == 1) count1++;
	        else if (selected == 2) count2++;
	        else if (selected == 3) count3++;
	    }

	    String resultTitle = "";
	    String resultDesc = "";
        
	   
	    if (count1 == count2 && count2 == count3) {
	        resultTitle = "Perfect Blend ✨";
	        resultDesc = "You’ve got the rarest balance — calm, curious, and confident. You vibe with everyone and fit into any mood or moment. You’re an all-rounder — a mix of dreamer, explorer, and butterfly. You make life look effortless and fun. 💫";
	    } 
	    else if (Math.abs(count1 - count2) <= 2 && count1 >= count3 && count2 >= count3) {
	        resultTitle = "Grounded Adventurer 🌻";
	        resultDesc = "You balance peace and thrill like a pro. You can meditate at sunrise and go hiking by sunset. You’re thoughtful but always up for fun. Calm soul, daring heart — best of both worlds. 🌅🌲";
	    }  
	    else if (Math.abs(count2 - count3) <= 2 && count2 >= count1 && count3 >= count1) {
	        resultTitle = "Dynamic Free Spirit ⚡";
	        resultDesc = "You’re unstoppable, spontaneous, and magnetic. You follow your heart — no maps needed. Whether it’s a concert, a road trip, or a new dream — you’re all in! You don’t chase trends — you start them. 🚗💨";
	    }  
	    else if (Math.abs(count1 - count3) <= 2 && count1 >= count2 && count3 >= count2) {
	        resultTitle = "Balanced Artist 🎨";
	        resultDesc = "You see the world like a canvas — full of colors, emotions, and stories. You’re deep yet cheerful, emotional yet logical. You create happiness through your thoughts and actions. You’re the perfect mix of chill and charm. 🌸🎶";
	    }
	    
	    else if (count1 > count2 && count1 > count3) {
	        resultTitle = "Calm Dreamer 🌿";
	        resultDesc = "You’re the definition of peace in chaos. You love cozy spaces, soulful music, and late-night deep talks. People come to you for calm energy and honest vibes. Your world = comfort, creativity, and good coffee. ☕💭";
	    }
	    else if (count2 > count1 && count2 > count3) {
	        resultTitle = "Wild Explorer 🔥";
	        resultDesc = "Adventure is your middle name! You live for spontaneous plans, new roads, and bold choices. You don’t wait for the weekend — you create it. Your vibe: fearless heart, endless stories. 🌄🎒";
	    } 
	    else if (count3 > count1 && count3 > count2) {
	        resultTitle = "Social Butterfly 🌈";
	        resultDesc = "You bring the energy wherever you go! Everyone loves your laugh, your style, your vibe. You’re always planning the next hangout, the next selfie, the next fun! Life with you = full volume and zero dull moments. 💃✨";
	    }
	    
	    
	    
//	    if (count1 == count2 && count2 == count3) {
//	        resultTitle = "Perfect Blend ✨";
//	        resultDesc = "You’ve got the rarest balance — calm, curious, and confident. You vibe with everyone and fit into any mood or moment. You’re an all-rounder — a mix of dreamer, explorer, and butterfly. You make life look effortless and fun. 💫";
//	    } 
//	    if (Math.abs(count1 - count2) <= 2 && count1 >= count3 && count2 >= count3) {
//	        resultTitle = "Grounded Adventurer 🌻";
//	        resultDesc = "You balance peace and thrill like a pro. You can meditate at sunrise and go hiking by sunset. You’re thoughtful but always up for fun. Calm soul, daring heart — best of both worlds. 🌅🌲";
//	    }  
//	    if (Math.abs(count2 - count3) <= 2 && count2 >= count1 && count3 >= count1) {
//	        resultTitle = "Dynamic Free Spirit ⚡";
//	        resultDesc = "You’re unstoppable, spontaneous, and magnetic. You follow your heart — no maps needed. Whether it’s a concert, a road trip, or a new dream — you’re all in! You don’t chase trends — you start them. 🚗💨";
//	    }  
//	    if (Math.abs(count1 - count3) <= 2 && count1 >= count2 && count3 >= count2) {
//	        resultTitle = "Balanced Artist 🎨";
//	        resultDesc = "You see the world like a canvas — full of colors, emotions, and stories. You’re deep yet cheerful, emotional yet logical. You create happiness through your thoughts and actions. You’re the perfect mix of chill and charm. 🌸🎶";
//	    }

	    model.addAttribute("resultTitle", resultTitle);
	    model.addAttribute("resultDesc", resultDesc);
	    return "result";
	}

	@GetMapping("/retake")
	public String resetQuiz(HttpSession session) {
	    session.removeAttribute("quizIndex");
	    session.removeAttribute("answerMap");
	    return "redirect:/quiz";
	}

	@GetMapping("/startQuiz")
	public String startQuiz(HttpSession session) {
	    session.removeAttribute("quizIndex");
	    session.removeAttribute("answerMap");
	    session.setAttribute("quizIndex", 0);
	    return "redirect:/quiz";
	}
     
	
//	@GetMapping("/")
//	public String chome(Model model) {
//	    String[] facts = {
//	        "“You’re basically a limited edition.” 🧬✨<br>Even identical twins have different personalities — so if you ever feel basic, remember: there’s literally no copy of you on Earth. Mic drop 🎤😌",
//	        "“Your playlist is your personality’s diary.” 🎧<br>Pop lovers = party energy 💃, Lo-fi fans = deep thinkers 🧠, and metalheads = calm souls who just need loud therapy 🎸🔥",
//	        "“Your face snitches on your feelings.” 😅<br>You can say “I’m fine,” but your eyebrows, hands, and eye-rolls are like: she’s lying, bro. 🤨🙄",
//	        "“You age like fine wine… personality-wise.” 🍷<br>The older you get, the less drama you tolerate and the more peace you crave — maturity is just learning to say “nah, I’m good.” 😌🛋️",
//	        "“Life is your personal editor.” 🖋️🌍<br>Every friendship, heartbreak, and weird phase (yes, even the 2014 cringy one) helped write your current personality. You’re a walking remix 🎶✨",
//	        "“Your vibe decides your tribe.” 😌💫<br>You attract people with similar energy — so if you keep meeting drama, maybe your Wi-Fi’s set to “chaotic frequency.” 📡🔥",
//	        "“Your brain has a favorite season.” 🧠🍂☀️<br>Some people feel extra creative in the rain 🌧️, while others only function when it’s sunny ☀️ — your mood literally changes with the weather like a walking forecast app! 📱🌈",
//	        "“You’re secretly 3 people in one.” 😏🤹‍♀️<br>There’s the ‘you’ at home (lazy genius 🛋️), the ‘you’ with friends (comedian energy 😂), and the ‘you’ in public (polite and confused 🫠). All valid. All iconic.",
//	        "“Confidence isn’t volume — it’s Wi-Fi strength.” 📶😎<br>Some people shout it, some just radiate it quietly. Either way, when your signal’s strong, everyone notices. 💥",
//	        "“Your personality has a color palette.” 🎨✨<br>If you were a color, your confidence might be gold 💛, your calmness sky blue 💙, and your chaos neon pink 💖 — basically, you’re your own aesthetic!"
//	    };
//
//	    int randomIndex = (int) (Math.random() * facts.length);
//	    model.addAttribute("personalityFact", facts[randomIndex]);
//
//	    return "cHome";
//	}



	
}
