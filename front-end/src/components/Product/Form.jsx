import {useEffect, useState} from 'react';
import {read} from "../../api/fetch-wrapper";
import {Link} from "react-router";

const emptyForm = {
    productName: '',
    categoryID: '',
    subCategoryID: '',
    unitPrice: '',
    inventory: ''
};

export default function ProductForm({ initialValues = emptyForm, onSubmit }) {
    const [form, setForm] = useState(initialValues);
    const [errors, setErrors] = useState(null);
    const [isSubmitting, setIsSubmitting] = useState(false);
    const [categories, setCategories] = useState([]);
    const [subCategories, setSubCategories] = useState([]);

    useEffect(() => {
        const fetchCategories = async () => {
            try {
                const data = await read("categories");
                setCategories(data);
            } catch (error) {
                setErrors(error.message);
            }
        };

        const fetchSubCategories = async () => {
            try {
                const data = await read("subcategories");
                setSubCategories(data);
            } catch (error) {
                setErrors(error.message);
            }
        };

        fetchCategories();
        fetchSubCategories();
    }, []);

    const handleChange = event => {
        const {name, value} = event.target;
        setForm(prevForm => ({
            ...prevForm,
            [name]: value
        }));
    }

    const validateProductName = (name) => {
        if (!name || !name.trim()) {
            return "Product name is required.";
        }

        name = name.trim();

        if (name.length < 3) {
            return "Product name must be at least 3 characters.";
        }

        if (name.length > 150) { 
            return "Product name cannot exceed 150 characters.";
        }

        const validPattern = /^[A-Za-z0-9\s\-()'&]+$/;
        if (!validPattern.test(name)) {
            return "Product name contains invalid characters.";
        }

        return null;
    };


    const handleSubmit = async event => {
        event.preventDefault();
        setErrors(null);

        const nameError = validateProductName(form.productName);
        if (nameError) {
            setErrors(nameError);
            return;
        }

        setIsSubmitting(true);

        try {
            await onSubmit({
                productName: form.productName.trim(),
                categoryID: parseInt(form.categoryID),
                subCategoryID: parseInt(form.subCategoryID),
                unitPrice: parseFloat(form.unitPrice),
                inventory: parseInt(form.inventory)
            });
        } catch (error) {
            setErrors(error.message);
        } finally {
            setIsSubmitting(false);
        }
    };


    return (
        <form onSubmit={handleSubmit}>
            {errors && <p style={{color: "red"}}>{errors}</p>}
            <div>
                <label for="productName">Product Name:</label>
                <input
                type="text"
                name="productName"
                value={form.productName}
                onChange={handleChange}
                required
                />
            </div>
            <div>
                <label for="categoryID">Category:</label>
                <select
                name="categoryID"
                value={form.categoryID}
                onChange={handleChange}
                required
                >
                    <option value="">Select a category</option>
                    {categories.map(category => (
                        <option key={category.categoryID} value={category.categoryID}>
                            {category.categoryName}
                        </option>
                        
                    ))}
                </select>
            </div>

            <div>
                <label for="subCategoryID">Subcategory:</label>
                <select
                name="subCategoryID"
                value={form.subCategoryID}
                onChange={handleChange}
                required
                >
                    <option value="">Select a subcategory</option>
                    {subCategories.map(subCategory => (
                        <option key={subCategory.subCategoryID} value={subCategory.subCategoryID}>
                            {subCategory.subCategoryName}
                        </option>
                    ))}
                </select>
            </div>
            <div>
                <label for="unitPrice">Unit Price:</label>
                <input
                type="number"
                name="unitPrice"
                min="0"
                step="0.01"
                value={form.unitPrice}
                onChange={handleChange}
                required
                />
            </div>
            <div>
                <label for="inventory">Inventory:</label>
                <input
                type="number"
                name="inventory"
                min="0"
                step ="1"
                value={form.inventory}
                onChange={handleChange}
                required
                />
            </div>

            <button type="submit" disabled={isSubmitting}>
                {isSubmitting ? "Submitting..." : "Submit"}
            </button>
            <Link to={`/products`}>
                <button>Cancel</button>
            </Link>
        </form>
    )
}