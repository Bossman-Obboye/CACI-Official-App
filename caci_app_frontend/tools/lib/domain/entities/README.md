# Entities

Entities are the main building blocks of the app. They represent the important data and rules that define how the app works. Think of them as the "blueprints" for the key parts of the app, like orders, customers, or products.

## Key Features:
1. **Independent**: Entities don’t depend on any specific tools or frameworks. This makes them easy to reuse in different parts of the app or even in other projects.
2. **Core Rules**: They include the main rules and logic that describe how the data should behave.
3. **Data and Actions**: Entities have fields (like name, price, or quantity) to store data and methods (actions) to work with that data.
4. **Not About Storage**: Entities don’t worry about where or how the data is saved (like in a database). They only focus on the app's logic.

## Example:
For example, in an online shopping app, an `Order` entity might look like this:

```typescript
class Order {
    constructor(
        public orderId: string,
        public customerId: string,
        public items: OrderItem[],
        public totalAmount: number
    ) {}

    // Rule: Calculate the total price of the order
    calculateTotal(): void {
        this.totalAmount = this.items.reduce((sum, item) => sum + item.price * item.quantity, 0);
    }

    // Action: Add a new item to the order
    addItem(item: OrderItem): void {
        this.items.push(item);
        this.calculateTotal();
    }
}

class OrderItem {
    constructor(
        public productId: string,
        public quantity: number,
        public price: number
    ) {}
}
