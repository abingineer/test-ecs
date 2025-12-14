import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {

    @GetMapping("/")
    public String hello() {
        return "Hello World";
    }

    @GetMapping("/users")
    public List<String> getUsers() {
        return List.of("user1", "user2", "user3");
    }
}
