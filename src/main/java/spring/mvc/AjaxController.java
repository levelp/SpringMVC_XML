package spring.mvc;

import core.Primes;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

/**
 * Работа с Ajax-запросами
 */
@RestController
@RequestMapping("/ajax")
public class AjaxController {
    /**
     * Увеличение счётчка на 1 без перезагрузки страницы REST API + Ajax
     */
    @RequestMapping(value = "/inc/{value}")
    public String inc(@PathVariable("value") int value) {
        int v = value + 1;
        if (v > 100) v = 0;
        return Integer.toString(v);
    }

    @RequestMapping(value = "/dec/{value}")
    public String dec(@PathVariable("value") int value) {
        int v = value - 1;
        if (v < 0) v = 100;
        return Integer.toString(v);
    }

    @RequestMapping(value = "/primes/{from}/{to}",
            produces = MediaType.APPLICATION_JSON_VALUE)
    //@ResponseBody // List<Long>
    public String primes(@PathVariable("from") long from,
                         @PathVariable("to") long to) {
        List<Long> p = new ArrayList<>();
        for (long i = from; i < to; i++) {
            if (Primes.isPrime(i))
                p.add(i);
        }
        String s = "[";
        for (int i = 0; i < p.size() - 1; i++) {
            s += p.get(i) + ", ";
        }
        s += p.get(p.size() - 1) + "]";
        return s;
    }
}
