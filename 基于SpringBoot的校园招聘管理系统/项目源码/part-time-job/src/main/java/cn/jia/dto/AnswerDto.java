package cn.jia.dto;

public class AnswerDto {
    private int id;//题号
    private String answer;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "AnswerDto{" +
                "id=" + id +
                ", answer='" + answer + '\'' +
                '}';
    }
}
