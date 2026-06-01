import ProductForm from "./Form";
import { create } from "../../api/fetch-wrapper";
import { useNavigate } from "react-router";

export default function ProductAdd() {

    const navigate = useNavigate();
    const handleSubmit = async (productData) => {
        const newProduct = await create("products", productData);

        //redirect to the product detail page after successful creation
        navigate(`/products/${newProduct.productID}`);
    };

    return (
        <div>
            <h2>Add Product</h2>
            <ProductForm onSubmit={handleSubmit} />
        </div>
    );
}