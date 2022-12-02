package ru.practicum.shareit.item.itemDto;

import lombok.Builder;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import ru.practicum.shareit.comment.Dto.CommentDto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@Slf4j
@Builder
public class ItemDto {
    private Long id;
    @NotBlank
    private String name;
    @NotBlank
    private String description;
    @NotNull
    private Boolean available;
    private LastBooking lastBooking;
    private NextBooking nextBooking;
    private Owner owner;
    private Long request;
    private List<CommentDto> comments;

    @Data
    public static class Owner {
        private final long id;
        private final String name;
    }
}
