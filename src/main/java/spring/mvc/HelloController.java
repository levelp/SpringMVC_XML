package spring.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HelloController {
    @RequestMapping(method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        model.addAttribute("message", "Hi, Java Junior group!");
        return "hello";
    }

    @RequestMapping("x")
    public String print1Welcome(ModelMap model) {
        model.addAttribute("message", "Hi, Java Junior group!");
        return "hello";
    }

/*    @RequestMapping("x")
    public String print2Welcome(ModelMap model) {
        model.addAttribute("message", "Hi, Java Junior group!");
        return "hello";
    }*/

    @RequestMapping(value = "/mul/{size}")
    public String mul(ModelMap model, @PathVariable("size") int size) {
        int m[][] = new int[size][size];
        for (int i = 0; i < size; i++) {
            for (int j = 0; j < size; j++) {
                m[i][j] = (i + 1) * (j + 1);
            }
        }
        model.addAttribute("m", m);
        return "mul";
    }

    @RequestMapping(value = "/bs")
    public String bootstrap(ModelMap model) {
        return "bs";
    }
}