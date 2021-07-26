# Upcaster

Upcaster 通常擋在 Queue 跟 Consumer 之間, 它負責做事件版本的轉換

![](/spaces/event-sourcing/attachments/upcaster.png)

## Trafe off

要注意的是, 當時間一久, 這種模式下 Upcaster 很容易的會失控跟維護, 因次他會有有大量的轉換邏輯在其中

![](/spaces/event-sourcing/attachments/upcaster-chaos.png)