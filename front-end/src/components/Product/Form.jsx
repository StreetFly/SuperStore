import {useEffect, useState} from 'react';
import {read} from "../../api/fetch-wrapper";

const emptyForm = {
    productName: '',
    categoryID: '',
    subCategoryID: '',
    unitPrice: '',
    inventory: ''
};

export default function ProductForm(initialValues = emptyForm) {
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

    return (
        <form>
            {errors && <p style={{color: "red"}}>{errors}</p>}
            <div>
                <label for="categoryID">Category:</label>
                <select
                name="categoryID"
                value={form.categoryID}
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
        </form>
    )
}