import { useEffect, useState } from "react";
import ProductForm from "./Form";
import { read, update } from "../../api/fetch-wrapper";
import { useParams, useNavigate } from "react-router";

export default function ProductEdit() {
    const { id } = useParams();
    const navigate = useNavigate();
    const [initialValues, setInitialValues] = useState(null);
    const [error, setError] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchProduct = async () => {
              setLoading(true);
              try {
                const data = await read(`products/${id}`);
                setInitialValues( {
                    productName: data.productName,
                    categoryID: data.categoryID,
                    subCategoryID: data.subCategoryID,
                    unitPrice: data.unitPrice,
                    inventory: data.inventory
                })
              } catch (err) {
                setError(err.message);
              } finally {
                setLoading(false);
              }
            };
        
            fetchProduct();
          }, [id]);

          const handleUpdate = async (updateData) => {
            await update(`products/${id}`, updateData);
            navigate(`/products/${id}`);
          }

          if (loading) return <div>Loading...</div>;
          if (error) return <div>Error: {error}</div>;

    return (
        <div>
            <h2>Edit Product</h2>
            <ProductForm initialValues={initialValues} onSubmit={handleUpdate} />
        </div>
    );
}