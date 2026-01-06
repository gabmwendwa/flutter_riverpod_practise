# Flutter Riverpod Practise

In this project I am practising state management using Riverpod in Flutter.

## Install Rivepod

In the terminal, make sure you are in your project directory and run the following command to run the command below:
```Installing flutter_riverpod
$ flutter pub add flutter_riverpod
```
This will add the package to the `pubspec.yaml` file:
```
dependencies:
  flutter_riverpod: ^latest_version
```
## Project Structure
### Step One: Create Providers with Read-Only State Values
Create read-only state value using providers
```
...

final productsProvider = Provider((ref) {
  return allProducts;
});

final reducedProductsProvider = Provider((ref) {
  return allProducts.where((p) => p.price < 50).toList();
});

...
```
### Step Two: Create Stateless Consumers
In main.dart, the entire application is wrapped by a ProviderScope to outline the scope in which the providers can be used within the application.
```
...
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
...
```
In home_screen.dart, extend ConsumerWidget instead of StatelessWidget in the HomeScreen class to consume the providers created. It should look like this:
```
...
class HomeScreen extends ConsumerWidget {
  ...
}
...
```
In the build widget we should reference and consume the provider as follows:
```
...
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withAlpha(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      allProducts[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    allProducts[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$${allProducts[index].price}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
...
```