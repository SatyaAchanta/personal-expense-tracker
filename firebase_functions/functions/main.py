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


@firestore_fn.on_document_created(document="testing/{doc_id}")
def makeuppercase(
    event: firestore_fn.Event[firestore_fn.DocumentSnapshot | None],
) -> None:

    if event.data is None:
        return
    try:
        original = event.data.get("original")
    except:
        return

    uppercase = original.upper()
    event.data.reference.update({"uppercase": uppercase})


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

    current_year = datetime.now().year
    current_month = datetime.now().month

    full_current_year = datetime.now().strftime("%Y")
    full_current_month = datetime.now().strftime("%B")

    # Add the new document to user-expenses collection
    user_expenses_ref = firestore_client.collection("user-expenses").document(doc_id)

    sub_expense_collection_ref = user_expenses_ref.collection(
        f"{current_year}-{current_month}"
    )

    new_document_data = {
        "info": f"Document for - {full_current_year}-{full_current_month}",
    }

    sub_expense_collection_ref.document("info").set(new_document_data)

    # Add new document to summaries collection
    summaries_ref = firestore_client.collection("summaries").document(doc_id)

    new_summary_data = {"weekly": 0, "monthly": 0, "yearly": 0}

    summaries_ref.set(new_summary_data)

    print(f"New document with ID {user_expenses_ref.id} added to another collection.")
