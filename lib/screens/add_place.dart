import 'package:favorite_place/models/place.dart';
import 'package:favorite_place/providers/user_places_provider.dart';
import 'package:favorite_place/widgets/image_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceState();
}

class _AddPlaceState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _onSavePlace() {
    final enteredTitle = _titleController.text;

    if (enteredTitle.isEmpty) {
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(_titleController.text);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Place"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(label: Text('Title')),
              keyboardType: TextInputType.text,
              controller: _titleController,
            ),
            const SizedBox(
              height: 10,
            ),
            //Image Input
            const ImageInput(),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
                onPressed: _onSavePlace,
                icon: const Icon(Icons.add),
                label: const Text('Add Place'))
          ]),
        ),
      ),
    );
  }
}
