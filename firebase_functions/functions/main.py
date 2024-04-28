# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

from firebase_functions import https_fn, firestore_fn
from firebase_admin import initialize_app, firestore
import google.cloud.firestore
from datetime import *

app = initialize_app()


@https_fn.on_request()
def addmessage(req: https_fn.Request):
    original = req.args.get("text")

    if original is None:
        return https_fn.Response("No text provided", status=400)

    firestore_client: google.cloud.firestore.Client = firestore.client()
    _, doc_ref = firestore_client.collection("testing").add({"original": original})

    return https_fn.Response(f"Message with ID {doc_ref.id} added.")


@firestore_fn.on_document_created(document="users/{doc_id}")
def add_expense_document(
    event: firestore_fn.Event[firestore_fn.DocumentSnapshot | None],
) -> None:
    if event.data is None:
        return

    # read the doc_id from incoming document
    document_path = event.data.reference.path
    path_parts = document_path.split("/")

    doc_id = path_parts[-1]

    print(f"Document ID: {doc_id}")

    # write new document into expenses collection with
    # doc_id as the document id from above
    # Get the Firestore client
    firestore_client: google.cloud.firestore.Client = firestore.client()

    # Add the new document to user-expenses collection
    user_expenses_ref = firestore_client.collection("user-expenses").document(doc_id)

    sub_expense_collection_ref = user_expenses_ref.collection("expenses")

    new_document_data = {
        "info": f"Document for - {doc_id}",
    }

    # beccause we cannot create empty collection in firestore
    # we need to create a document in the collection
    sub_expense_collection_ref.document("info").set(new_document_data)

    # Add new document to summaries collection
    summaries_ref = firestore_client.collection("summaries").document(doc_id)

    new_summary_data = {"weekly": 0, "monthly": 0, "yearly": 0}

    summaries_ref.set(new_summary_data)

    print(f"New document with ID {user_expenses_ref.id} added to another collection.")


@firestore_fn.on_document_deleted(document="users/{doc_id}")
def delete_document(event: firestore_fn.Event[firestore_fn.DocumentSnapshot | None]):
    if event.data is None:
        return

    # read the doc_id from incoming document
    document_path = event.data.reference.path
    path_parts = document_path.split("/")

    doc_id = path_parts[-1]

    print(f"Document ID: {doc_id}")

    # Get the Firestore client
    firestore_client: google.cloud.firestore.Client = firestore.client()

    # Delete the document from user-expenses collection
    user_expenses_ref = firestore_client.collection("user-expenses").document(doc_id)
    user_expenses_ref.delete()

    # Delete the document from summaries collection
    summaries_ref = firestore_client.collection("summaries").document(doc_id)
    summaries_ref.delete()

    print(f"Document with ID {doc_id} deleted from another collection.")