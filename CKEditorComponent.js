import React from 'react';
import CKEditor from '@ckeditor/ckeditor5-react';
import ClassicEditor from '@ckeditor/ckeditor5-build-classic';

const CKEditorComponent = ({ value, onChange }) => {
  return (
    <CKEditor
      editor={ClassicEditor}
      data={value || ''}
      onChange={(event, editor) => {
        const data = editor.getData();
        onChange({ target: { name: 'content', value: data } });
      }}
    />
  );
};

export default CKEditorComponent;

